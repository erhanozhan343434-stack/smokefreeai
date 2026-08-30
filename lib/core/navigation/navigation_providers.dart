import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Ana kabuktaki (`HomeShell`) seçili sekme indeksini tutan controller.
class HomeTabIndexController extends Notifier<int> {
  @override
  int build() => 0;

  /// Seçili sekmeyi değiştirir.
  void select(int index) => state = index;
}

/// Başka ekranlardan (örn. Dashboard'daki "sıradaki kilometre taşı" veya
/// "günlük check-in" kartları) sekme değiştirmek için kullanılır — o
/// ekranlar `HomeShell`'in kendi state'ine dokunmadan yalnızca bu
/// provider'ı günceller.
final homeTabIndexProvider = NotifierProvider<HomeTabIndexController, int>(
  HomeTabIndexController.new,
);
