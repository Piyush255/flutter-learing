import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'CreateAccount.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  int no = 10;
  final _formKey = new GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    /*String _email;
    String _password;*/
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          Text("Sign in", style: TextStyle(fontSize: 28)),
          Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.fromLTRB(2, 100, 0, 0),
              child: Text("Email")),
          Container(
            margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(hexColor("#BDCCE3")).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10.0),
                      border: null,
                    ),
                    child: TextField(
                      controller: emailController,
                      /*onSaved: (value) => _email = value!,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email cannot be empty";
                          } else {
                            if (value.isValidEmail()) {
                              return null;
                            }
                            return "Please enter value Email";
                          }
                        },*/
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Text(
                    "@demonstrationgrammar.edu.com",
                  ),
                ),
              ],
            ),
          ),
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.fromLTRB(2, 10, 0, 0),
              child: Text("Password")),
          Container(
            decoration: BoxDecoration(
                color: Color(hexColor("#BDCCE3")).withOpacity(0.2),
                borderRadius: BorderRadius.circular(10.0),
                border: null),
            margin: EdgeInsets.fromLTRB(0, 3, 0, 0),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              /*validator: (value) =>
                  value!.isEmpty ? 'Password cannot be empty' : null,*/
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15),
                hintText: "Enter password",
                hintStyle: TextStyle(fontSize: 14),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              alignment: Alignment.centerRight,
              child: Text("Forgot password?")),
          Container(
            margin: EdgeInsets.fromLTRB(0, 70, 0, 10),
            width: MediaQuery.of(context).size.width * 0.9,
            height: 55,
            child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color(hexColor("#004EA0")),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                onPressed: () => {validateAndSave()},
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 17, color: Colors.white),
                )),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Dont't have an account? ",
                  style: TextStyle(color: Colors.grey)),
              TextSpan(
                  text: "CREATE",
                  style: TextStyle(color: Color(hexColor("#004EA0"))),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateAccount()));
                    }),
            ])),
          ),
        ]),
      ),
    ));
  }

  void validateAndSave() {
    if ((emailController.text.toString() + "@demonstrationgrammar.edu.com")
            .isValidEmail() &&
        passwordController.text.isNotEmpty) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    } else {
      debugPrint('form is invalid');
    }
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

int hexColor(String value) {
  return int.parse("0xff" + value.replaceAll("#", ""));
}
