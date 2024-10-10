import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:states/bloc/bloc/user_bloc.dart';

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
              onPressed: () {
                context.read<UserBloc>().add(DeleteUser());
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          switch (state.status!) {
            case UserStatus.initial:
              return const Center(child: Text('Not user found'));
            case UserStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case UserStatus.loaded:
              return const UserInfo();
            case UserStatus.error:
              return Center(child: Text(state.error ?? 'Error'));
          }
        },
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
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
