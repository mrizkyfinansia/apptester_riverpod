import 'package:app_riverpod/features/home/route/home_route.dart';
import 'package:app_riverpod/features/submission/submission_2/route/submission_2_route.dart';
import 'package:app_riverpod/features/submission/submission_3/route/submission_3_route.dart';
import 'package:app_riverpod/features/submission/submission_route.dart';
import 'package:app_riverpod/features/submission/submssion_1/route/submission_1_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'route_manager.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: HomeRoute().path,
    navigatorKey: _rootNavigatorKey,
    routes: [
      HomeRoute().route(),
      SubmissionRoute().route(
        shellNavigatorKey: _shellNavigatorKey,
        shellRoutes: [
          Submission1Route().route(_shellNavigatorKey),
          Submission2Route().route(_shellNavigatorKey),
          Submission3Route().route(_shellNavigatorKey),
        ],
      ),
    ],
  );
}