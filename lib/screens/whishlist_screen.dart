import 'package:flutter/material.dart';
import 'package:project/screens/main_screen.dart';
import 'package:project/wigits/product_list.dart';

class WishlistScreen extends StatefulWidget {
  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    // Filter only wishlisted products
    List<Map> wishlistProducts = ProductList.MyList.where((product) {
      return product['isWishlisted'] == true;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Wishlist',
          style: TextStyle(fontSize: 15),
        ),
        backgroundColor:
            Colors.transparent, // Removed the AppBar background color
        elevation: 0, // Optional: remove shadow
      ),
      body: _buildWishlistGrid(wishlistProducts),
      bottomNavigationBar: AppBottomNavigationBar(selectedIndex: 2),
    );
  }

  // Build the wishlist grid
  Widget _buildWishlistGrid(List<Map> products) {
    if (products.isEmpty) {
      return Center(
        child: Text('No products in the wishlist'),
      );
    }

    return GridView.builder(
      padding: EdgeInsets.all(8),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75, // Adjust ratio for proper height management
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return _buildProductCard(products[index]);
      },
    );
  }

  // Build each product card for wishlist items
  Widget _buildProductCard(Map product) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                product['image'],
                height: 130, // Adjusted height for proper scaling
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['name'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),
                  Text(
                    '\$${product['originalPrice']}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    '\$${product['discountedPrice']}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '${product['discountPercentage']}% OFF',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
