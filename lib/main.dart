import 'package:flutter/material.dart';
import 'package:todo_app/screen/login.dart';
import './screen/login.dart';
import 'package:go_router/go_router.dart';
import './router.dart';

import 'screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.indigoAccent),
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      // home: const LoginPage(),
      // home: Home(),
    );
  }
}
