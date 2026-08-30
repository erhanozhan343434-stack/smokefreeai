import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smokefree/core/l10n/generated/app_localizations.dart';
import 'package:smokefree/core/navigation/navigation_providers.dart';
import 'package:smokefree/core/theme/app_colors.dart';
import 'package:smokefree/features/dashboard/dashboard_screen.dart';
import 'package:smokefree/features/settings/settings_screen.dart';
import 'package:smokefree/features/sos/sos_screen.dart';
import 'package:smokefree/features/timeline/timeline_screen.dart';

/// Ana gezinme kabuğu.
///
/// Sekme değişince önceki ekran DISPOSE edilir (IndexedStack değil):
/// gizli dashboard'ın saniyelik tick ile boşa rebuild olmasını önler.
///
/// Seçili sekme [homeTabIndexProvider] içinde tutulur (yerel State değil)
/// — böylece Dashboard içindeki bir kart, bu widget'a referans vermeden
/// sekme değiştirebilir.
class HomeShell extends ConsumerWidget {
  const HomeShell({super.key});

  static const _screens = <Widget>[
    DashboardScreen(),
    TimelineScreen(),
    SosScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(homeTabIndexProvider);
    final l10n = L10n.of(context);

    return Scaffold(
      backgroundColor: AppColors.scene,
      body: _screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: AppColors.surface1,
          indicatorColor: AppColors.accentDeep.withValues(alpha: 0.35),
          labelTextStyle: WidgetStatePropertyAll(
            Theme.of(context).textTheme.bodySmall,
          ),
        ),
        child: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (i) =>
              ref.read(homeTabIndexProvider.notifier).select(i),
          destinations: [
            NavigationDestination(
              icon: const Icon(Icons.dashboard_outlined),
              selectedIcon:
                  const Icon(Icons.dashboard, color: AppColors.accent),
              label: l10n.navSummary,
            ),
            NavigationDestination(
              icon: const Icon(Icons.favorite_outline),
              selectedIcon:
                  const Icon(Icons.favorite, color: AppColors.accent),
              label: l10n.navHealth,
            ),
            NavigationDestination(
              icon: const Icon(Icons.emergency_outlined),
              selectedIcon: const Icon(Icons.emergency, color: AppColors.d5),
              label: l10n.navSos,
            ),
            NavigationDestination(
              icon: const Icon(Icons.settings_outlined),
              selectedIcon:
                  const Icon(Icons.settings, color: AppColors.accent),
              label: l10n.navSettings,
            ),
          ],
        ),
      ),
    );
  }
}
