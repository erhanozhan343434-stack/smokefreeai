import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:smokefree/core/l10n/generated/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smokefree/core/app.dart';
import 'package:smokefree/features/onboarding/onboarding_screen.dart';
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
        child: MaterialApp(locale: const Locale('tr'),
        supportedLocales: L10n.supportedLocales,
        localizationsDelegates: const [L10n.delegate, GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate, GlobalCupertinoLocalizations.delegate],
        home: const DashboardScreen()),
      ),
    );
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('SIGARASIZ'), findsOneWidget);
    expect(find.byType(CustomPaint), findsWidgets);
  });

  testWidgets('dashboard scrolls back to top after swiping down and up',
      (tester) async {
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [databaseProvider.overrideWithValue(db)],
        child: MaterialApp(
          locale: const Locale('tr'),
          supportedLocales: L10n.supportedLocales,
          localizationsDelegates: const [
            L10n.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: const DashboardScreen(),
        ),
      ),
    );
    await tester.pump(const Duration(milliseconds: 120));
    final list = find.byType(ListView).first;
    final scroll = tester.state<ScrollableState>(find.byType(Scrollable).first);
    expect(scroll.position.physics, isA<ClampingScrollPhysics>());

    // Scroll down into cards, then immediately swipe back up.
    await tester.drag(list, const Offset(0, -550));
    await tester.pump(const Duration(milliseconds: 350));
    expect(scroll.position.pixels, greaterThan(0));

    await tester.drag(list, const Offset(0, 1500));
    await tester.pump(const Duration(milliseconds: 600));
    expect(scroll.position.pixels, closeTo(0, 0.5));
    expect(tester.takeException(), isNull);
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
    expect(find.byType(OnboardingScreen), findsOneWidget);
  });
}
