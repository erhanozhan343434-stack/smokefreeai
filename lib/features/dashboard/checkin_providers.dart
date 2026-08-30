import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smokefree/data/local/database_providers.dart';
import 'package:smokefree/domain/models/checkin_response.dart';
import 'package:smokefree/features/dashboard/dashboard_providers.dart';

/// Bugünün check-in durumu. `null` = bugün henüz yanıt verilmedi.
class TodayCheckinController extends AsyncNotifier<CheckinResponse?> {
  @override
  Future<CheckinResponse?> build() async {
    final repo = ref.watch(checkinRepositoryProvider);
    final clock = ref.watch(clockProvider);
    return repo.latestToday(clock.nowUtc());
  }

  /// Yanıtı veritabanına yazar ve durumu anında günceller
  /// (yeniden sorgu yapmadan — optimistik güncelleme).
  Future<void> respond(CheckinResponse response) async {
    final repo = ref.read(checkinRepositoryProvider);
    final clock = ref.read(clockProvider);
    await repo.logCheckin(atUtc: clock.nowUtc(), response: response);
    state = AsyncData(response);
  }
}

final todayCheckinProvider =
    AsyncNotifierProvider<TodayCheckinController, CheckinResponse?>(
  TodayCheckinController.new,
);
