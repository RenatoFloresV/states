import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../services/user_service.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.skip_next),
          onPressed: () {
            Navigator.pushNamed(context, '/page2');
          }),
      appBar: AppBar(
        title: const Text('Page 1'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => userService.removeUser(),
          ),
        ],
      ),
      body: userService.existsUser()
          ? SingleChildScrollView(
              child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  child: const UserInfo()))
          : const Center(child: Text('User not found')),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserService>(context).getUser();
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
          ListTile(title: const Text('Gender'), subtitle: Text(user.gender)),
          const Text('Professions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(height: 1),
          ...user.professions.map(
            (profession) => ListTile(
              title: Text(profession),
              onTap: () {
                // userService.removeProfession(profession);
              },
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
