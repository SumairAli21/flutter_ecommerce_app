import 'package:flutter/material.dart';
import 'package:project/wigits/color.dart';

class CheckoutButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ElevatedButton(
        onPressed: () {
          // Add functionality when the button is pressed
        },
        child: Text(
          'Proceed to Checkout',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            textStyle: TextStyle(fontSize: 16),
            backgroundColor: myColor.mybrown),
      ),
    );
  }
}
