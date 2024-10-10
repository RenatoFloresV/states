import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_controller.dart';
import '../models/user.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    final userCtrl = Get.put(UserController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.skip_next),
        onPressed: () => Get.toNamed('/page2'),
      ),
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: Obx(
        () => userCtrl.existUser.value
            ? UserInfo(
                user: userCtrl.user.value,
              )
            : const NoUser(),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const Text('General',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Divider(),
            ListTile(title: const Text('Name'), subtitle: Text(user.name)),
            ListTile(
                title: const Text('Age'), subtitle: Text(user.age.toString())),
            ListTile(title: const Text('Gender'), subtitle: Text(user.gender)),
            const Text('Professions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Divider(),
            ...user.professions.map(
              (e) => ListTile(
                title: Text(e),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NoUser extends StatelessWidget {
  const NoUser({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Text('No user',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
