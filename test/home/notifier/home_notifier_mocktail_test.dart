import 'package:app_riverpod/module/home/notifier/home_notifier.dart';
import 'package:app_riverpod/module/home/route/home_route.dart';
import 'package:app_riverpod/module/submission/submssion_1/route/suhmission_1_input.dart';
import 'package:app_riverpod/module/submission/submssion_1/route/suhmission_1_output.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod_test/riverpod_test.dart';

import '../dummy/home_dummy.dart';

class MockHomeRoute extends Mock implements HomeRoute {}
class MockBuildContext extends Mock implements BuildContext {}

void main() {
  late MockHomeRoute mockHomeRoute;
  late MockBuildContext mockContext;

  setUp(() {
    mockHomeRoute = MockHomeRoute();
    mockContext = MockBuildContext();

    registerFallbackValue(const Submission1Input(customerId: ''));
  });

  testNotifier(
    'PROVIDER Initial state SHOULD be empty',
    provider: homeNotifierProvider,
    act: (notifier) => notifier.build(),
    expect: () => [],
  );

  testNotifier(
    'ACT onInitial SHOULD fetch home data and update state',
    provider: homeNotifierProvider,
    act: (notifier) => notifier.onInitial(),
    expect: () => [
      isA<HomeState>().having(
            (state) => state.stateStatus,
        descriptionStatus,
        statusInitialLoading,
      ),
      isA<HomeState>()
          .having(
            (state) => state.stateStatus,
        descriptionStatus,
        statusInitialSuccess,
      )
          .having(
            (state) => state.data.user.username,
        descriptionUsername,
        username,
      )
          .having(
            (state) => state.data.user.email,
        descriptionEmail,
        email,
      )
          .having(
            (state) => state.data.role.role,
        descriptionRole,
        role,
      )
          .having(
            (state) => state.data.notifCount,
        descriptionNotifCount,
        notifCount1,
      ),
    ],
  );

  testNotifier(
    'ACT onRefresh SHOULD fetch home data with notification count 5',
    provider: homeNotifierProvider,
    act: (notifier) => notifier.onRefresh(),
    expect: () => [
      isA<HomeState>().having((state) => state.stateStatus, descriptionStatus,
          statusInitialLoading),
      isA<HomeState>()
          .having(
            (state) => state.stateStatus,
        descriptionStatus,
        statusInitialSuccess,
      )
          .having(
            (state) => state.data.notifCount,
        descriptionNotifCount,
        notifCount5,
      ),
    ],
  );

  testNotifier(
    'ACT onUpdateData SHOULD update username',
    provider: homeNotifierProvider,
    act: (notifier) => notifier.onUpdateData(usernameTest),
    expect: () => [
      isA<HomeState>().having((state) => state.stateStatus, descriptionStatus,
          statusInitialLoading),
      isA<HomeState>()
          .having(
            (state) => state.stateStatus,
        descriptionStatus,
        statusInitialSuccess,
      )
          .having(
            (state) => state.data.user.username,
        descriptionUsername,
        usernameTest,
      ),
    ],
  );

  group('Navigation tests', () {
    testNotifier(
      'ACT onTapNavigateSubmission SHOULD navigate to submission and update data if result is not null',
      provider: homeNotifierProvider,
      overrides: [
        homeRouteProvider.overrideWith((ref) => mockHomeRoute),
      ],
      setUp: () async {
        when(() => mockHomeRoute.navigatetoSubmission(
          mockContext,
          any(),
        )).thenAnswer(
              (_) async => const Submission1Output(result: usernameSubmission),
        );
      },
      act: (notifier) =>
          notifier.onTapNavigateSubmission(mockContext, customerIdTest),
      wait: const Duration(seconds: 1),
      expect: () => [
        isA<HomeState>().having(
              (state) => state.stateStatus,
          descriptionStatus,
          statusInitialLoading,
        ),
        isA<HomeState>()
            .having(
              (state) => state.stateStatus,
          descriptionStatus,
          statusInitialSuccess,
        )
            .having(
              (state) => state.data.user.username,
          descriptionUsername,
          usernameSubmission,
        ),
      ],
      verify: (container) {
        verify(() => mockHomeRoute.navigatetoSubmission(
          mockContext,
          any(that: isA<Submission1Input>().having(
                (input) => input.customerId,
            descriptionCustomerId,
            customerIdTest,
          )),
        )).called(1);
      },
    );
  });
}
