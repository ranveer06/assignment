import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'LoginBloc.dart';
import 'LoginPage.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('My First App')),
        body: BlocProvider(
          create: (context) => LoginBloc(),
          child: LoginPage(),
        ),
      ),
    );
  }
}
