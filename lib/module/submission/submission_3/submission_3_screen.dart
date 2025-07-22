import 'package:app_riverpod/module/submission/submission_3/notifier/submission_3_notifier.dart';
import 'package:app_riverpod/module/submission/submission_3/route/suhmission_3_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Submission3Screen extends ConsumerStatefulWidget {
  const Submission3Screen({
    super.key,
    required this.input,
    required this.backToSubmission2,
    required this.offToHome,
  });

  final Submission3Input input;
  final void Function() backToSubmission2;
  final void Function() offToHome;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Submission3ScreenState();
}

class _Submission3ScreenState extends ConsumerState<Submission3Screen> {
  // Declare notifier as global variable when it is used in all over class
  late final Submission3Notifier submission3Notifier;

  @override
  void initState() {
    // Initialize notifier using screen input
    submission3Notifier = ref.read(submission3NotifierProvider.notifier);
    Future.microtask(() => submission3Notifier.onInitialized(widget.input));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("Review Data"),
        const SizedBox(height: 20),
        renderCustomerData(),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            submission3Notifier.onSubmited(
              offToHome: widget.offToHome,
            );
          },
          child: const Text('Submit'),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            submission3Notifier.onNavigatedBack(
              backToSubmission2: widget.backToSubmission2,
            );
          },
          child: const Text('back'),
        ),
      ],
    );
  }

    // only rebuild when state.data change
  Consumer renderCustomerData() {
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        final submission3State = ref.watch(submission3NotifierProvider.select((selector) => selector.data));
        return Column(
          children: [
            rowText("Customer id", submission3State.customerData.id.toString()),
            rowText("Name", submission3State.customerData.name),
            rowText("Email", submission3State.customerData.email),
            rowText("Province", submission3State.customerData.province),
            rowText("District", submission3State.customerData.district),
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