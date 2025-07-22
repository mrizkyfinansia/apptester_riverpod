import 'package:app_riverpod/core/router/base_route.dart';
import 'package:app_riverpod/features/pin/pin_screen.dart';
import 'package:app_riverpod/features/pin/route/pin_output.dart';
import 'package:go_router/go_router.dart';

// Screen does not need input
class PinRoute extends BaseRoute<Null, PinOutput> {
  PinRoute({
    super.name = "pin",
    super.path = "/pin",
  });
  
  GoRoute route() {
    return GoRoute(
      name: name,
      path: path,
      builder: (context, state) {
        return PinScreen(
          navigateOut: (output) {
            pop(context, output: output);
          },
        );
      },
    );
  }
}