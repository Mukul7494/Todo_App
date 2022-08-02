// ignore_for_file: invalid_required_positional_param

// import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  final String name;
  final int password;
  const User({required this.name, required this.password});
}

class UserState extends StateNotifier<User?> {
  UserState() : super(null);
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<void> login(String email, String password) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('email', true);
    state = const User(name: "My Name", password: 123456);
  }

  Future<void> logout() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('email', false);
    state = null;
  }

  Future<void> isAuthenticated() async {
    final SharedPreferences prefs = await _prefs;
    final bool isData = prefs.getBool('email') ?? false;
    if (!isData) {
      state = null;
      return;
    }
    state = User(
      name: "MY Name",
      password: 123456,
    );
  }
}

final userProvider = StateNotifierProvider<UserState, User?>((ref) {
  return UserState();
});
