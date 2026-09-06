import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

/// Kullanıcının aktif premium aboneliği olup olmadığını RevenueCat
/// üzerinden kontrol eder. Satın alma veya restore sonrası ilgili ekran
/// bu provider'ı invalidate ederek günceller.
final isPremiumProvider = FutureProvider.autoDispose<bool>((ref) async {
  final info = await Purchases.getCustomerInfo();
  return info.entitlements.active.isNotEmpty;
});
