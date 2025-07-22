import 'package:app_riverpod/core/router/base_route.dart';
import 'package:app_riverpod/module/submission/submission_2/route/suhmission_2_input.dart';
import 'package:app_riverpod/module/submission/submission_2/submission_2_screen.dart';
import 'package:app_riverpod/module/submission/submission_3/route/submission_3_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class Submission2Route extends BaseRoute<Submission2Input, Null> {
  Submission2Route({
    super.name = "submission_2",
    super.path = "/submission_2",
  });

  GoRoute route(GlobalKey<NavigatorState> parentNavigatorKey) {
    return GoRoute(
      name: name,
      path: path,
      parentNavigatorKey: parentNavigatorKey,
      builder: (context, state) {
        return Submission2Screen(
          input: state.extra as Submission2Input,
          navigateToSubmission3: (input) {
            Submission3Route().push(context, input: input);
          },
          backToSubmission1: () {
            pop(context);
          }
        );
      },
    );
  }
}