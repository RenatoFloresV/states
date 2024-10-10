import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_controller.dart';
import '../models/user.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    final userCtrl = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                userCtrl.setUser(User(
                  name: 'Renato',
                  age: 27,
                  gender: 'Male',
                  professions: ['Developer', 'Designer'],
                ));
                Get.snackbar('User', 'User set!',
                    snackPosition: SnackPosition.BOTTOM);
              },
              child: const Text('Set User',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                userCtrl.addProfession();
              },
              child: const Text('Add Profession',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                userCtrl.changeAge(30);
              },
              child: const Text('Set Age',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                ThemeData theme = ThemeData.light();

                ThemeData darkTheme = ThemeData.dark();
                if (Get.isDarkMode) {
                  Get.changeTheme(theme);
                } else {
                  Get.changeTheme(darkTheme);
                }
              },
              child: const Text('Change theme',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
