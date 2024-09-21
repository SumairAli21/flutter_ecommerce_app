import 'package:flutter/material.dart';
import 'package:project/screens/mycart_screen.dart';
import 'package:project/wigits/cart_item.dart';
import 'package:project/wigits/cart_manager.dart';
import 'package:project/wigits/color.dart';
// To manage cart state

class ProductDetailScreen extends StatelessWidget {
  final Map products;

  ProductDetailScreen(
      {required this.products}); // Constructor to pass product details

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(products['name']), // Display product name in AppBar
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border), // Wishlist icon
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product image
              Image.asset(
                products['image'],
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),

              // Product name and price section
              Text(
                products['name'],
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                '\$${products['discountedPrice']}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                '${products['discountPercentage']}% OFF',
                style: TextStyle(color: Colors.green, fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Original Price: \$${products['originalPrice']}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              SizedBox(height: 20),

              // Size selection section
              Text(
                'Select Size',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: ['S', 'M', 'L', 'XL', 'XXL'].map((size) {
                  return _buildSizeOption(size);
                }).toList(),
              ),
              SizedBox(height: 20),

              // Color selection section
              Text(
                'Select Color',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildColorOption(myColor.mybrown),
                  _buildColorOption(Colors.black),
                  _buildColorOption(Colors.grey),
                  _buildColorOption(Colors.blueGrey),
                ],
              ),
              SizedBox(height: 30),

              // Product details section
              Text(
                'Product Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'This is a detailed description of the product, which explains the features and quality in depth. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 30),

              // Add to cart button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Price',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      Text(
                        '\$${products['discountedPrice']}',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      backgroundColor: Colors.brown, // Button color
                    ),
                    onPressed: () {
                      // Add the product to the cart using CartManager
                      CartItem cartItem = CartItem(
                        name: products['name'],
                        discountedPrice:
                            (products['discountedPrice'] as num).toDouble(),

                        image: products['image'],
                        originalPrice:
                            (products['originalPrice'] as num).toDouble(),

                        quantity: 1, // Initial quantity
                      );

                      CartManager.addItem(cartItem); // Add item to the cart

                      // Navigate to the My Cart Screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyCartScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Add to Cart',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget for size options
  Widget _buildSizeOption(String size) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey),
      ),
      child: Text(
        size,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  // Helper widget for color options
  Widget _buildColorOption(Color color) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
