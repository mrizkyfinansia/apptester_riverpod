import 'package:app_riverpod/core/state/base_state.dart';
import 'package:app_riverpod/data/customer/customer.dart';
import 'package:app_riverpod/features/submission/common/district/notifier/district_notifier.dart';
import 'package:app_riverpod/features/submission/common/province/notifier/province_notifier.dart';
import 'package:app_riverpod/features/submission/common/stepper/stepper_notifier.dart';
import 'package:app_riverpod/features/submission/submission_2/route/suhmission_2_input.dart';
import 'package:app_riverpod/features/submission/submission_3/route/suhmission_3_input.dart';
import 'package:app_riverpod/features/submission/submssion_1/state/submission_1_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'submission_1_notifier.g.dart';

@riverpod
class Submission1Notifier extends _$Submission1Notifier {
  // If needed, you can use other notifiers inside your notifier.
  // Declare notifier as global variable when it is used in all over class
  late final StepperNotifier _stepperNotifier;

  @override
  Submission1State build() {
    _stepperNotifier = ref.read(stepperNotifierProvider.notifier);
    return Submission1State.initial();
  }

  void onInitialized(String customerId) {
    _stepperNotifier.jumpToStep(1);
    state = state.success(data: customerId);
  }

  Future<void> onTapButton({
    required int currentStep,
    required void Function(Submission2Input) navigateToSubmission2,
    required void Function(Submission3Input) navigateToSubmission3,
  }) async {
    // Only declare notifiers as local variable when it is used in only one method
    final provinceState = ref.read(provinceNotifierProvider);
    final districtState = ref.read(districtNotifierProvider);

    if (provinceState.data.selectedProvince == null || districtState.data.selectedDistrict == null) return;

    state = state.loading();
    await Future.delayed(const Duration(seconds: 1));
    state = state.copyWith(stateStatus: StateStatus.success);
    
    if (currentStep == 1) {
      final input = Submission2Input(
        customerId: state.data,
        province: provinceState.data.selectedProvince!,
        district: districtState.data.selectedDistrict!,
      );
      navigateToSubmission2(input);
    } else {
      final input = Submission3Input(
        customerData: Customer.empty()
      );

      navigateToSubmission3(input);
    }

    _stepperNotifier.nextStep();
  }
}