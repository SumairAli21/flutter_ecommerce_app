import 'package:flutter/material.dart';
import 'package:project/screens/category_product_screen.dart';
import 'package:project/wigits/color.dart'; // Screen to show filtered products

class MyCategoryWidget extends StatelessWidget {
  final List<String> categories = ['All', 'Jacket', 'Shirt', 'Pant', 'T-Shirt'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: categories.map((category) {
            return GestureDetector(
              onTap: () {
                // Navigate to the category screen and pass the selected category
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryProductScreen(
                      selectedCategory: category,
                    ),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: myColor.mybrown,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  category,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
