import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/screen/home.dart';
import 'home.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  String name = "";
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.2),
                  const Text(
                    "Welcome!",
                    style: TextStyle(fontSize: 30, color: Colors.lightBlue),
                  ),
                  const Text(
                    "Please Login",
                    style: TextStyle(fontSize: 30, color: Colors.lightBlue),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Username",
                        hintText: "Enter name here",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Name";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Enter Password here",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter correct password";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Signup",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.amber,
                        child: IconButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.go("/homepage");
                            }
                          },
                          icon: const Icon(Icons.arrow_forward),
                          color: Colors.black,
                          iconSize: 28,
                        ),
                      )
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
