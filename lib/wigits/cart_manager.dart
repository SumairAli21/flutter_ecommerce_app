import 'package:project/wigits/cart_item.dart';

class CartManager {
  static List<CartItem> cartItems = [];

  // Add item to the cart
  static void addItem(CartItem newItem) {
    // Check if item is already in the cart by matching name or some unique ID
    int index = cartItems.indexWhere((item) => item.name == newItem.name);

    if (index != -1) {
      // If item exists, increase the quantity
      cartItems[index].quantity++;
    } else {
      // Add the new item if it does not exist
      cartItems.add(newItem);
    }
  }

  // Remove item from the cart by index
  static void removeItem(int index) {
    cartItems.removeAt(index);
  }

  // Remove item by name (alternative to using index)
  static void removeItemByName(String name) {
    cartItems.removeWhere((item) => item.name == name);
  }

  // Increase item quantity by index
  static void increaseQuantity(int index) {
    cartItems[index].quantity++;
  }

  // Decrease item quantity by index, ensuring it doesn’t go below 1
  static void decreaseQuantity(int index) {
    if (cartItems[index].quantity > 1) {
      cartItems[index].quantity--;
    }
  }

  // Calculate the total price for all items in the cart
  static double getTotalPrice() {
    double totalPrice = 0;
    for (var item in cartItems) {
      totalPrice += item.discountedPrice * item.quantity;
    }
    return totalPrice;
  }

  // Get the count of all items in the cart
  static int getTotalItemCount() {
    return cartItems.fold(0, (sum, item) => sum + item.quantity);
  }
}
