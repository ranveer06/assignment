import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState(){
     return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
          title: Text('Welcome'),
          centerTitle: true,
        ), body: Container(padding: EdgeInsets.all(10), color: Colors.white, child: Column(children: [Text("Welcome Home!")],)));
  }

}