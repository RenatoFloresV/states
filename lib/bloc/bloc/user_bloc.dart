import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc()
      : super(const UserState(
          user: null,
          status: UserStatus.initial,
        )) {
    on<SetUser>(_setUser());
    on<ChangeAge>(_changeAge());
    on<AddProfession>(_addProfession());
    on<DeleteUser>(_deleteUser());
  }

  EventHandler<SetUser, UserState> _setUser() {
    return (event, emit) async {
      emit(state.copyWith(user: event.user, status: UserStatus.loading));
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(
        user: event.user,
        status: UserStatus.loaded,
      ));
    };
  }

  EventHandler<ChangeAge, UserState> _changeAge() {
    return (event, emit) {
      if (state.user == null) {
        emit(state.copyWith(
            status: UserStatus.error, error: 'The user is null'));
      } else {
        emit(state.copyWith(user: state.user!.copyWith(age: event.age)));
      }
    };
  }

  EventHandler<AddProfession, UserState> _addProfession() {
    return (event, emit) {
      if (state.user == null) {
        emit(state.copyWith(
            status: UserStatus.error, error: 'The user is null'));
      } else {
        final profession = 'Profession ${state.user!.professions.length + 1}';
        emit(state.copyWith(
            user: state.user!.copyWith(professions: [
          ...state.user!.professions,
          profession,
        ])));
      }
    };
  }

  EventHandler<DeleteUser, UserState> _deleteUser() {
    return (event, emit) {
      emit(const UserState(status: UserStatus.initial, user: null));
    };
  }
}
