import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smokefree/core/app.dart';
import 'package:smokefree/data/local/app_database.dart';
import 'package:smokefree/data/local/database_providers.dart';
import 'package:smokefree/data/repositories/user_profile_repository.dart';
import 'package:smokefree/domain/models/product_type.dart';
import 'package:smokefree/domain/models/quit_profile.dart';

void main() {
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

    expect(find.text('SIGARASIZ'), findsOneWidget);

    // Ayarlar sekmesine geç (seçili olmayan ikon tek eşleşmedir — başlık
    // metni "Ayarlar" ile sekme etiketi "Ayarlar" aynı anda ekranda
    // olacağından metinle aramak belirsiz olurdu).
    await tester.tap(find.byIcon(Icons.settings_outlined));
    await tester.pump();

    expect(find.byKey(const Key('settings_save_button')), findsOneWidget);

    await tester.enterText(
      find.byKey(const Key('settings_price_field')),
      '120',
    );
    await tester.tap(find.byKey(const Key('settings_save_button')));
    await tester.pump();

    expect(find.text('Bilgilerin kaydedildi.'), findsOneWidget);

    // Verileri sıfırla -> onay diyaloğu -> onayla -> onboarding'e dön.
    await tester.tap(find.byKey(const Key('settings_reset_button')));
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
    expect(find.text("SmokeFree AI'a hoş geldin"), findsOneWidget);
    expect(find.text('SIGARASIZ'), findsNothing);
  });
}
