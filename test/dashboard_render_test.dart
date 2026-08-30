import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smokefree/core/app.dart';
import 'package:smokefree/data/local/app_database.dart';
import 'package:smokefree/data/local/database_providers.dart';
import 'package:smokefree/features/dashboard/dashboard_screen.dart';

void main() {
  testWidgets('dashboard iskeleti render olur', (tester) async {
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [databaseProvider.overrideWithValue(db)],
        child: const MaterialApp(home: DashboardScreen()),
      ),
    );
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('SIGARASIZ'), findsOneWidget);
    expect(find.text('BIRAKMASAYDIN'), findsOneWidget);
    expect(find.byType(CustomPaint), findsWidgets);
  });

  testWidgets('profil yokken uygulama onboarding ile acilir', (tester) async {
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [databaseProvider.overrideWithValue(db)],
        child: const SmokeFreeApp(),
      ),
    );
    await tester.pump(const Duration(milliseconds: 100));

    expect(tester.takeException(), isNull);
    expect(find.text("SmokeFree AI'a hoş geldin"), findsOneWidget);
  });
}
