import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:flutter_appwire/constants/app_constants.dart';

class AuthState extends ChangeNotifier {
  Client client = Client();
  Account? account;

  AuthState() {
    _init();
  }
  _init() {
    client
        .setEndpoint(AppConstants.endpoint)
        .setProject(AppConstants.projectId);
    account = Account(client);
  }

  login(String email, String password) async {
    try {
      var result =
          await account!.createEmailSession(email: email, password: password);
      print(result);
    } catch (e) {
      print(e);
    }
  }

  createAccount(
      String name, String email, String password, String userId) async {
    try {
      var result = account!
          .create(name: name, email: email, password: password, userId: userId);
      print(result);
    } catch (e) {
      print(e);
    }
  }
}
