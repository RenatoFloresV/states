import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user/user_cubit.dart';
import '../models/user.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
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
                    final user = User(
                        name: 'Renato',
                        age: 27,
                        birthday: DateTime.parse('1997-25-01'),
                        gender: 'Male',
                        professions: [
                          'Developer',
                          'Flutter Developer',
                          'Frontend Developer',
                          'React Developer',
                          'Gamer',
                        ]);

                    context.read<UserCubit>().setUser(user);
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
                  onPressed: state.user != null
                      ? () => context.read<UserCubit>().addProfession()
                      : null,
                  child: Text('Add Profession',
                      style: TextStyle(
                          color: state.user != null
                              ? Colors.white
                              : Colors.black45,
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: state.user != null
                      ? () {
                          final random = Random();
                          final age = random.nextInt(100);
                          context.read<UserCubit>().changeAge(age);
                        }
                      : null,
                  child: Text('Set Age',
                      style: TextStyle(
                          color: state.user != null
                              ? Colors.white
                              : Colors.black45,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
