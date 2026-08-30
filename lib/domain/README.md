# domain — SAF DART

Bu katman `package:flutter` import EDEMEZ. `dart run tool/check_layers.dart` bunu zorunlu kılar.

Kurallar:
- Hiçbir fonksiyon `DateTime.now()` çağırmaz. Zaman `Clock` üzerinden enjekte edilir.
- Hesaplayıcılar saf fonksiyondur: aynı girdi → aynı çıktı, yan etki yok.
- Her hesaplayıcı `docs/reference_values.md` tablosundaki 6 senaryoyla test edilir.
