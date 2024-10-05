import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:states/services/user_service.dart';

import '../models/user.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: userService.existsUser()
            ? Text(userService.getUser().name)
            : const Text('Page 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.purple[400]),
              onPressed: () {
                final user = User(
                  name: 'Renato',
                  age: 27,
                  birthday: DateTime.now(),
                  gender: 'Male',
                  professions: ['Developer', 'Gamer', 'Autodidact'],
                );
                userService.setUser(user);
              },
              child: const Text('Set User',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.purple[400]),
              onPressed: () {
                userService.addProfession('Developer');
              },
              child: const Text('Add Profession',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.purple[400]),
              onPressed: () {
                userService.setAge(28);
              },
              child: const Text('Set Age',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
