import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'page/page1.dart';
import 'page/page2.dart';
import 'services/user_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserService()),
      ],
      child: MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: '/page1', // <-- initial route
        routes: {
          '/page1': (context) => const Page1(),
          '/page2': (context) => const Page2(),
        },
      ),
    );
  }
}
