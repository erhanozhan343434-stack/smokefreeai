/**
 * AI Koç sağlayıcı arayüzü ve paylaşılan tipler.
 *
 * `lib/features/ai_coach/ai_coach_providers.dart` (Flutter istemcisi)
 * içindeki AiCoachTurn / AiCoachReply ile birebir eşleşir — biri
 * değişirse diğeri de güncellenmeli.
 */

export interface CoachTurn {
  role: "user" | "assistant";
  text: string;
}

export interface CoachContext {
  message: string;
  history: CoachTurn[];
  locale: string;
  countryCode?: string;
  intensity?: number;
  trigger?: string;
  hoursSmokeFree?: number;
  facts?: Record<string, unknown>;
}

export interface CoachReply {
  text: string;
  provider: string;
  crisisEscalated: boolean;
  emergencyNumber?: string;
}

export interface AiProvider {
  readonly name: string;
  complete(ctx: CoachContext): Promise<string>;
}
