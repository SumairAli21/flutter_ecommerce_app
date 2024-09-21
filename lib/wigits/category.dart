import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/wigits/color.dart';

class Mycategory extends StatelessWidget {
  const Mycategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Category',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildCategoryIcon(FontAwesomeIcons.tshirt, 'T-Shirt'),
            _buildCategoryIcon(FontAwesomeIcons.userTie, 'Pant'),
            _buildCategoryIcon(FontAwesomeIcons.female, 'Dress'),
            _buildCategoryIcon(FontAwesomeIcons.tshirt, 'Jacket'),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryIcon(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 25, color: myColor.mybrown),
        SizedBox(height: 5),
        Text(label),
      ],
    );
  }
}
