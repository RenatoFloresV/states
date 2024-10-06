part of 'user_cubit.dart';

enum UserStatus {
  initial,
  loading,
  loaded,
  error,
  ageChanged,
  professionAdded,
}

@immutable
class UserState {
  const UserState({required this.status, required this.user});

  final UserStatus status;
  final User? user;

  UserState copyWith({
    UserStatus? status,
    User? user,
    int? age,
  }) {
    return UserState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  List<Object> get props => [status, user!];

  @override
  String toString() => 'UserState { status: $status, user: $user }';
}
