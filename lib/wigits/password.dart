import 'package:flutter/material.dart';

class MyPassword extends StatelessWidget {
  const MyPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Password',
            prefixIcon: Icon(Icons.lock),
            suffix: Icon(
              Icons.visibility_off,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            )),
      ),
    );
  }
}
