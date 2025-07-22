import 'package:app_riverpod/features/submission/common/stepper/stepper_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SubmissionScreen extends ConsumerWidget {
  const SubmissionScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stepperState = ref.watch(stepperNotifierProvider);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Step $stepperState"),
            const SizedBox(height: 20),
            child,
          ],
        ),
      ),
    );
  }
}