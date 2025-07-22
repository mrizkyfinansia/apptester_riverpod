import 'package:app_riverpod/core/state/base_state.dart';
import 'package:app_riverpod/features/submission/submission_2/state/submission_2_data.dart';

class Submission2State extends BaseState<Submission2Data, Submission2State> {
  const Submission2State({
    required super.stateStatus, 
    required super.data,
    super.failure,
  });

  factory Submission2State.initial() => Submission2State(
    stateStatus: StateStatus.loading,
    data: Submission2Data.empty(),
  );
  
  @override
  Submission2State copyWith({
    StateStatus? stateStatus,
    Submission2Data? data,
    String? failure,
  }) => Submission2State(
    stateStatus: stateStatus ?? this.stateStatus,
    data: data ?? this.data,
    failure: failure ?? this.failure,
  );
}
