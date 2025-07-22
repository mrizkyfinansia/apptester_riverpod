import 'package:app_riverpod/features/pin/notifier/pin_notifier.dart';
import 'package:app_riverpod/features/pin/route/pin_output.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PinScreen extends ConsumerWidget {
  const PinScreen({
    super.key,
    required this.navigateOut,
  });

  final void Function(PinOutput) navigateOut;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final event = ref.read(pinNotifierProvider.notifier);
    final text = TextEditingController();
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: text,
                ),
                ElevatedButton(
                  onPressed: ()  {
                    event.onSubmitPin(navigateOut, text.text);
                  },
                  child: const Text('Submit pin'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}