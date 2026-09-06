import * as admin from "firebase-admin";
import { HttpsError, onCall } from "firebase-functions/v2/https";
import { CoachReply, CoachTurn } from "./ai/provider";
import { RulesProvider } from "./ai/rules_provider";
import { GeminiProvider, geminiApiKey } from "./ai/gemini_provider";

admin.initializeApp();

const rulesProvider = new RulesProvider();
const geminiProvider = new GeminiProvider();

const HOURLY_MESSAGE_LIMIT = 20;
const MAX_MESSAGE_LENGTH = 2000;

// ---------------------------------------------------------------------
// Saatlik hız sınırı — Firestore'da (uid + saat damgası) başına sayaç.
// ---------------------------------------------------------------------
async function checkAndConsumeHourlyRate(uid: string): Promise<boolean> {
  const db = admin.firestore();
  const hourBucket = Math.floor(Date.now() / 3_600_000);
  const ref = db.collection("aiCoachRateLimits").doc(`${uid}_${hourBucket}`);
  return db.runTransaction(async (tx) => {
    const snap = await tx.get(ref);
    const current = snap.exists ? (snap.data()?.count as number | undefined) : undefined;
    const count = current ?? 0;
    if (count >= HOURLY_MESSAGE_LIMIT) {
      return false;
    }
    tx.set(
      ref,
      {
        count: count + 1,
        uid,
        updatedAt: admin.firestore.FieldValue.serverTimestamp(),
      },
      { merge: true }
    );
    return true;
  });
}

// ---------------------------------------------------------------------
// Kriz kapısı — basit anahtar kelime taraması. Yanlış negatif vermemek
// için geniş tutulur; yanlış pozitifte kullanıcı yalnızca destekleyici
// (zararsız) bir mesaj görür, bu yüzden hassasiyet güvenli tarafta.
// ---------------------------------------------------------------------
const CRISIS_KEYWORDS: Record<string, string[]> = {
  tr: [
    "intihar", "kendimi öldür", "yaşamak istemiyorum", "ölmek istiyorum",
    "kendime zarar", "canıma kıy", "yaşamaya değmiyor", "hayatıma son",
  ],
  en: [
    "suicide", "kill myself", "end my life", "want to die",
    "self harm", "self-harm", "hurt myself", "not worth living",
  ],
  de: ["suizid", "mich umbringen", "will nicht mehr leben", "mir selbst schaden"],
  fr: ["suicide", "me tuer", "je veux mourir", "me faire du mal"],
  es: ["suicidio", "matarme", "quiero morir", "hacerme daño"],
  it: ["suicidio", "uccidermi", "voglio morire", "farmi del male"],
  nl: ["zelfmoord", "mezelf doden", "ik wil dood", "mezelf pijn doen"],
  ru: ["самоубийство", "покончить с собой", "хочу умереть", "причинить себе вред"],
  el: ["αυτοκτονία", "να σκοτωθώ", "θέλω να πεθάνω"],
  ar: ["انتحار", "أقتل نفسي", "أريد أن أموت"],
  zh: ["自杀", "杀死自己", "我想死", "伤害自己"],
};

function localeCode(locale: string): string {
  return locale.toLowerCase().split(/[-_]/)[0] || "en";
}

function detectCrisis(message: string, locale: string): boolean {
  const code = localeCode(locale);
  const words = [...(CRISIS_KEYWORDS[code] ?? []), ...(CRISIS_KEYWORDS.en ?? [])];
  const lower = message.toLowerCase();
  return words.some((w) => lower.includes(w.toLowerCase()));
}

