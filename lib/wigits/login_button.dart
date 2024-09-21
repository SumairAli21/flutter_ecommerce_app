import 'package:flutter/material.dart';
import 'package:project/screens/home_screen.dart';
import 'package:project/wigits/color.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MyHome()));
        },
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 110, vertical: 8),
            minimumSize: Size(55, 55),
            backgroundColor: myColor.mybrown),
        child: const Text(
          'Login',
          style: TextStyle(
              color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        ));
  }
}
