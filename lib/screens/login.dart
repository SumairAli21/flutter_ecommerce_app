import 'package:flutter/material.dart';
import 'package:project/wigits/color.dart';
import 'package:project/wigits/login_button.dart';
import 'package:project/wigits/emai.dart';
import 'package:project/wigits/password.dart';
import 'package:project/wigits/signin.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Login',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: myColor.mybrown),
              ),
            ),
            SizedBox(height: 100),
            MyEmail(),
            SizedBox(height: 10),
            MyPassword(),
            SizedBox(height: 20),
            MyButton(),
            SizedBox(
              height: 100,
            ),
            Mysignin(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('assets/images/insta.jpg'),
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/facebook.jpg'),
                  backgroundColor: Colors.transparent,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
