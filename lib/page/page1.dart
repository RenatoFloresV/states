import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user/user_cubit.dart';

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
        actions: [
          IconButton(
              onPressed: () => context.read<UserCubit>().deleteUser,
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (_, state) {
          final user = state.user;
          if (user == null || state.status == UserStatus.initial) {
            return const Center(child: Text('Loading...'));
          }
          return const UserInfo();
        },
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserCubit cubit) => cubit.state.user);
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          const Text('General',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ListTile(title: const Text('Name'), subtitle: Text(user!.name)),
          ListTile(
              title: const Text('Age'), subtitle: Text(user.age.toString())),
          ListTile(title: const Text('Gender'), subtitle: Text(user.gender)),
          const Text('Professions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ...user.professions
              .map((profession) => ListTile(title: Text(profession))),
        ],
      ),
    );
  }
}
