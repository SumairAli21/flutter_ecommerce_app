import 'package:flutter/material.dart';
import 'package:project/screens/main_screen.dart';
import 'package:project/wigits/cart_item_widget.dart';
import 'package:project/wigits/cart_manager.dart';
import 'package:project/wigits/check_out_button.dart';
import 'package:project/wigits/total_price.dart';

class MyCartScreen extends StatefulWidget {
  @override
  _MyCartScreenState createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  double totalPrice = 0.0;

  // Update total price
  void updateTotalPrice() {
    setState(() {
      totalPrice = CartManager.getTotalPrice();
    });
  }

  @override
  void initState() {
    super.initState();
    // Calculate the total price when the screen is initialized
    updateTotalPrice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: CartManager.cartItems.length,
              itemBuilder: (context, index) {
                return CartItemWidget(
                  index: index,
                  onPriceChange:
                      updateTotalPrice, // Update total price on change
                );
              },
            ),
          ),
          TotalPriceWidget(), // Display total price
          CheckoutButtonWidget(),
        ],
      ),
      bottomNavigationBar: AppBottomNavigationBar(selectedIndex: 1),
    );
  }
}
