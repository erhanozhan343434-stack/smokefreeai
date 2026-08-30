import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smokefree/core/navigation/home_shell.dart';
import 'package:smokefree/core/theme/app_colors.dart';
import 'package:smokefree/core/widgets/cinematic_background.dart';
import 'package:smokefree/features/dashboard/dashboard_providers.dart';
import 'package:smokefree/features/onboarding/onboarding_providers.dart';
import 'package:smokefree/features/onboarding/onboarding_screen.dart';

/// Uygulamanın kök widget'ı.
///
/// [savedProfileProvider]'a bakar: kayıtlı profil yoksa [OnboardingScreen],
/// varsa [HomeShell] gösterir. Profil yüklenince [quitProfileProvider]'ı
/// gerçek veriyle günceller (bkz. [QuitProfileController]) — böylece
/// Dashboard ve diğer ekranlar hiçbir değişiklik gerektirmeden gerçek
/// kullanıcı verisiyle çalışır.
class AppRoot extends ConsumerWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(savedProfileProvider, (previous, next) {
      next.when(
        data: (profile) {
          if (profile != null) {
            ref.read(quitProfileProvider.notifier).set(profile);
          }
        },
        loading: () {},
        error: (_, __) {},
      );
    });

    final saved = ref.watch(savedProfileProvider);

    return saved.when(
      data: (profile) =>
          profile == null ? const OnboardingScreen() : const HomeShell(),
      loading: () => const _Splash(),
      // Beklenmeyen bir DB hatasında kullanıcıyı kilitlemek yerine
      // onboarding'e yönlendiriyoruz — en azından uygulama açılabilir.
      error: (_, __) => const OnboardingScreen(),
    );
  }
}

class _Splash extends StatelessWidget {
  const _Splash();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.scene,
      body: CinematicBackground(
        child: Center(
          child: CircularProgressIndicator(color: AppColors.accent),
        ),
      ),
    );
  }
}
