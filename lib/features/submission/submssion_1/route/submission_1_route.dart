import 'package:app_riverpod/core/router/base_route.dart';
import 'package:app_riverpod/features/submission/submission_2/route/submission_2_route.dart';
import 'package:app_riverpod/features/submission/submission_3/route/submission_3_route.dart';
import 'package:app_riverpod/features/submission/submssion_1/route/suhmission_1_input.dart';
import 'package:app_riverpod/features/submission/submssion_1/submission_1_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Submission1Route extends BaseRoute<Submission1Input, Null> {
  Submission1Route({
    super.name = "submission_1",
    super.path = "/submission_1",
  });

  GoRoute route(GlobalKey<NavigatorState> parentNavigatorKey) {
    return GoRoute(
      name: name,
      path: path,
      parentNavigatorKey: parentNavigatorKey,
      builder: (context, state) {
        return Submission1Screen(
          input: state.extra as Submission1Input,
          navigateToSubmission2: (input) {
            Submission2Route().push(context, input: input);
          },
          navigateToSubmission3: (input) {
            Submission3Route().push(context, input: input);
          },
          backToHome: () {
            pop(context);
          }
        );
      },
    );
  }
}