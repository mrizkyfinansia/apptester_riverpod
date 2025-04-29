import 'package:app_riverpod/core/router/base_route.dart';
import 'package:app_riverpod/module/home/route/home_route.dart';
import 'package:app_riverpod/module/submission/submission_3/route/suhmission_3_input.dart';
import 'package:app_riverpod/module/submission/submission_3/route/suhmission_3_output.dart';
import 'package:app_riverpod/module/submission/submission_3/submission_3_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Submission3Route extends BaseRoute<Submission3Input, Submission3Output> {
  Submission3Route({
    super.name = "submission_3",
    super.path = "/submission_3",
  });

  GoRoute route(GlobalKey<NavigatorState> parentNavigatorKey) {
    return GoRoute(
      name: name,
      path: path,
      parentNavigatorKey: parentNavigatorKey,
      builder: (context, state) {
        return Submission3Screen(
          input: state.extra as Submission3Input,
          backToSubmission2: (output) {
            pop(
              context,
              output: output,
            );
          },
          offToHome: (output) {
            HomeRoute().go(context);
          },
        );
      },
    );
  }
}