// ignore_for_file: use_key_in_widget_constructors

import 'package:bbtry/LoginBloc.dart';
import 'package:bbtry/LoginState.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'HomePage.dart';
import 'LoginEvent.dart';
import 'SuccessDialog.dart';

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
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status == 'Success') {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          showDialog<void>(
            context: context,
            builder: (_) => const SuccessDialog(),
          );
        }
        if (state.status == 'In Progress') {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Submitting...')),
            );
        }
      },
      child: Scaffold(
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
                // if (_formKey.currentState!.validate()) {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => HomePage()),
                //   );
                // }
                //How do I create a FormSubmited Event with 2 attributes email, password and how do I emit that event
                print("SENSING EVNE");
                () => context.read<LoginBloc>().add(FormSubmitted(email: userId, password: password));
                print("SENSING EVNE222");
              },
            )
          ]),
        ))));
  }
}
