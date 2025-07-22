import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stepper_notifier.g.dart';

@riverpod
class StepperNotifier extends _$StepperNotifier {
  @override
  int build() => 1;

  void nextStep() => state++;
  void previousStep() => state--;
  void jumpToStep(int step) => state = step;
}