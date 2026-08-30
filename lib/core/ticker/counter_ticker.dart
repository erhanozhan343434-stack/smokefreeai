import 'dart:async';

import 'package:flutter/widgets.dart';

/// TEK ZAMAN KAYNAĞI.
///
/// Dashboard'da 6+ canlı sayaç var. Her sayaç kendi `Timer.periodic`ini
/// kurarsa pil tüketimi ve fps çöker. Tüm sayaçlar bu tek yayından beslenir.
///
/// Uygulama arka plana geçtiğinde timer DURUR; öne geldiğinde fark
/// yeniden hesaplanır. Arka planda tick tutmanın hiçbir faydası yok,
/// pil maliyeti var.
class CounterTicker with WidgetsBindingObserver {
  CounterTicker({this.interval = const Duration(seconds: 1)});

  final Duration interval;
  final _controller = StreamController<DateTime>.broadcast();
  Timer? _timer;
  bool _observing = false;

  Stream<DateTime> get stream => _controller.stream;

  void start() {
    if (!_observing) {
      WidgetsBinding.instance.addObserver(this);
      _observing = true;
    }
    _resume();
  }

  void _resume() {
    if (_timer != null || _controller.isClosed) return;
    _emit();
    _timer = Timer.periodic(interval, (_) => _emit());
  }

  void _pause() {
    _timer?.cancel();
    _timer = null;
  }

  void _emit() {
    if (!_controller.isClosed) _controller.add(DateTime.now().toUtc());
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        _resume();
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        _pause();
    }
  }

  void dispose() {
    _pause();
    if (_observing) {
      WidgetsBinding.instance.removeObserver(this);
      _observing = false;
    }
    unawaited(_controller.close());
  }
}
