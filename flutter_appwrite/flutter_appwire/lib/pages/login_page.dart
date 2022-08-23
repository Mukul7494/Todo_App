import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod/provider/provider.dart';

// import '../state/auth_state.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final authProvider = ChangeNotifierProvider((ref) => AuthState());
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(19),
          children: [
            Text(
              "Login",
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _email,
              decoration: InputDecoration(
                hintText: "Enter email",
                label: Text("Email"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _password,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter Password ",
                label: Text("Password"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Consumer(builder: (context, ref, child) {
                final provider = ref.watch(authProvider);
                return ElevatedButton(
                  onPressed: () {
                    provider.login(_email.text, _password.text);
                  },
                  child: Text("Login"),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
