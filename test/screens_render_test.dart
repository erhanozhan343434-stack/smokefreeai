import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smokefree/core/navigation/home_shell.dart';
import 'package:smokefree/data/local/app_database.dart';
import 'package:smokefree/data/local/database_providers.dart';
import 'package:smokefree/features/sos/sos_screen.dart';
import 'package:smokefree/features/timeline/timeline_screen.dart';

Widget _wrap(Widget child, AppDatabase db) => ProviderScope(
      overrides: [databaseProvider.overrideWithValue(db)],
      child: MaterialApp(home: child),
    );

void main() {
  late AppDatabase db;
  setUp(() => db = AppDatabase(NativeDatabase.memory()));
  tearDown(() => db.close());

  testWidgets('timeline ekrani render olur, kaynaklar gorunur', (tester) async {
    await tester.pumpWidget(_wrap(const TimelineScreen(), db));
    await tester.pump(const Duration(milliseconds: 100));
    expect(tester.takeException(), isNull);
    expect(find.text('SAĞLIK İYİLEŞME ÇİZELGESİ'), findsOneWidget);
    expect(find.textContaining('Kaynak: WHO'), findsWidgets);
  });

  testWidgets('sos ekrani render olur, kraving formu acilir', (tester) async {
    await tester.pumpWidget(_wrap(const SosScreen(), db));
    await tester.pump(const Duration(milliseconds: 100));
    expect(tester.takeException(), isNull);
    expect(find.text('NEFES AL'), findsOneWidget);

    // Test yuzeyi 800x600: kart ekran disinda kalabilir, once kaydir.
    await tester.ensureVisible(find.textContaining('Kraving'));
    await tester.pump();
    await tester.tap(find.textContaining('Kraving'));
    // Nefes butonu surekli animasyonlu -> pumpAndSettle asla durulmaz.
    // Sabit adimlarla sheet acilisini bekliyoruz.
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));
    expect(find.text('KRAVING KAYDET'), findsOneWidget);
    expect(find.byType(Slider), findsOneWidget);
  });

  testWidgets('sekme gecisleri istisnasiz', (tester) async {
    await tester.pumpWidget(_wrap(const HomeShell(), db));
    await tester.pump(const Duration(milliseconds: 100));

    await tester.tap(find.text('Sağlık'));
    await tester.pump(const Duration(milliseconds: 200));
    expect(tester.takeException(), isNull);

    await tester.tap(find.text('SOS'));
    await tester.pump(const Duration(milliseconds: 200));
    expect(tester.takeException(), isNull);

    await tester.tap(find.text('Özet'));
    await tester.pump(const Duration(milliseconds: 200));
    expect(tester.takeException(), isNull);
  });
}
