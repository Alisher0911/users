import 'package:equatable/equatable.dart';
import 'package:makit/data/models/user/user_model.dart';

enum UserStatus { loading, success, error }

class UserState extends Equatable {
  final List<User> users;
  final UserStatus userStatus;

  const UserState({
    required this.users,
    required this.userStatus
  });

  factory UserState.loading() {
    return const UserState(
      users: [],
      userStatus: UserStatus.loading
    );
  }

  @override
  List<Object> get props => [users, userStatus];

  UserState copyWith({
    List<User>? users,
    UserStatus? userStatus,
  }) {
    return UserState(
      users: users ?? this.users,
      userStatus: userStatus ?? this.userStatus,
    );
  }
}