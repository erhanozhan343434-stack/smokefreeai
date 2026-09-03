/**
 * Kural tabanlı yedek sağlayıcı — Claude VE Gemini başarısız olursa,
 * ya da günlük bütçe/saatlik limit aşılmışsa devreye girer.
 *
 * Model çağrısı YAPMAZ; bu yüzden asla başarısız olmaz ve maliyeti sıfırdır.
 * Uygulamanın desteklediği 11 dilin tamamı için çevrilidir (bkz.
 * app/l10n/*.arb) — desteklenmeyen bir locale gelirse EN'e düşer.
 */

import { AiProvider, CoachContext } from "./provider";

interface LocaleMessages {
  high: string[];
  low: string[];
}

const MESSAGES: Record<string, LocaleMessages> = {
  tr: {
    high: [
      "Bu his geçici — kriz ortalama 3 dakika sürer. Derin bir nefes al: " +
        "4 saniye tut, 7 saniye bekle, 8 saniyede ver. Ben buradayım.",
      "Şu an zor, biliyorum. Az önce dayandığın her saniye bir kazanım. " +
        "Bir bardak soğuk su içmeyi ya da kısa bir yürüyüşü dener misin?",
    ],
    low: [
      "Bugünü sorduğun için teşekkürler. Küçük adımlar büyük fark " +
        "yaratıyor — devam et.",
      "İyi gidiyorsun. Bedenin her geçen gün kendini onarıyor.",
    ],
  },
  en: {
    high: [
      "This feeling is temporary — cravings peak and pass in about 3 " +
        "minutes. Try a slow breath: in for 4, hold for 7, out for 8. " +
        "I'm here with you.",
      "This is hard right now, and that's okay. Every second you get " +
        "through counts. Maybe a glass of cold water or a short walk " +
        "could help?",
    ],
    low: [
      "Thanks for checking in. Small steps add up — keep going.",
      "You're doing well. Your body is healing a little more every day.",
    ],
  },
  de: {
    high: [
      "Dieses Gefühl ist vorübergehend — ein Verlangen erreicht seinen " +
        "Höhepunkt und vergeht in etwa 3 Minuten. Atme langsam: 4 " +
        "Sekunden einatmen, 7 Sekunden halten, 8 Sekunden ausatmen. Ich " +
        "bin bei dir.",
      "Das ist gerade schwer, und das ist okay. Jede Sekunde, die du " +
        "durchhältst, zählt. Vielleicht hilft ein Glas kaltes Wasser " +
        "oder ein kurzer Spaziergang?",
    ],
    low: [
      "Danke, dass du dich meldest. Kleine Schritte summieren sich — " +
        "mach weiter.",
      "Du machst das gut. Dein Körper heilt sich jeden Tag ein Stück " +
        "mehr.",
    ],
  },
  nl: {
    high: [
      "Dit gevoel is tijdelijk — hunkering piekt en gaat voorbij in " +
        "ongeveer 3 minuten. Probeer langzaam te ademen: 4 tellen in, " +
        "7 tellen vasthouden, 8 tellen uit. Ik ben bij je.",
      "Dit is nu moeilijk, en dat is oké. Elke seconde die je doorstaat " +
        "telt. Misschien helpt een glas koud water of een korte " +
        "wandeling?",
    ],
    low: [
      "Bedankt dat je het laat weten. Kleine stappen tellen op — ga zo " +
        "door.",
      "Je doet het goed. Je lichaam herstelt elke dag een beetje meer.",
    ],
  },
  zh: {
    high: [
      "这种感觉是暂时的——渴望通常在3分钟左右达到顶峰后就会消退。试着慢慢呼吸："
        + "吸气4秒，屏息7秒，呼气8秒。我在这里陪着你。",
      "现在确实很难熬，这没关系。你撑过的每一秒都很重要。要不要试试喝杯冷水或者"
        + "短距离散散步？",
    ],
    low: [
      "谢谢你今天来看看。小小的进步累积起来就是大改变——继续加油。",
      "你做得很好。你的身体每天都在一点点自我修复。",
    ],
  },
  ru: {
    high: [
      "Это чувство временное — тяга обычно достигает пика и проходит " +
        "примерно за 3 минуты. Подыши медленно: вдох на 4 секунды, " +
        "задержка на 7, выдох на 8. Я рядом с тобой.",
      "Сейчас тяжело, и это нормально. Каждая секунда, которую ты " +
        "выдерживаешь, имеет значение. Может, поможет стакан холодной " +
        "воды или короткая прогулка?",
    ],
    low: [
      "Спасибо, что заглянул(а). Маленькие шаги складываются в большие " +
        "результаты — продолжай в том же духе.",
      "У тебя хорошо получается. Твоё тело с каждым днём " +
        "восстанавливается всё больше.",
    ],
  },
  ar: {
    high: [
      "هذا الشعور مؤقت — الرغبة الملحة تصل ذروتها وتزول خلال حوالي 3 " +
        "دقائق. جرّب نفسًا بطيئًا: شهيق لمدة 4 ثوانٍ، احبسه 7 ثوانٍ، ثم " +
        "أخرجه خلال 8 ثوانٍ. أنا هنا معك.",
      "هذا صعب الآن، ولا بأس بذلك. كل ثانية تتحملها فيها لها قيمة. هل " +
        "تجرب كوب ماء بارد أو نزهة قصيرة؟",
    ],
    low: [
      "شكرًا لتواصلك. الخطوات الصغيرة تتراكم لتصنع فرقًا كبيرًا — استمر.",
      "أنت تبلي حسنًا. جسدك يشفي نفسه أكثر قليلاً كل يوم.",
    ],
  },
  el: {
    high: [
      "Αυτό το συναίσθημα είναι προσωρινό — η λαχτάρα κορυφώνεται και " +
        "περνάει σε περίπου 3 λεπτά. Δοκίμασε μια αργή αναπνοή: εισπνοή " +
        "για 4 δευτερόλεπτα, κράτα για 7, εκπνοή για 8. Είμαι εδώ μαζί " +
        "σου.",
      "Αυτό είναι δύσκολο αυτή τη στιγμή, και είναι εντάξει. Κάθε " +
        "δευτερόλεπτο που αντέχεις μετράει. Ίσως βοηθήσει ένα ποτήρι " +
        "κρύο νερό ή ένας σύντομος περίπατος;",
    ],
    low: [
      "Ευχαριστώ που πέρασες να δεις πώς πάει. Τα μικρά βήματα " +
        "αθροίζονται — συνέχισε έτσι.",
      "Τα πας καλά. Το σώμα σου επουλώνεται λίγο περισσότερο κάθε " +
        "μέρα.",
    ],
  },
  fr: {
    high: [
      "Cette sensation est temporaire — l'envie atteint son pic et " +
        "passe en environ 3 minutes. Essaie une respiration lente : " +
        "inspire pendant 4 secondes, retiens pendant 7, expire pendant " +
        "8. Je suis là avec toi.",
      "C'est difficile en ce moment, et c'est normal. Chaque seconde " +
        "que tu tiens compte. Un verre d'eau fraîche ou une courte " +
        "promenade pourraient peut-être t'aider ?",
    ],
    low: [
      "Merci de prendre des nouvelles. Les petits pas s'additionnent " +
        "— continue comme ça.",
      "Tu t'en sors bien. Ton corps guérit un peu plus chaque jour.",
    ],
  },
  it: {
    high: [
      "Questa sensazione è temporanea — il desiderio raggiunge il " +
        "picco e passa in circa 3 minuti. Prova un respiro lento: " +
        "inspira per 4 secondi, trattieni per 7, espira per 8. Sono qui " +
        "con te.",
      "Adesso è difficile, ed è normale. Ogni secondo che resisti " +
        "conta. Forse un bicchiere d'acqua fredda o una breve " +
        "passeggiata potrebbero aiutare?",
    ],
    low: [
      "Grazie per essere passato/a a vedere come va. I piccoli passi " +
        "si sommano — continua così.",
      "Stai andando bene. Il tuo corpo guarisce un po' di più ogni " +
        "giorno.",
    ],
  },
  es: {
    high: [
      "Esta sensación es temporal — el antojo alcanza su punto máximo " +
        "y pasa en unos 3 minutos. Prueba una respiración lenta: " +
        "inhala durante 4 segundos, retén 7, exhala durante 8. Estoy " +
        "aquí contigo.",
      "Esto es difícil ahora mismo, y está bien que lo sea. Cada " +
        "segundo que aguantas cuenta. ¿Quizás un vaso de agua fría o " +
        "un paseo corto podrían ayudar?",
    ],
    low: [
      "Gracias por pasar a ver cómo vas. Los pequeños pasos se suman " +
        "— sigue así.",
      "Lo estás haciendo bien. Tu cuerpo se cura un poco más cada día.",
    ],
  },
};

function pick<T>(arr: T[]): T {
  return arr[Math.floor(Math.random() * arr.length)] as T;
}

// MESSAGES.en her zaman tanımlıdır (yukarıda sabit olarak tanımlandı) —
// noUncheckedIndexedAccess altında derleyiciye bunu garanti ediyoruz ki
// aşağıdaki `?? DEFAULT_BUCKET` ifadesi kesin bir tip döndürsün.
const DEFAULT_BUCKET = MESSAGES.en as LocaleMessages;

export class RulesProvider implements AiProvider {
  readonly name = "rules" as const;

  async complete(ctx: CoachContext): Promise<string> {
    const code = ctx.locale.toLowerCase().split(/[-_]/)[0] ?? "en";
    const bucket = MESSAGES[code] ?? DEFAULT_BUCKET;
    const highIntensity = (ctx.intensity ?? 0) >= 6;

    return pick(highIntensity ? bucket.high : bucket.low);
  }
}
