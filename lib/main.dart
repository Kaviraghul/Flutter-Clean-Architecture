import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/app/app.dart';
import 'package:flutter_clean_architecture/app/dependencyInjection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(MyApp());
}
