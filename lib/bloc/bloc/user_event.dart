part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

class SetUser extends UserEvent {
  final User user;

  SetUser(this.user);
}

class ChangeAge extends UserEvent {
  final int age;

  ChangeAge(this.age);
}

class AddProfession extends UserEvent {
  final String profession;

  AddProfession(this.profession);
}

class DeleteUser extends UserEvent {}
