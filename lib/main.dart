import 'package:demo/widgets/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:demo/services/locator/locator.dart';

void main() {
  setupLocators();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Flutter Demo', home: HomeScreen());
  }
}
