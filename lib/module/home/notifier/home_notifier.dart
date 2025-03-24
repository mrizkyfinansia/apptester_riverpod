import 'package:app_riverpod/core/state/base_state.dart';
import 'package:app_riverpod/module/detail_transaction/route/detail_transaction_input_output.dart';
import 'package:app_riverpod/module/home/event/home_event.dart';
import 'package:app_riverpod/module/home/route/home_route.dart';
import 'package:app_riverpod/module/home/state/home_data.dart';
import 'package:app_riverpod/module/submission/submssion_1/route/suhmission_1_input_output.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_notifier.g.dart';

part '../state/home_state.dart';

@riverpod
class HomeNotifier extends _$HomeNotifier {
  @override
  HomeState build() {
    return HomeState.initial();
  }

  Future<void> onEvent(HomeEvent event) async {
    switch (event) {
      case OnInitial():
        await _fetchHome();
        break;
      case OnRefresh():
        await onRefresh();
        break;
      case OnUpdateData():
        await onUpdateData(event.username);
        break;
      case OnTapNavigate():
        await onTapNavigate(event.context, event.prospectId);
        break;
      case OnTapNavigateSubmission():
        await onTapNavigateSubmission(event.context, event.customerId);
        break;
    }
  }

  Future<void> onInitial() async {
    await _fetchHome();
  }

  Future<void> onRefresh() async {
    await _fetchHome(notif: 5);
  }

  Future<void> onUpdateData(String username) async {
    state = state.loading();
    await Future.delayed(const Duration(seconds: 1));
    state = state.update(state.data
        .copyWith(user: state.data.user.copyWith(username: username)));
  }

  Future<void> onTapNavigate(BuildContext context, String prospectId) async {
    final input = DetailTransactionInput(prospectId: prospectId);
    final result = await ref
        .read(homeRouteProvider)
        .navigateToDetailTransaction(context, input);
    if (result != null) {
      ref.read(homeNotifierProvider.notifier).onUpdateData(result.result);
    }
  }

  Future<void> onTapNavigateSubmission(
      BuildContext context, String customerId) async {
    final input = Submission1Input(customerId: customerId);
    final result =
        await ref.read(homeRouteProvider).navigatetoSubmission(context, input);
    if (result != null) {
      ref.read(homeNotifierProvider.notifier).onUpdateData(result.result);
    }
  }

  Future<void> _fetchHome({int notif = 1}) async {
    state = state.loading();
    await Future.delayed(const Duration(seconds: 1));
    state = state.success(
      data: HomeData(
        user: const User(username: "Sugeng", email: "sugeng@gmail.com"),
        role: const Role(role: "admin"),
        notifCount: notif,
      ),
    );
  }
}
