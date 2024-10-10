part of 'user_bloc.dart';

enum UserStatus {
  initial,
  loading,
  loaded,
  error,
}

@immutable
class UserState {
  const UserState({required this.user, required this.status, this.error});

  final User? user;
  final UserStatus? status;
  final String? error;

  UserState copyWith({
    User? user,
    UserStatus? status,
    String? error,
  }) {
    return UserState(
      user: user ?? this.user,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  List<Object> get props => [user!, status!];

  @override
  String toString() => 'UserState { user: $user, status: $status }';
}
