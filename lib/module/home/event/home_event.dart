import 'package:flutter/material.dart';

sealed class HomeEvent {}

class OnInitial extends HomeEvent {}

class OnRefresh extends HomeEvent {}

class OnUpdateData extends HomeEvent {
  final String username;

  OnUpdateData({required this.username});
}

class OnTapNavigate extends HomeEvent {
  final BuildContext context;
  final String prospectId;

  OnTapNavigate({
    required this.context,
    required this.prospectId,
  });
}


class OnTapNavigateSubmission extends HomeEvent {
  final BuildContext context;
  final String customerId;

  OnTapNavigateSubmission({
    required this.context,
    required this.customerId,
  });
}