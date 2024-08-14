import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/app/dependency_injection.dart';
import 'package:flutter_clean_architecture/presentation/resources/routes_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/theme_manager.dart';
import 'package:flutter_clean_architecture/simple_bloc_observer.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  Bloc.observer = SimpleBlocObserver();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyApp._internal(); // private named constructor

  static final MyApp instance = MyApp
      ._internal(); //singleton for single instance so only one object gets created for both ios and android

  factory MyApp() => instance;

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GoRouter goRoute = AppRoutes(initRoute: Routes.mainRoute).router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: goRoute.routeInformationParser,
      routeInformationProvider: goRoute.routeInformationProvider,
      routerDelegate: goRoute.routerDelegate,
      theme: getApplicationTheme(),
    );
  }
}
