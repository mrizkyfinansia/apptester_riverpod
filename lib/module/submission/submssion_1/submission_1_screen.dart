import 'package:app_riverpod/core/state/base_state.dart';
import 'package:app_riverpod/module/submission/common/district/district_dropdown.dart';
import 'package:app_riverpod/module/submission/common/province/province_dropdown.dart';
import 'package:app_riverpod/module/submission/common/stepper/stepper_notifier.dart';
import 'package:app_riverpod/module/submission/submission_2/route/suhmission_2_input.dart';
import 'package:app_riverpod/module/submission/submission_3/route/suhmission_3_input.dart';
import 'package:app_riverpod/module/submission/submssion_1/notifier/submission_1_notifier.dart';
import 'package:app_riverpod/module/submission/submssion_1/route/suhmission_1_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Submission1Screen extends ConsumerStatefulWidget {
  const Submission1Screen({
    super.key,
    required this.input,
    required this.navigateToSubmission2,
    required this.navigateToSubmission3,
    required this.backToHome,
  });

  final Submission1Input input;
  final void Function(Submission2Input) navigateToSubmission2;
  final void Function(Submission3Input) navigateToSubmission3;
  final void Function() backToHome;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Submission1ScreenState();
}

class _Submission1ScreenState extends ConsumerState<Submission1Screen> {
  // Declare notifier as global variable when it is used in all over class
  late final Submission1Notifier submission1Notifier;

  @override
  void initState() {
    // Initialize notifier with customer id from screen input
    submission1Notifier = ref.read(submission1NotifierProvider.notifier);
    Future.microtask(() => submission1Notifier.onInitialized(widget.input.customerId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final submission1State = ref.watch(submission1NotifierProvider);

    print("BUILD SUBMISSION SCREEN");
    return Stack(
      alignment: Alignment.center,
      children: [
        renderContent(),
        Visibility(
          visible: submission1State.stateStatus == StateStatus.loading,
          child: const Center(child: CircularProgressIndicator()),
        ),
      ],
    );
  }

  Widget renderContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        renderCustomerId(),
        const SizedBox(height: 20),

        // Province Dropdown Widget has it's own state & notifier inside it's class
        const ProvinceDropdown(),
        const SizedBox(height: 10),

        // District Dropdown Widget has it's own state & notifier inside it's class
        const DistrictDropdown(),
        const SizedBox(height: 10),

        ElevatedButton(
          onPressed: () {
            // Navigate using notifier method
            submission1Notifier.onTapButton(
              currentStep: ref.watch(stepperNotifierProvider),
              navigateToSubmission2: widget.navigateToSubmission2,
              navigateToSubmission3: widget.navigateToSubmission3,
            );
          },
          child: const Text('Next'),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            widget.backToHome();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }

  // only rebuild when state.data (customer id) change
  Consumer renderCustomerId() {
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        print("BUILD CUSTOMER ID TEXT");
        return Text("Customer id: ${ref.watch(submission1NotifierProvider.select((value) => value.data))}");
      },
    );
  }
}
