import 'package:flutter/material.dart';
import 'package:project/wigits/color.dart';
import 'cart_manager.dart';

class CartItemWidget extends StatelessWidget {
  final int index;
  final VoidCallback onPriceChange; // Callback to notify TotalPriceWidget

  const CartItemWidget({required this.index, required this.onPriceChange});

  @override
  Widget build(BuildContext context) {
    var item = CartManager.cartItems[index];

    return Dismissible(
      key: Key(item.name),
      direction: DismissDirection.endToStart,
      background: Container(
        color: myColor.mybrown,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Icon(Icons.delete, color: Colors.white),
      ),
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Remove from Cart?"),
              content: Text("Are you sure you want to remove ${item.name}?"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text("Cancel"),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text("Yes, Remove"),
                ),
              ],
            );
          },
        );
      },
      onDismissed: (direction) {
        CartManager.removeItem(index);
        onPriceChange(); // Notify price change
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${item.name} removed from cart")),
        );
      },
      child: ListTile(
        leading: Image.asset(
          item.image, // Ensure 'image' is a valid path in the CartItem class
          width: 50,
          height: 50,
          fit: BoxFit.cover, // Adjust the image fit as needed
        ),
        title: Text(item.name),
        subtitle: Text('Price: \$${item.discountedPrice.toStringAsFixed(2)}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                CartManager.decreaseQuantity(index);
                onPriceChange(); // Notify total price update
              },
            ),
            Text('${item.quantity}'),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                CartManager.increaseQuantity(index);
                onPriceChange(); // Notify total price update
              },
            ),
          ],
        ),
      ),
    );
  }
}
