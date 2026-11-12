import 'package:flutter_test/flutter_test.dart';
import 'package:smokefree/features/dashboard/savings_goal_progress.dart';

void main() {
  group('SavingsGoalProgress', () {
    test('zero and invalid targets never divide by zero', () {
      expect(SavingsGoalProgress.fraction(1000, 0), 0);
      expect(SavingsGoalProgress.fraction(1000, -1), 0);
      expect(SavingsGoalProgress.remainingMinor(1000, 0), 0);
    });

    test('a new goal begins at zero', () {
      expect(SavingsGoalProgress.fraction(0, 1000000), 0);
      expect(SavingsGoalProgress.remainingMinor(0, 1000000), 1000000);
    });

    test('progress and remaining amount reflect saved money', () {
      expect(SavingsGoalProgress.fraction(325000, 1000000), 0.325);
      expect(SavingsGoalProgress.remainingMinor(325000, 1000000), 675000);
    });

    test('completed or exceeded goals clamp at 100 percent', () {
      expect(SavingsGoalProgress.fraction(1000000, 1000000), 1);
      expect(SavingsGoalProgress.fraction(2000000, 1000000), 1);
      expect(SavingsGoalProgress.remainingMinor(2000000, 1000000), 0);
    });

    test('negative savings values are treated as zero', () {
      expect(SavingsGoalProgress.fraction(-100, 10000), 0);
      expect(SavingsGoalProgress.remainingMinor(-100, 10000), 10000);
    });
  });
}
