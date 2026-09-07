/**
 * Claude (Anthropic) tabanlı birincil AI Koç sağlayıcı.
 *
 * Anthropic'in Claude modelini çağırır; herhangi bir hata olursa (ağ,
 * limit, vb.) index.ts bir üst seviyede otomatik olarak GeminiProvider'a,
 * o da başarısız olursa RulesProvider'a (kalıp cevaplara) düşer —
 * kullanıcı asla hatayla karşılaşmaz.
 */
import { defineSecret } from "firebase-functions/params";
import { AiProvider, CoachContext } from "./provider";

export const claudeApiKey = defineSecret("ANTHROPIC_API_KEY");

const MODEL = "claude-sonnet-5";
const ENDPOINT = "https://api.anthropic.com/v1/messages";
const ANTHROPIC_VERSION = "2023-06-01";

function languageNameFor(locale: string): string {
  const code = locale.toLowerCase().split(/[-_]/)[0] || "en";
  const names: Record<string, string> = {
    tr: "Türkçe",
    en: "English",
    de: "Deutsch",
    fr: "Français",
    es: "Español",
    it: "Italiano",
    nl: "Nederlands",
    ru: "Русский",
    el: "Ελληνικά",
    ar: "العربية",
    zh: "中文",
  };
  return names[code] ?? "English";
}

function buildSystemInstruction(ctx: CoachContext): string {
  const language = languageNameFor(ctx.locale);
  const parts: string[] = [];

  parts.push(
    'Sen "Koç", SmokeFreeAI uygulamasının içinde yaşayan, sigarayı ' +
      "bırakmaya çalışan birinin en yakın arkadaşısın. Terapist ya da " +
      "doktor gibi değil, gerçek bir arkadaş gibi konuş: samimi, sıcak, " +
      "kısa ve doğal cümleler kur. Klişe koçluk cümlelerinden " +
      '("Sen başarabilirsin!", "Güçlü ol!") kaçın; onun yerine o anki ' +
      "duruma özel, gerçekten dinlemiş gibi cevap ver."
  );
  parts.push(
    "Cevapların KISA olsun: en fazla 2 cümle, tek paragraf. Birden fazla " +
      "paragraf yazma, art arda birkaç soru sorma, birden fazla öneri " +
      "sıralama — tek bir düşünce, tek bir tepki yeter, tıpkı gerçek " +
      "biri sana WhatsApp'tan hızlıca yazıyormuş gibi. Gerektiğinde tek " +
      "bir kısa soru sorabilirsin ama zorunlu değil. Aynı cümleleri veya " +
      "kalıpları tekrar tekrar kullanma, her seferinde gerçekten o mesaja " +
      "özel bir cevap üret."
  );
  parts.push(`Kullanıcıyla ${language} dilinde konuş.`);

  if (typeof ctx.hoursSmokeFree === "number") {
    parts.push(
      `Kullanıcı sigarasız geçirdiği süre: yaklaşık ${Math.max(
        0,
        Math.round(ctx.hoursSmokeFree)
      )} saat.`
    );
  }
  if (ctx.trigger) {
    parts.push(`Şu anki tetikleyici/durum: ${ctx.trigger}.`);
  }
  if (typeof ctx.intensity === "number") {
    parts.push(
      `Kullanıcının şu anki isteğinin/kriz şiddetinin yoğunluğu (1-10): ${ctx.intensity}.`
    );
  }

  parts.push(
    "Asla tıbbi teşhis, ilaç önerisi ya da profesyonel tedavi yerine " +
      "geçecek tavsiye verme. Kullanıcı intihar veya kendine zarar verme " +
      "belirtisi gösterirse zaten ayrı bir güvenlik katmanı devreye " +
      "girer ve sen bu konuşmayı hiç görmezsin — o yüzden bu konuda " +
      "endişelenme, normal sohbetine devam et."
  );

  return parts.join("\n\n");
}

interface ClaudeMessage {
  role: "user" | "assistant";
  content: string;
}

function toClaudeHistory(ctx: CoachContext): ClaudeMessage[] {
  const history: ClaudeMessage[] = ctx.history.slice(-12).map((turn) => ({
    role: turn.role === "assistant" ? "assistant" : "user",
    content: turn.text,
  }));
  history.push({ role: "user", content: ctx.message });
  return history;
}

export class ClaudeProvider implements AiProvider {
  readonly name = "claude";

  async complete(ctx: CoachContext): Promise<string> {
    const apiKey = claudeApiKey.value();
    if (!apiKey) {
      throw new Error("ANTHROPIC_API_KEY tanımlı değil.");
    }

    const body = {
      model: MODEL,
      max_tokens: 1024,
      system: buildSystemInstruction(ctx),
      messages: toClaudeHistory(ctx),
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
      throw new Error(
        `Claude API hatası (${response.status}): ${errText.slice(0, 300)}`
      );
    }

    const data = (await response.json()) as {
      content?: { type?: string; text?: string }[];
    };
    const text = data.content
      ?.find((block) => block.type === "text" && block.text)
      ?.text?.trim();
    if (!text) {
      throw new Error("Claude boş cevap döndürdü.");
    }
    return text;
  }
}
