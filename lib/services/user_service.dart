import 'dart:async';

import '../models/user.dart';

class _UserService {
  User? _user;

  final StreamController<User?> _userController =
      StreamController<User?>.broadcast();

  Stream<User?> get userStream => _userController.stream;

  User getUser() => _user!;

  bool isUserLoaded() => _user != null;

  void loadUser(User user) {
    _user = user;
    _userController.add(_user);
  }

  void changeAge(int age) {
    _user!.age = age;
    _userController.add(_user);
  }

  dispose() {
    _userController.close();
  }
}

final userService = _UserService();
