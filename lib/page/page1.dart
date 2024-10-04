import 'package:flutter/material.dart';

import 'package:states/models/user.dart';
import 'package:states/services/user_service.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.skip_next),
          onPressed: () {
            Navigator.pushNamed(context, '/page2');
          }),
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: StreamBuilder(
          stream: userService.userStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return UserInfo(user: snapshot.data!);
            } else {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('No user loaded'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      child: const Text('Go to assign user'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/page2');
                      }),
                ],
              ));
            }
          }),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({required this.user, super.key});

  final User user;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          const Text('General',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ListTile(title: const Text('Name'), subtitle: Text(user.name)),
          ListTile(
              title: const Text('Age'), subtitle: Text(user.age.toString())),
          const ListTile(title: Text('Gender')),
          const Text('Professions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          const ListTile(title: Text('Developer')),
        ],
      ),
    );
  }
}
