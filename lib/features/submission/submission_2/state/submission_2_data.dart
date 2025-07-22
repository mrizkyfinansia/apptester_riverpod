import 'package:app_riverpod/features/submission/submission_2/route/suhmission_2_input.dart';
import 'package:equatable/equatable.dart';

class Submission2Data extends Equatable {
  const Submission2Data({
    required this.input,
    required this.name,
    required this.email,
  }); 

  final Submission2Input input;
  final String name;
  final String email;

  factory Submission2Data.empty() => Submission2Data(
    input: Submission2Input.empty(),
    name: "",
    email: "",
  );

  Submission2Data copyWith({
    Submission2Input? input,
    String? name,
    String? email,
  }) => Submission2Data(
    input: input ?? this.input,
    name: name ?? this.name,
    email: email ?? this.email,
  );

  @override
  List<Object> get props => [input, name, email];
}