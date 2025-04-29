import 'package:app_riverpod/core/router/base_route.dart';
import 'package:app_riverpod/module/submission/submission_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class SubmissionRoute extends BaseRoute<int, int> {
  SubmissionRoute({
    super.name = "submission",
    super.path = "submission",
  });

  ShellRoute route({
    required List<GoRoute> shellRoutes,
    required GlobalKey<NavigatorState> shellNavigatorKey,
  }) {
    return ShellRoute(
      navigatorKey: shellNavigatorKey,
      builder: (context, state, child) => SubmissionScreen(child: child),
      routes: shellRoutes,
    );
  }
}