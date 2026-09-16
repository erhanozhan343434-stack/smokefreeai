/**
 * VELOFIT.ai için AI Asistan Cloud Function'ı.
 *
 * SmokeFreeAI'nin claude_provider.ts dosyasındaki `claudeApiKey` secret'ını
 * (ANTHROPIC_API_KEY) tekrar kullanır — aynı Firebase projesinde olduğu
 * için ayrı bir key tanımlamaya gerek yok. Claude çağrısı başarısız
 * olursa (ağ hatası, limit vb.) basit, sabit bir yedek cevaba düşer;
 * kullanıcı asla hata ekranıyla karşılaşmaz.
 */
import * as admin from "firebase-admin";
import { HttpsError, onCall } from "firebase-functions/v2/https";
import { claudeApiKey } from "./ai/claude_provider";

const MODEL = "claude-sonnet-5";
const ENDPOINT = "https://api.anthropic.com/v1/messages";
const ANTHROPIC_VERSION = "2023-06-01";
const HOURLY_MESSAGE_LIMIT = 20;
const MAX_MESSAGE_LENGTH = 2000;

interface VelofitTurn {
  role: "user" | "assistant";
  text: string;
}

interface VelofitRequest {
  message?: string;
  history?: VelofitTurn[];
  locale?: string;
  calories?: number;
  proteinGoal?: number;
  weightKg?: number;
  goal?: number; // 0 = kilo verme, 1 = kas kazanma/kilo alma, 2 = form koruma
  name?: string;
}

function isTurkish(locale: string | undefined): boolean {
  return (locale ?? "en").toLowerCase().startsWith("tr");
}

function goalText(goal: number | undefined, tr: boolean): string {
  const idx = goal !== undefined && goal >= 0 && goal <= 2 ? goal : 2;
  const trGoals = ["kilo verme", "kas kazanma / kilo alma", "formunu koruma"];
  const enGoals = ["losing weight", "building muscle / gaining weight", "maintaining fitness"];
  return tr ? trGoals[idx] : enGoals[idx];
}

function buildSystemInstruction(data: VelofitRequest): string {
  const tr = isTurkish(data.locale);
  const parts: string[] = [];

  parts.push(
    tr
      ? 'Sen "VELOFIT Asistan", VELOFIT.ai uygulamasının içinde yaşayan, ' +
          "samimi ve destekleyici bir fitness/beslenme arkadaşısın. Bir " +
          "kişisel antrenör gibi ama resmi değil, gerçek bir arkadaş gibi " +
          "konuş: enerjik, sıcak ve doğal cümleler kur."
      : 'You are "VELOFIT Assistant", a warm, supportive fitness and ' +
          "nutrition friend living inside the VELOFIT.ai app. Talk like a " +
          "real friend, not a formal coach: energetic, warm, natural " +
          "sentences."
  );
  parts.push(
    tr
      ? "Cevapların KISA olsun: en fazla 2-3 cümle, tek paragraf. Madde " +
          "işaretli liste ya da resmi bir üslup kullanma — gerçek biri " +
          "sohbet ediyormuş gibi yaz."
      : "Keep replies SHORT: 2-3 sentences max, one paragraph. No bullet " +
          "lists or formal tone — write like a real person chatting."
  );
  parts.push(tr ? "Kullanıcıyla Türkçe konuş." : "Reply to the user in English.");

  if (data.name) parts.push(tr ? `Kullanıcının adı: ${data.name}.` : `The user's name: ${data.name}.`);
  if (data.calories) {
    parts.push(
      tr
        ? `Kullanıcının günlük kalori hedefi: ${data.calories} kcal.`
        : `The user's daily calorie target: ${data.calories} kcal.`
    );
  }
  if (data.proteinGoal) {
    parts.push(
      tr ? `Günlük protein hedefi: ${data.proteinGoal}g.` : `Daily protein target: ${data.proteinGoal}g.`
    );
  }
  if (data.weightKg) {
    parts.push(tr ? `Kullanıcının mevcut kilosu: ${data.weightKg} kg.` : `The user's current weight: ${data.weightKg} kg.`);
  }
  parts.push(
    tr
      ? `Kullanıcının hedefi: ${goalText(data.goal, tr)}.`
      : `The user's goal: ${goalText(data.goal, tr)}.`
  );

  parts.push(
    tr
      ? "Asla tıbbi teşhis, ilaç/takviye reçetesi ya da bir uzmanın " +
          "(doktor, diyetisyen) yerine geçecek kesin tavsiye verme; " +
          "gerektiğinde bir uzmana danışmasını öner. Kullanıcı kendine " +
          "zarar verme ya da intihar belirtisi gösterirse, hemen " +
          "güvendiği biriyle konuşmasını ya da acil yardım hattını " +
          "aramasını söyle."
      : "Never give medical diagnoses, medication/supplement " +
          "prescriptions, or advice that replaces a professional " +
          "(doctor, dietitian) — suggest consulting one when relevant. " +
          "If the user shows signs of self-harm or suicidal intent, " +
          "immediately tell them to reach out to someone they trust or " +
          "a crisis line."
  );

  return parts.join("\n\n");
}

