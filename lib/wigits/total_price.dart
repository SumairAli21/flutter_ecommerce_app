import 'package:flutter/material.dart';
import 'package:project/wigits/cart_manager.dart';

class TotalPriceWidget extends StatefulWidget {
  // We keep this stateful to manage internal state for total price
  const TotalPriceWidget({Key? key}) : super(key: key);

  @override
  _TotalPriceWidgetState createState() => _TotalPriceWidgetState();
}

class _TotalPriceWidgetState extends State<TotalPriceWidget> {
  double totalPrice = 0.0;

  @override
  void initState() {
    super.initState();
    _updateTotalPrice();
  }

  void _updateTotalPrice() {
    setState(() {
      totalPrice = CartManager.getTotalPrice(); // Calculate total price
    });
  }

  // Expose the method to trigger price update externally
  void updatePriceExternally() {
    _updateTotalPrice();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'Total: \$${totalPrice.toStringAsFixed(2)}',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
