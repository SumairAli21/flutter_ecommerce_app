import 'package:flutter/material.dart';
import 'package:project/wigits/color.dart';
import 'package:project/wigits/product_list.dart'; // Assuming this contains your product list
import 'package:project/screens/product_detail.dart';

class CategoryProductScreen extends StatelessWidget {
  final String selectedCategory;

  CategoryProductScreen({required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    // Filter products by the selected category
    List<Map> filteredProducts = ProductList.MyList.where((product) {
      if (selectedCategory == 'All')
        return true; // Show all products if 'All' is selected
      return product['category'] == selectedCategory; // Filter by category
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('$selectedCategory Products'),
        backgroundColor: myColor.mybrown,
      ),
      body: _buildProductGrid(filteredProducts, context),
    );
  }

  // Build the vertical grid product list (2 items per row)
  Widget _buildProductGrid(List<Map> products, BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: products.length, // Ensure all products are displayed
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of products per row
        childAspectRatio: 0.7, // Adjust this to change card size
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Navigate to ProductDetailScreen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailScreen(
                  products: products[index], // Passing the clicked product
                ),
              ),
            );
          },
          child: _buildProductCard(products[index]),
        );
      },
    );
  }

  // Build each product card
  Widget _buildProductCard(Map product) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                product['image'],
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['name'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
