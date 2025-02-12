import 'package:flutter/material.dart';

import 'page/page1.dart';
import 'page/page2.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: '/page1', // <-- initial route
      routes: {
        '/page1': (context) => const Page1(),
        '/page2': (context) => const Page2(),
      },
    );
  }
}
