import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project/screens/login.dart';
import 'package:project/wigits/color.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Login()), // Replace with your login screen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background to white
      body: Stack(
        children: [
          // Circular decorations - match the style in the image
          Positioned(
            top: -50,
            left: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: myColor.mybrown.withOpacity(0.1), // Light brown circle
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            right: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: myColor.mybrown.withOpacity(0.1), // Light brown circle
              ),
            ),
          ),

          // Main content: logo and text in the center
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Add the brand logo (if any) here, or the brand text
                // The main "fashion." text styled to match your example
                Text(
                  'f',
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: myColor.mybrown, // Brown color for 'f'
                  ),
                ),
                Text(
                  'fashion.',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: myColor.mybrown, // Brown color for the text
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
