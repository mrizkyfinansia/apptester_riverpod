import 'package:app_riverpod/core/state/base_state.dart';

class Submission1State extends BaseState<String, Submission1State> {
  const Submission1State({
    required super.stateStatus, 
    required super.data,
    super.failure,
  });

  factory Submission1State.initial() => const Submission1State(
    stateStatus: StateStatus.loading,
    data: '',
  );
  
  @override
  Submission1State copyWith({
    StateStatus? stateStatus,
    String? data,
    String? failure,
  }) => Submission1State(
    stateStatus: stateStatus ?? this.stateStatus,
    data: data ?? this.data,
    failure: failure ?? this.failure,
  );
}
