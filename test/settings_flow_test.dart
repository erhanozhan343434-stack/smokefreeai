import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smokefree/core/app.dart';
import 'package:smokefree/features/onboarding/onboarding_screen.dart';
import 'package:smokefree/features/dashboard/dashboard_screen.dart';
import 'package:smokefree/features/settings/settings_screen.dart';
import 'package:smokefree/data/local/app_database.dart';
import 'package:smokefree/data/local/database_providers.dart';
import 'package:smokefree/data/repositories/user_profile_repository.dart';
import 'package:smokefree/domain/models/product_type.dart';
import 'package:smokefree/domain/models/quit_profile.dart';

void main() {
  setUp(() => TestWidgetsFlutterBinding.ensureInitialized().platformDispatcher.localeTestValue = const Locale('tr'));
  tearDown(() => TestWidgetsFlutterBinding.ensureInitialized().platformDispatcher.clearLocaleTestValue());
  testWidgets('ayarlardan profil guncellenip veri sifirlanabilir', (
    tester,
  ) async {
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);

    // Onboarding'i atlamak için profili doğrudan veritabanına yazıyoruz —
    // bu testin odağı Ayarlar ekranı, onboarding akışı değil (bkz.
    // onboarding_flow_test.dart).
    await UserProfileRepository(db).save(
      QuitProfile(
        quitDateUtc: DateTime.utc(2026),
        productType: ProductType.cigarette,
        unitsPerDay: 20,
        unitsPerPack: 20,
        packPriceMinor: 9000,
        currencyCode: 'TRY',
      ),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [databaseProvider.overrideWithValue(db)],
        child: const SmokeFreeApp(),
      ),
    );
    for (var i = 0; i < 5; i++) {
      await tester.pump(const Duration(milliseconds: 50));
    }

    expect(find.byType(DashboardScreen), findsOneWidget);

    // Ayarlar sekmesine geç (seçili olmayan ikon tek eşleşmedir — başlık
    // metni "Ayarlar" ile sekme etiketi "Ayarlar" aynı anda ekranda
    // olacağından metinle aramak belirsiz olurdu).
    await tester.tap(find.byIcon(Icons.settings_outlined));
    await tester.pump();

    await tester.scrollUntilVisible(find.byKey(const Key('settings_save_button')), 250, scrollable: find.descendant(of: find.byType(SettingsScreen), matching: find.byType(Scrollable)).first);
    expect(find.byKey(const Key('settings_save_button')), findsOneWidget);

    await tester.enterText(
      find.byKey(const Key('settings_price_field')),
      '120',
    );
    await tester.testTextInput.hide();
    await tester.pump();
    await tester.ensureVisible(find.byKey(const Key('settings_save_button')));
    await tester.tap(find.byKey(const Key('settings_save_button')));
    await tester.pump();

    for (var i = 0; i < 5; i++) {
      await tester.pump(const Duration(milliseconds: 50));
    }
    expect(tester.takeException(), isNull);

    // Verileri sıfırla -> onay diyaloğu -> onayla -> onboarding'e dön.
    await tester.scrollUntilVisible(find.byKey(const Key('settings_reset_button')), 250, scrollable: find.descendant(of: find.byType(SettingsScreen), matching: find.byType(Scrollable)).first);
    await tester.ensureVisible(find.byKey(const Key('settings_reset_button')));
    await tester.tap(find.byKey(const Key('settings_reset_button')));
    await tester.pump(const Duration(milliseconds: 350));
    await tester.pump();

    expect(
      find.byKey(const Key('settings_reset_confirm_button')),
      findsOneWidget,
    );
    await tester.tap(find.byKey(const Key('settings_reset_confirm_button')));
    for (var i = 0; i < 5; i++) {
      await tester.pump(const Duration(milliseconds: 50));
    }

    expect(tester.takeException(), isNull);
    expect(find.byType(OnboardingScreen), findsOneWidget);
    expect(find.byType(DashboardScreen), findsNothing);
  });
}
