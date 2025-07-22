import 'package:app_riverpod/core/router/base_route.dart';
import 'package:app_riverpod/features/home/home_screen.dart';
import 'package:app_riverpod/features/home/route/home_output.dart';
import 'package:app_riverpod/features/submission/submssion_1/route/submission_1_route.dart';
import 'package:go_router/go_router.dart';

// Screen does not need input
class HomeRoute extends BaseRoute<Null, HomeOutput> {
  HomeRoute({
    super.name = "home",
    super.path = "/home",
  });
  
  GoRoute route() {
    return GoRoute(
      name: name,
      path: path,
      builder: (context, state) {
        return HomeScreen(
          navigateToSubmission1: (input) {
            Submission1Route().push(context, input: input);
          },
        );
      },
    );
  }
}