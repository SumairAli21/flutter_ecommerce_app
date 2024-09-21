import 'package:flutter/material.dart';
import 'package:project/screens/signin_screen.dart';

class Mysignin extends StatelessWidget {
  const Mysignin({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 70),
      child: Row(
        children: [
          Text('Dont you have an account?'),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MySignup()),
                );
              },
              child: Text(
                'Sign In',
                style: TextStyle(decoration: TextDecoration.underline),
              )),
        ],
      ),
    );
  }
}
