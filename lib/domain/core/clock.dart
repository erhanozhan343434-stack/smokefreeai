/// Zaman kaynağı soyutlaması.
/// Hesaplayıcılar asla DateTime.now() çağırmaz — test edilebilirlik ve
/// cihaz saati manipülasyonuna karşı savunma bunun üzerine kurulur.
abstract class Clock {
  DateTime nowUtc();
}

/// Üretim saati.
class SystemClock implements Clock {
  const SystemClock();
  @override
  DateTime nowUtc() => DateTime.now().toUtc();
}

/// Test saati — istenen anı sabitler.
class FixedClock implements Clock {
  const FixedClock(this._now);
  final DateTime _now;
  @override
  DateTime nowUtc() => _now.toUtc();
}

/// Cihaz saati geri alınırsa sayaç geri gitmemeli.
/// Görülen en büyük zamanı saklar ve asla altına düşmez.
class MonotonicClock implements Clock {
  MonotonicClock(this._inner, {DateTime? highWaterMark})
      : _highWater = highWaterMark?.toUtc();

  final Clock _inner;
  DateTime? _highWater;

  DateTime? get highWaterMark => _highWater;

  @override
  DateTime nowUtc() {
    final raw = _inner.nowUtc();
    final hw = _highWater;
    if (hw == null || raw.isAfter(hw)) {
      _highWater = raw;
      return raw;
    }
    return hw; // saat geriye alındı — yok say
  }
}
