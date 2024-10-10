import 'package:flutter/material.dart';

import 'package:get/route_manager.dart';

import 'page/page1.dart';
import 'page/page2.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      initialRoute: '/page1', // <-- initial route1
      theme: ThemeData.dark(),
      getPages: [
        GetPage(name: '/page1', page: () => const Page1()),
        GetPage(name: '/page2', page: () => const Page2()),
      ],
      // routes: {
      //   '/page1': (context) => const Page1(),
      //   '/page2': (context) => const Page2(),
      // },
    );
  }
}
