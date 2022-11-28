import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {

  MyApp._internal(); // private named constructor

  static final MyApp instance = MyApp
      ._internal(); //singleton for single instance so only one object gets created for both ios and android

  factory  MyApp() => instance;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

