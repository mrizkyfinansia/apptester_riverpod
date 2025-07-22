import 'package:equatable/equatable.dart';

class HomeData extends Equatable {
  const HomeData({
    required this.user,
    required this.role,
    required this.notifCount,
  }); 

  final User user;
  final Role role;
  final int notifCount;

  factory HomeData.empty() => HomeData(
    user: User.empty(),
    role: Role.empty(),
    notifCount: 0,
  );

  HomeData copyWith({
    User? user,
    Role? role,
    int? notifCount,
  }) => HomeData(
    user: user ?? this.user,
    role: role ?? this.role,
    notifCount: notifCount ?? this.notifCount,
  );

  @override
  List<Object> get props => [user, notifCount];
}




// ENTITY
class User extends Equatable {
  const User({required this.username, required this.email}); 

  final String username;
  final String email;

  factory User.empty() => const User(username: "", email: "");

  User copyWith({
    String? username,
    String? email,
  }) => User(
    username: username ?? this.username,
    email: email ?? this.email,
  );

  @override
  List<Object> get props => [username, email];
}

class Role extends Equatable {
  const Role({required this.role}); 

  final String role;

  factory Role.empty() => const Role(role: "");

  Role copyWith({
    String? role,
  }) => Role(
    role: role ?? this.role,
  );

  @override
  List<Object> get props => [role];
}