import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/screen/home.dart';
import 'package:todo_app/screen/login.dart';

final router = GoRouter(routes: [
  GoRoute(
    name: "login",
    path: "/",
    pageBuilder: (context, state) => const MaterialPage(child: LoginPage()),
  ),
  GoRoute(
    name: "homepage",
    path: "/homepage",
    pageBuilder: (context, state) => const MaterialPage(child: Home()),
  ),
  // GoRoute(
  //   name: "login",
  //   path: "/",
  //   pageBuilder: (context, state) => const MaterialPage(child: LoginPage()),
  // ),
  // GoRoute(
  //   name: "login",
  //   path: "/",
  //   pageBuilder: (context, state) => const MaterialPage(child: LoginPage()),
  // )
]);
