import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit()
      : super(const UserState(
          status: UserStatus.initial,
          user: null,
        ));

  setUser(User user) {
    emit(state.copyWith(status: UserStatus.loading));
    Future.delayed(const Duration(seconds: 1), () {
      emit(state.copyWith(
        status: UserStatus.loaded,
        user: user,
      ));
    });
  }

  changeAge(int age) {
    emit(state.copyWith(
        status: UserStatus.ageChanged, user: state.user!.copyWith(age: age)));
  }

  addProfession() {
    final profession = 'Profession ${state.user!.professions.length + 1}';
    emit(state.copyWith(
        status: UserStatus.professionAdded,
        user: state.user!.copyWith(professions: [
          ...state.user!.professions,
          profession,
        ])));
  }

  get deleteUser {
    emit(const UserState(status: UserStatus.initial, user: null));
  }
}