const CRISIS_MESSAGES: Record<string, string> = {
  tr:
    "Yazdıkların şu an çok zor bir şey yaşadığını düşündürdü. Ben bir " +
    "sohbet asistanıyım ve bu konuda ihtiyacın olan desteği veremem — " +
    "lütfen güvendiğin biriyle konuş, ya da 182 Sosyal Destek Hattı'nı " +
    "ya da acil bir durumdaysan 112'yi ara. Yalnız değilsin.",
  en:
    "What you wrote sounds like you might be going through something " +
    "very difficult right now. I'm a chat assistant and can't give you " +
    "the support you may need — please reach out to someone you " +
    "trust, or a local crisis line, or emergency services if you're in " +
    "immediate danger. You are not alone.",
};

const EMERGENCY_NUMBERS: Record<string, string> = {
  TR: "112",
  US: "988",
  GB: "999",
  DE: "112",
  FR: "112",
  ES: "112",
  IT: "112",
  NL: "112",
  GR: "112",
  RU: "112",
};

function emergencyNumberFor(countryCode?: string): string | undefined {
  if (!countryCode) return undefined;
  return EMERGENCY_NUMBERS[countryCode.toUpperCase()];
}

// ---------------------------------------------------------------------
// Saatlik limit dolduğunda gösterilen mesaj.
// ---------------------------------------------------------------------
const RATE_LIMIT_MESSAGES: Record<string, string> = {
  tr:
    "Bu saat için mesaj hakkını doldurdun, biraz sonra tekrar dene. Bu " +
    "arada nefes egzersizi ya da SOS ekranı yardımcı olabilir.",
  en:
    "You've reached this hour's message limit — please try again " +
    "soon. In the meantime, the breathing exercise or SOS screen might " +
    "help.",
};

function bucketFor(map: Record<string, string>, locale: string): string {
  const code = localeCode(locale);
  return map[code] ?? (map.en as string);
}

// ---------------------------------------------------------------------
// aiCoach — istemcinin çağırdığı tek uç nokta.
// ---------------------------------------------------------------------
interface AiCoachRequest {
  message?: string;
  history?: CoachTurn[];
  locale?: string;
  countryCode?: string;
  intensity?: number;
  trigger?: string;
  hoursSmokeFree?: number;
  facts?: Record<string, unknown>;
}

export const aiCoach = onCall(
  { region: "europe-west1", secrets: [geminiApiKey] },
  async (request): Promise<CoachReply> => {
    const uid = request.auth?.uid;
    if (!uid) {
      throw new HttpsError("unauthenticated", "Giriş yapman gerekiyor.");
    }
    const data = (request.data ?? {}) as AiCoachRequest;
    const message = (data.message ?? "").trim();
    if (!message) {
      throw new HttpsError("invalid-argument", "Mesaj boş olamaz.");
    }
    if (message.length > MAX_MESSAGE_LENGTH) {
      throw new HttpsError("invalid-argument", "Mesaj çok uzun.");
    }

    const locale = data.locale ?? "en";
    const allowed = await checkAndConsumeHourlyRate(uid);
    if (!allowed) {
      return {
        text: bucketFor(RATE_LIMIT_MESSAGES, locale),
        provider: "rules",
        crisisEscalated: false,
      };
    }

    if (detectCrisis(message, locale)) {
      return {
        text: bucketFor(CRISIS_MESSAGES, locale),
        provider: "rules",
        crisisEscalated: true,
        emergencyNumber: emergencyNumberFor(data.countryCode),
      };
    }

    const coachContext = {
      message,
      history: data.history ?? [],
      locale,
      countryCode: data.countryCode,
      intensity: data.intensity,
      trigger: data.trigger,
      hoursSmokeFree: data.hoursSmokeFree,
      facts: data.facts ?? {},
    };

    let text: string;
    let providerName: string;
    try {
      text = await geminiProvider.complete(coachContext);
      providerName = geminiProvider.name;
    } catch (err) {
      console.error("Gemini sağlayıcı başarısız oldu, kural tabanlıya düşülüyor:", err);
      text = await rulesProvider.complete(coachContext);
      providerName = rulesProvider.name;
    }

    return {
      text,
      provider: providerName,
      crisisEscalated: false,
    };
  }
);
