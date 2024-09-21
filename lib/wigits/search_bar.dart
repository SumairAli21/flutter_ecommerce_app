import 'package:flutter/material.dart';
import 'package:project/wigits/color.dart';

class Mysearchbar extends StatelessWidget {
  const Mysearchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                border: InputBorder.none,
              ),
            ),
          ),
          Icon(Icons.filter_alt_outlined, color: myColor.mybrown),
        ],
      ),
    );
  }
}
