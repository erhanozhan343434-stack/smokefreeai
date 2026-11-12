/// Pure savings goal calculations, independent of UI and RevenueCat.
class SavingsGoalProgress {
  const SavingsGoalProgress._();

  /// Clamp a savings balance to the [0, 1] range.
  /// Invalid targets must never produce NaN or infinity in a progress bar.
  static double fraction(int savedMinor, int targetMinor) {
    if (targetMinor <= 0 || savedMinor <= 0) return 0;
    if (savedMinor >= targetMinor) return 1;
    return savedMinor / targetMinor;
  }

  static int remainingMinor(int savedMinor, int targetMinor) {
    if (targetMinor <= 0) return 0;
    if (savedMinor <= 0) return targetMinor;
    if (savedMinor >= targetMinor) return 0;
    return targetMinor - savedMinor;
  }
}
