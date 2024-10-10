import 'package:get/get.dart';

import 'package:states/models/user.dart';

class UserController extends GetxController {
  var existUser = false.obs;
  var user = User.fromJson({}).obs;

  int get professionsLength => user.value.professions.length;

  void setUser(User user) {
    existUser.value = true;
    this.user.value = user;
  }

  void clearUser() {
    existUser.value = false;
    user.value = User.fromJson({});
  }

  void changeAge(int age) {
    user.update((value) => value?.age = age);
  }

  void addProfession() {
    user.update((value) =>
        value?.professions.add('Profession ${professionsLength + 1}'));
  }
}
