import 'package:flutter/material.dart';
import 'package:project/screens/home_screen.dart';
import 'package:project/screens/login.dart';
import 'package:project/screens/mycart_screen.dart';
import 'package:project/screens/profile_screen.dart';
import 'package:project/screens/splash_screen.dart';
import 'package:project/wigits/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: myColor.mybrown),
        brightness: Brightness.light,
      ),
      home: SplashScreen(),
    );
  }
}