async function callClaude(data: VelofitRequest): Promise<string> {
  const apiKey = claudeApiKey.value();
  if (!apiKey) throw new Error("ANTHROPIC_API_KEY tanımlı değil.");

  const history = (data.history ?? []).slice(-12).map((t) => ({
    role: t.role === "assistant" ? ("assistant" as const) : ("user" as const),
    content: t.text,
  }));
  history.push({ role: "user", content: data.message ?? "" });

  const body = {
    model: MODEL,
    max_tokens: 512,
    system: buildSystemInstruction(data),
    messages: history,
  };

  const controller = new AbortController();
  const timeout = setTimeout(() => controller.abort(), 25_000);
  let response: Response;
  try {
    response = await fetch(ENDPOINT, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "x-api-key": apiKey,
        "anthropic-version": ANTHROPIC_VERSION,
      },
      body: JSON.stringify(body),
      signal: controller.signal,
    });
  } finally {
    clearTimeout(timeout);
  }

  if (!response.ok) {
    const errText = await response.text().catch(() => "");
    throw new Error(`Claude API hatası (${response.status}): ${errText.slice(0, 300)}`);
  }

  const responseData = (await response.json()) as {
    content?: { type?: string; text?: string }[];
  };
  const text = responseData.content
    ?.find((block) => block.type === "text" && block.text)
    ?.text?.trim();
  if (!text) throw new Error("Claude boş cevap döndürdü.");
  return text;
}

function fallbackReply(data: VelofitRequest): string {
  const tr = isTurkish(data.locale);
  return tr
    ? "Şu an bağlantı kurmakta zorlanıyorum, birazdan tekrar dener misin? Bu arada Antrenman ya da Beslenme sekmelerine göz atabilirsin."
    : "I'm having trouble connecting right now — mind trying again in a bit? Meanwhile, feel free to check the Workout or Nutrition tabs.";
}

// ---------------------------------------------------------------------
// Saatlik hız sınırı — SmokeFreeAI'ninkinden ayrı bir Firestore koleksiyonu
// kullanır (velofitRateLimits), böylece iki uygulamanın limitleri karışmaz.
// ---------------------------------------------------------------------
async function checkAndConsumeHourlyRate(uid: string): Promise<boolean> {
  const db = admin.firestore();
  const hourBucket = Math.floor(Date.now() / 3_600_000);
  const ref = db.collection("velofitRateLimits").doc(`${uid}_${hourBucket}`);
  return db.runTransaction(async (tx) => {
    const snap = await tx.get(ref);
    const current = snap.exists ? (snap.data()?.count as number | undefined) : undefined;
    const count = current ?? 0;
    if (count >= HOURLY_MESSAGE_LIMIT) {
      return false;
    }
    tx.set(
      ref,
      { count: count + 1, uid, updatedAt: admin.firestore.FieldValue.serverTimestamp() },
      { merge: true }
    );
    return true;
  });
}

const RATE_LIMIT_MESSAGE_TR =
  "Bu saat için mesaj hakkını doldurdun, biraz sonra tekrar dene.";
const RATE_LIMIT_MESSAGE_EN =
  "You've reached this hour's message limit — please try again soon.";

// ---------------------------------------------------------------------
// velofitCoach — VELOFIT.ai Flutter uygulamasının çağırdığı tek uç nokta.
// ---------------------------------------------------------------------
export const velofitCoach = onCall(
  { region: "europe-west1", secrets: [claudeApiKey] },
  async (request): Promise<{ text: string; provider: string }> => {
    const uid = request.auth?.uid;
    if (!uid) {
      throw new HttpsError("unauthenticated", "Giriş yapman gerekiyor.");
    }

    const data = (request.data ?? {}) as VelofitRequest;
    const message = (data.message ?? "").trim();
    if (!message) {
      throw new HttpsError("invalid-argument", "Mesaj boş olamaz.");
    }
    if (message.length > MAX_MESSAGE_LENGTH) {
      throw new HttpsError("invalid-argument", "Mesaj çok uzun.");
    }

    const allowed = await checkAndConsumeHourlyRate(uid);
    if (!allowed) {
      return {
        text: isTurkish(data.locale) ? RATE_LIMIT_MESSAGE_TR : RATE_LIMIT_MESSAGE_EN,
        provider: "rules",
      };
    }

    try {
      const text = await callClaude(data);
      return { text, provider: "claude" };
    } catch (err) {
      console.error("VELOFIT Claude çağrısı başarısız, yedek cevaba düşülüyor:", err);
      return { text: fallbackReply(data), provider: "rules" };
    }
  }
);
