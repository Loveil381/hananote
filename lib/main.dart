import 'package:flutter/material.dart';
import 'package:hananote/app/app.dart';
import 'package:hananote/app/di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const HanaNote());
}
