import 'package:app_riverpod/core/state/base_state.dart';
import 'package:app_riverpod/module/submission/submission_2/notifier/submission_2_notifier.dart';
import 'package:app_riverpod/module/submission/submission_2/route/suhmission_2_input.dart';
import 'package:app_riverpod/module/submission/submission_3/route/suhmission_3_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Submission2Screen extends ConsumerStatefulWidget {
  const Submission2Screen({
    super.key,
    required this.input,
    required this.navigateToSubmission3,
    required this.backToSubmission1,
  });

  final Submission2Input input;
  final void Function(Submission3Input) navigateToSubmission3;
  final void Function() backToSubmission1;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Submission2ScreenState();
}

class _Submission2ScreenState extends ConsumerState<Submission2Screen> {
  // Declare notifier as global variable when it is used in all over class
  late final Submission2Notifier submission2Notifier;

  @override
  void initState() {
    // Initialize notifier using screen input
    submission2Notifier = ref.read(submission2NotifierProvider.notifier);
    Future.microtask(() => submission2Notifier.onInitialized(widget.input));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final submission2State = ref.watch(submission2NotifierProvider);
    return Stack(
      alignment: Alignment.center,
      children: [
        renderContent(),
        Visibility(
          visible: submission2State.stateStatus == StateStatus.loading,
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
        renderCustomerAddress(),
        const SizedBox(height: 20),
        SizedBox(
          width: 100,
          height: 50,
          child: TextField(
            decoration: const InputDecoration(
              label: Text("Name"),
              hintText: "Input Name",
            ),
            onChanged: (value) {
              submission2Notifier.onChangedName(value);
            },
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 100, 
          height: 50,
          child: TextField(
            decoration: const InputDecoration(
              label: Text("Email"),
              hintText: "Input Email",
            ),
            onChanged: (value) {
              submission2Notifier.onChangedEmail(value);
            },
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            submission2Notifier.onTapButton(navigateToSubmission3: widget.navigateToSubmission3);
          },
          child: const Text('Next'),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            submission2Notifier.onTapBackButton(widget.backToSubmission1);
          },
          child: const Text('back'),
        ),
      ],
    );
  }


  // only rebuild when state.data change
  Consumer renderCustomerAddress() {
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        final submission2State = ref.watch(submission2NotifierProvider.select((selector) => selector.data));
        return Column(
          children: [
            const Text("Customer Address"),
            const SizedBox(height: 5),
            rowText("Customer id", submission2State.input.customerId),
            rowText("Province", submission2State.input.province.name),
            rowText("District", submission2State.input.district.name),
            const Divider(),
          ],
        );
      },
    );
  }

  Row rowText(String label, String value) {
    return Row(
      children: [
        Text(label),
        const SizedBox(width: 10),
        Text(value),
      ],
    );
  }
}