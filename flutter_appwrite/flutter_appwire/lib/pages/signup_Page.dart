import 'package:flutter/material.dart';
import 'package:flutter_appwire/riverpod/provider/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  final userId = "1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup Page"),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(19),
          children: [
            Text(
              "Signup",
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _name,
              decoration: InputDecoration(
                hintText: "Enter Name",
                label: Text("Name"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _email,
              decoration: InputDecoration(
                hintText: "Enter Email ",
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
            Consumer(
              builder: (context, ref, child) {
                final signProvider = ref.watch(authProvider);
                return Center(
                  child: ElevatedButton(
                    onPressed: () {
                      signProvider.createAccount(
                          _name.text, _email.text, _password.text, userId);
                    },
                    child: Text("Signup"),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
