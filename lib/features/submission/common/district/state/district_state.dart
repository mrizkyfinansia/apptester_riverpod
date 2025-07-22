import 'package:app_riverpod/core/state/base_state.dart';
import 'package:app_riverpod/features/submission/common/district/state/district_data.dart';

class DistrictState extends BaseState<DistrictData, DistrictState> {
  const DistrictState({
    required super.stateStatus, 
    required super.data,
    super.failure,
  });

  factory DistrictState.initial() => DistrictState(
    stateStatus: StateStatus.initial,
    data: DistrictData.empty(),
  );

  DistrictState update(DistrictData data) => copyWith(
    stateStatus: StateStatus.success,
    data: data,
  );
  
  @override
  DistrictState copyWith({
    StateStatus? stateStatus,
    DistrictData? data,
    String? failure,
  }) => DistrictState(
    stateStatus: stateStatus ?? this.stateStatus,
    data: data ?? this.data,
    failure: failure ?? this.failure,
  );
}
