import 'package:app_riverpod/core/state/base_state.dart';
import 'package:app_riverpod/features/submission/submission_3/route/suhmission_3_input.dart';

class Submission3State extends BaseState<Submission3Input, Submission3State> {
  const Submission3State({
    required super.stateStatus, 
    required super.data,
    super.failure,
  });

  factory Submission3State.initial() => Submission3State(
    stateStatus: StateStatus.loading,
    data: Submission3Input.empty(),
  );
  
  @override
  Submission3State copyWith({
    StateStatus? stateStatus,
    Submission3Input? data,
    String? failure,
  }) => Submission3State(
    stateStatus: stateStatus ?? this.stateStatus,
    data: data ?? this.data,
    failure: failure ?? this.failure,
  );
}
