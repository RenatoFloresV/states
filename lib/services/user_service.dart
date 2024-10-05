import 'package:flutter/material.dart';

import 'package:states/models/user.dart';

class UserService with ChangeNotifier {
  User? _user;

  User getUser() => _user!;
  bool existsUser() => _user != null;
  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  void setAge(int age) {
    final user = getUser();
    user.age = age;
    setUser(user);
  }

  void removeUser() {
    _user = null;
    notifyListeners();
  }

  void addProfession(String profession) {
    final user = getUser();
    user.professions.add('Profession ${user.professions.length + 1}');
    setUser(user);
  }
}
