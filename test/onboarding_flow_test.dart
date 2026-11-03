import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smokefree/core/app.dart';
import 'package:smokefree/features/onboarding/onboarding_screen.dart';
import 'package:smokefree/features/onboarding/widgets/profile_form_fields.dart';
import 'package:smokefree/domain/models/product_type.dart';
import 'package:smokefree/features/dashboard/dashboard_screen.dart';
import 'package:smokefree/data/local/app_database.dart';
import 'package:smokefree/data/local/database_providers.dart';

void main() {
  setUp(() => TestWidgetsFlutterBinding.ensureInitialized().platformDispatcher.localeTestValue = const Locale('tr'));
  tearDown(() => TestWidgetsFlutterBinding.ensureInitialized().platformDispatcher.clearLocaleTestValue());
  testWidgets('onboarding tamamlanınca dashboard acilir', (tester) async {
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [databaseProvider.overrideWithValue(db)],
        child: const SmokeFreeApp(),
      ),
    );
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.byType(OnboardingScreen), findsOneWidget);

    await tester.tap(find.byWidgetPredicate((w) => w is ProductTypeTile && w.type == ProductType.cigarette));
    await tester.pump();

    final priceField = find.descendant(
      of: find.byKey(const Key('onboarding_price_field')),
      matching: find.byType(TextField),
    );
    await tester.scrollUntilVisible(
      find.byKey(const Key('onboarding_price_field')), 200,
      scrollable: find.descendant(of: find.byType(OnboardingScreen), matching: find.byType(Scrollable)).first,
    );
    await tester.enterText(priceField, '90');
    await tester.pump();

    await tester.scrollUntilVisible(
      find.byKey(const Key('onboarding_start_button')), 200,
      scrollable: find.descendant(of: find.byType(OnboardingScreen), matching: find.byType(Scrollable)).first,
    );
    await tester.tap(find.byKey(const Key('onboarding_start_button')));
    // Kaydetme + savedProfileProvider'ın geçersiz kılınıp yeniden
    // yüklenmesi birkaç ardışık mikrotask/frame sürer; Dashboard'da
    // sürekli tik atan bir sayaç olduğu için pumpAndSettle KULLANILMAZ
    // (bkz. screens_render_test.dart'taki aynı not).
    for (var i = 0; i < 5; i++) {
      await tester.pump(const Duration(milliseconds: 50));
    }

    expect(tester.takeException(), isNull);
    expect(find.byType(DashboardScreen), findsOneWidget);
    expect(find.byType(OnboardingScreen), findsNothing);
  });
}
