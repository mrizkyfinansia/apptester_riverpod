import 'package:app_riverpod/module/submission/common/stepper/stepper_notifier.dart';
import 'package:app_riverpod/module/submission/submission_3/route/suhmission_3_input.dart';
import 'package:app_riverpod/module/submission/submission_3/state/submission_3_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'submission_3_notifier.g.dart';

@riverpod
class Submission3Notifier extends _$Submission3Notifier {
  late final StepperNotifier stepperNotifier;

  @override
  Submission3State build() {
    stepperNotifier = ref.read(stepperNotifierProvider.notifier);
    return Submission3State.initial();
  }

  void onInitialized(Submission3Input input) {
    state = state.success(data: input);
  }

  void onNavigatedBack({
    required void Function() backToSubmission2,
  }){
    stepperNotifier.previousStep();
    backToSubmission2();
  }

  Future<void> onSubmited({
    required void Function() offToHome,
  }) async {
    state.loading();
    await Future.delayed(const Duration(seconds: 1)).then((_) {
      offToHome();
    });
  }
}