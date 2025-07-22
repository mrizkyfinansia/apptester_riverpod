part of '../notifier/home_notifier.dart';

class HomeState extends BaseState<HomeData, HomeState> {
  const HomeState({
    required super.stateStatus, 
    required super.data,
    super.failure,
  });

  factory HomeState.initial() => HomeState(
    stateStatus: StateStatus.loading,
    data: HomeData.empty(),
  );

  HomeState update(HomeData data) => copyWith(
    stateStatus: StateStatus.success,
    data: data,
  );
  
  @override
  HomeState copyWith({
    StateStatus? stateStatus,
    HomeData? data,
    String? failure,
  }) => HomeState(
    stateStatus: stateStatus ?? this.stateStatus,
    data: data ?? this.data,
    failure: failure ?? this.failure,
  );
}
