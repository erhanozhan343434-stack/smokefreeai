import 'package:drift/drift.dart';

import 'package:smokefree/data/local/app_database.dart';
import 'package:smokefree/domain/models/checkin_response.dart';

/// Günlük "bugün nasılsın?" check-in kayıtları.
///
/// TODO(faz-3): buradaki geçmiş, AI koç/bildirim mantığına girdi olacak.
class CheckinRepository {
  const CheckinRepository(this._db);

  final AppDatabase _db;

  Future<int> logCheckin({
    required DateTime atUtc,
    required CheckinResponse response,
  }) {
    return _db.into(_db.checkinLogs).insert(
          CheckinLogsCompanion.insert(
            atUtc: atUtc,
            response: response.storageKey,
          ),
        );
  }

  /// Cihazın YEREL gününe göre bugüne ait en güncel yanıt (yoksa null).
  Future<CheckinResponse?> latestToday(DateTime nowUtc) async {
    final localNow = nowUtc.toLocal();
    final localStart = DateTime(localNow.year, localNow.month, localNow.day);
    final startUtc = localStart.toUtc();
    final endUtc = localStart.add(const Duration(days: 1)).toUtc();

    final q = _db.select(_db.checkinLogs)
      ..where(
        (t) =>
            t.atUtc.isBiggerOrEqualValue(startUtc) &
            t.atUtc.isSmallerThanValue(endUtc),
      )
      ..orderBy([(t) => OrderingTerm.desc(t.atUtc)])
      ..limit(1);

    final row = await q.getSingleOrNull();
    return row == null ? null : CheckinResponse.fromStorageKey(row.response);
  }
}
