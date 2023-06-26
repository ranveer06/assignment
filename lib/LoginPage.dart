// ignore_for_file: use_key_in_widget_constructors

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  String userId = "";
  String password = "";
  final _formKey = GlobalKey<FormState>();

  bool isPasswordCompliant(String? password, [int minLength = 7]) {
    if (password == null || password.isEmpty) {
      return false;
    }

    bool hasUppercase = RegExp(r'[A-Z]').hasMatch(password);
    bool hasDigits = password.contains(RegExp(r'[0-9]'));
    bool hasLowercase = password.contains(RegExp(r'[a-z]'));
    bool hasSpecialCharacters =
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool hasMinLength = password.length > minLength;

    return hasDigits &
        hasUppercase &
        hasLowercase &
        hasSpecialCharacters &
        hasMinLength;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
          centerTitle: true,
        ),
        body: Container(padding: EdgeInsets.all(10), child: Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(
              initialValue: "",
              onChanged: (value) => setState(() => userId = value),
              decoration: InputDecoration(hintText: 'Enter email'),
              keyboardType: TextInputType.emailAddress,
              validator: (userId) {
                bool isUserIdValid = false;
                if (userId != null) {
                  isUserIdValid = EmailValidator.validate(userId);
                }
                if (!isUserIdValid) {
                  return "Enter a valid email.";
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              initialValue: "",
              obscureText: true,
              onChanged: (value) => setState(() => password = value),
              decoration: InputDecoration(hintText: 'Enter password'),
              validator: (password) {
                bool isPasswordValid = false;
                if (password != null) {
                  isPasswordValid = isPasswordCompliant(password);
                }
                if (!isPasswordValid) {
                  return "Enter a valid password.";
                }
                return null;
              },
            ),
            ElevatedButton(
              child: Text("Login"),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                }
              },
            )
          ]),
        )));
  }
}
