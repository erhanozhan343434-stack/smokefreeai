import 'package:drift/drift.dart';

import 'package:smokefree/data/local/app_database.dart';

/// Kraving ve kaçamak kayıtları.
class CravingRepository {
  const CravingRepository(this._db);

  final AppDatabase _db;

  Future<int> logCraving({
    required DateTime atUtc,
    required int intensity,
    String? cue,
    String? emotion,
    String? place,
    String? coping,
    bool resisted = true,
  }) {
    return _db.into(_db.cravingLogs).insert(
          CravingLogsCompanion.insert(
            atUtc: atUtc,
            intensity: intensity,
            cue: Value(cue),
            emotion: Value(emotion),
            place: Value(place),
            coping: Value(coping),
            resisted: Value(resisted),
          ),
        );
  }

  Future<int> logSlip({
    required DateTime atUtc,
    int units = 1,
    String? context,
  }) {
    return _db.into(_db.slipLogs).insert(
          SlipLogsCompanion.insert(
            atUtc: atUtc,
            units: Value(units),
            context: Value(context),
          ),
        );
  }

  /// Son kayıtlar — yeniden eskiye.
  Future<List<CravingLog>> recent({int limit = 50}) {
    final q = _db.select(_db.cravingLogs)
      ..orderBy([(t) => OrderingTerm.desc(t.atUtc)])
      ..limit(limit);
    return q.get();
  }
}

/// Rıza kayıtları — ekle-yalnız.
class ConsentRepository {
  const ConsentRepository(this._db);

  final AppDatabase _db;

  Future<int> record({
    required String kind,
    required String docVersion,
    required bool granted,
    required DateTime atUtc,
  }) {
    return _db.into(_db.consents).insert(
          ConsentsCompanion.insert(
            kind: kind,
            docVersion: docVersion,
            granted: granted,
            atUtc: atUtc,
          ),
        );
  }

  /// Bir rıza türünün güncel durumu = en son satırı.
  Future<bool> isGranted(String kind) async {
    final q = _db.select(_db.consents)
      ..where((t) => t.kind.equals(kind))
      ..orderBy([
        (t) => OrderingTerm.desc(t.atUtc),
        (t) => OrderingTerm.desc(t.id),
      ])
      ..limit(1);
    final row = await q.getSingleOrNull();
    return row?.granted ?? false;
  }
}
