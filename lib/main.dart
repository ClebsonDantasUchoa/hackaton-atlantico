import 'package:flutter/material.dart';
import 'screens/LoginScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
        primarySwatch: Colors.blue,
        textTheme: TextTheme(display1: TextStyle(color: Colors.white, fontSize: 17))
      ),
      home: Login()
    );
  }
}