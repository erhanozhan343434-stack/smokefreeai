import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smokefree/data/local/app_database.dart';
import 'package:smokefree/data/repositories/craving_repository.dart';

void main() {
  late AppDatabase db;

  setUp(() => db = AppDatabase(NativeDatabase.memory()));
  tearDown(() => db.close());

  group('CravingRepository', () {
    test('kraving yaz-oku turu', () async {
      final repo = CravingRepository(db);
      await repo.logCraving(
        atUtc: DateTime.utc(2026, 2, 15, 15),
        intensity: 7,
        cue: 'Kahve',
      );
      final rows = await repo.recent();
      expect(rows, hasLength(1));
      expect(rows.first.intensity, 7);
      expect(rows.first.cue, 'Kahve');
      expect(rows.first.resisted, isTrue);
    });

    test('gecersiz siddet (0 ve 11) CHECK kisiti tarafindan reddedilir',
        () async {
      final repo = CravingRepository(db);
      expect(
        () => repo.logCraving(atUtc: DateTime.utc(2026), intensity: 0),
        throwsA(anything),
      );
      expect(
        () => repo.logCraving(atUtc: DateTime.utc(2026), intensity: 11),
        throwsA(anything),
      );
    });

    test('kacamak kaydi seriyi degil yalniz tabloyu etkiler', () async {
      final repo = CravingRepository(db);
      final id = await repo.logSlip(
        atUtc: DateTime.utc(2026, 3),
        context: 'dugun',
      );
      expect(id, 1);
    });

    test('recent yeniden eskiye siralar', () async {
      final repo = CravingRepository(db);
      await repo.logCraving(atUtc: DateTime.utc(2026), intensity: 3);
      await repo.logCraving(atUtc: DateTime.utc(2026, 1, 3), intensity: 9);
      await repo.logCraving(atUtc: DateTime.utc(2026, 1, 2), intensity: 5);
      final rows = await repo.recent();
      expect(rows.map((r) => r.intensity).toList(), [9, 5, 3]);
    });
  });

  group('ConsentRepository — KVKK ekle-yalniz', () {
    test('verilmemis riza = false', () async {
      final repo = ConsentRepository(db);
      expect(await repo.isGranted('health_data'), isFalse);
    });

    test('ver -> geri cek -> guncel durum son satirdir', () async {
      final repo = ConsentRepository(db);
      await repo.record(
        kind: 'cross_border',
        docVersion: '2026-08-tr-v1',
        granted: true,
        atUtc: DateTime.utc(2026, 8),
      );
      expect(await repo.isGranted('cross_border'), isTrue);

      await repo.record(
        kind: 'cross_border',
        docVersion: '2026-08-tr-v1',
        granted: false,
        atUtc: DateTime.utc(2026, 8, 10),
      );
      expect(await repo.isGranted('cross_border'), isFalse);

      // Denetim izi: iki satir da duruyor, hicbiri silinmedi.
      final all = await db.select(db.consents).get();
      expect(all, hasLength(2));
    });

    test('riza turleri birbirini etkilemez', () async {
      final repo = ConsentRepository(db);
      await repo.record(
        kind: 'health_data',
        docVersion: 'v1',
        granted: true,
        atUtc: DateTime.utc(2026, 8),
      );
      expect(await repo.isGranted('health_data'), isTrue);
      expect(await repo.isGranted('cross_border'), isFalse);
    });
  });
}
