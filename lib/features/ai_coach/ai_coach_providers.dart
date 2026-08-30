import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smokefree/core/config/app_config.dart';

/// Tek bir sohbet turu — istemci tutar, sunucu SAKLAMAZ (bkz.
/// functions/src/ai/provider.ts CoachTurn).
class AiCoachTurn {
  const AiCoachTurn({required this.role, required this.text});

  final String role; // 'user' | 'assistant'
  final String text;

  Map<String, String> toJson() => {'role': role, 'text': text};
}

/// [functions/src/ai/provider.ts]'teki CoachReply ile birebir eşleşir.
class AiCoachReply {
  const AiCoachReply({
    required this.text,
    required this.provider,
    required this.crisisEscalated,
    this.emergencyNumber,
  });

  factory AiCoachReply.fromJson(Map<Object?, Object?> json) => AiCoachReply(
        text: json['text'] as String? ?? '',
        provider: json['provider'] as String? ?? 'rules',
        crisisEscalated: json['crisisEscalated'] as bool? ?? false,
        emergencyNumber: json['emergencyNumber'] as String?,
      );

  final String text;
  final String provider;
  final bool crisisEscalated;
  final String? emergencyNumber;
}

/// AI Koç Cloud Function'ını çağıran istemci.
///
/// TÜM güvenlik/maliyet mantığı sunucudadır (kriz kapısı, bütçe, hız
/// sınırı) — istemci yalnızca ham girdiyi gönderir, kararı sorgulamaz.
class AiCoachRepository {
  const AiCoachRepository();

  Future<AiCoachReply> send({
    required String message,
    required List<AiCoachTurn> history,
    required String locale,
    String? countryCode,
    int? intensity,
    String? trigger,
    double? hoursSmokeFree,
    Map<String, Object> facts = const {},
  }) async {
    final callable = FirebaseFunctions.instanceFor(
      region: AppConfig.functionsRegion,
    ).httpsCallable(AppConfig.aiGatewayPath);

    final result = await callable.call<Object?>({
      'message': message,
      'history': history.map((t) => t.toJson()).toList(),
      'locale': locale,
      if (countryCode != null) 'countryCode': countryCode,
      if (intensity != null) 'intensity': intensity,
      if (trigger != null) 'trigger': trigger,
      if (hoursSmokeFree != null) 'hoursSmokeFree': hoursSmokeFree,
      'facts': facts,
    });

    return AiCoachReply.fromJson(
      Map<Object?, Object?>.from(result.data as Map),
    );
  }
}

final aiCoachRepositoryProvider = Provider<AiCoachRepository>(
  (ref) => const AiCoachRepository(),
);
