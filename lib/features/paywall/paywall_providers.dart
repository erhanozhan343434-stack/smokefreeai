import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

/// RevenueCat üzerinden mevcut fiyatlandırma paketlerini getirir.
///
/// [purchasesReadyProvider] `false` iken hiç izlenmez — [PaywallScreen]
/// zaten o durumda "yakında" mesajı gösterir, bu çağrı yapılmaz.
final offeringsProvider = FutureProvider.autoDispose<Offerings>((ref) {
  return Purchases.getOfferings();
});

/// Bir paketi satın alır.
///
/// Kullanıcı iptal ederse `false` döner (hata SAYILMAZ). Diğer hatalar
/// olduğu gibi fırlatılır — çağıran taraf SnackBar ile gösterir.
Future<bool> purchasePackage(Package package) async {
  try {
    await Purchases.purchasePackage(package);
    return true;
  } on PlatformException catch (e) {
    final code = PurchasesErrorHelper.getErrorCode(e);
    if (code == PurchasesErrorCode.purchaseCancelledError) return false;
    rethrow;
  }
}

/// Satın alımları geri yükler (yeni cihaz veya uygulamayı silip yükleme).
Future<CustomerInfo> restorePurchases() => Purchases.restorePurchases();
