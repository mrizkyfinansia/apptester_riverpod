import 'package:app_riverpod/features/pin/route/pin_output.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pin_notifier.g.dart';

@riverpod
class PinNotifier extends _$PinNotifier {
  @override
  void build() {}

  Future<void> onSubmitPin(void Function(PinOutput) navigateOut, String pin) async {
    if(pin.isEmpty) {
      navigateOut(const PinOutput(isSuccess: false));
    } else {
      navigateOut(const PinOutput(isSuccess: true));
    }
  }
}