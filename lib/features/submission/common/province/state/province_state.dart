import 'package:app_riverpod/core/state/base_state.dart';
import 'package:app_riverpod/features/submission/common/province/state/province_data.dart';

class ProvinceState extends BaseState<ProvinceData, ProvinceState> {
  const ProvinceState({
    required super.stateStatus, 
    required super.data,
    super.failure,
  });

  factory ProvinceState.initial() => ProvinceState(
    stateStatus: StateStatus.loading,
    data: ProvinceData.empty(),
  );

  ProvinceState update(ProvinceData data) => copyWith(
    stateStatus: StateStatus.success,
    data: data,
  );
  
  @override
  ProvinceState copyWith({
    StateStatus? stateStatus,
    ProvinceData? data,
    String? failure,
  }) => ProvinceState(
    stateStatus: stateStatus ?? this.stateStatus,
    data: data ?? this.data,
    failure: failure ?? this.failure,
  );
}
