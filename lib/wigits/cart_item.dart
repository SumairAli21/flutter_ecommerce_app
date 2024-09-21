class CartItem {
  final String name;
  final double originalPrice; // The original price of the item
  final double discountedPrice;
  final String image;
  int quantity;

  CartItem({
    required this.name,
    required this.originalPrice, // Store the original price
    required this.discountedPrice,
    required this.image,
    this.quantity = 0,
  });

  // Method to calculate total price based on quantity
  double getTotalPrice() {
    return discountedPrice * quantity;
  }
}
