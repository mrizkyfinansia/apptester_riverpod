import 'package:app_riverpod/core/state/base_state.dart';
import 'package:app_riverpod/data/customer/customer.dart';
import 'package:app_riverpod/features/submission/common/stepper/stepper_notifier.dart';
import 'package:app_riverpod/features/submission/submission_2/route/suhmission_2_input.dart';
import 'package:app_riverpod/features/submission/submission_2/state/submission_2_state.dart';
import 'package:app_riverpod/features/submission/submission_3/route/suhmission_3_input.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'submission_2_notifier.g.dart';

@riverpod
class Submission2Notifier extends _$Submission2Notifier {
  // If needed, you can use other notifiers inside your notifier.
  // Declare notifier as global variable when it is used in all over class
  late final StepperNotifier _stepperNotifier;

  @override
  Submission2State build() {
    _stepperNotifier = ref.read(stepperNotifierProvider.notifier);
    return Submission2State.initial();
  }

  void onInitialized(Submission2Input input) {
    state = state.success(data: state.data.copyWith(input: input));
  }

  void onChangedName(String name) {
    state = state.success(data: state.data.copyWith(name: name));
  }

  void onChangedEmail(String email) {
    state = state.success(data: state.data.copyWith(email: email));
  }

  void onTapBackButton(
    void Function() backToSubmission1,
  ){
    _stepperNotifier.previousStep();
    backToSubmission1();
  }

  Future<void> onTapButton({
    required void Function(Submission3Input) navigateToSubmission3,
  }) async {
    state = state.loading();
    await Future.delayed(const Duration(seconds: 1));
    state = state.copyWith(stateStatus: StateStatus.success);
    final input = Submission3Input(
      customerData: Customer(
        id: state.data.input.customerId,
        name: state.data.name,
        email: state.data.email,
        province: state.data.input.province.name,
        district: state.data.input.district.name,
      )
    );
    _stepperNotifier.nextStep();
    navigateToSubmission3(input);
  }
}