import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {

  // ignore: prefer_const_constructors_in_immutables
  MyApp._internal(); // private named constructor

  static final MyApp instance = MyApp
      ._internal(); //singleton for single instance so only one object gets created for both ios and android

  factory  MyApp() => instance;

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

