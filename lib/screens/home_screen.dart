import 'package:flutter/material.dart';
import 'package:project/screens/main_screen.dart';
import 'package:project/wigits/category.dart';
import 'package:project/wigits/image_slider.dart';
import 'package:project/wigits/my_category.dart';
import 'package:project/wigits/products_cards.dart';
import 'package:project/wigits/search_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Mysearchbar(),
            SizedBox(
              height: 30,
            ),
            Myimageslider(),
            SizedBox(
              height: 10,
            ),
            Mycategory(),
            SizedBox(
              height: 5,
            ),
            MyCategoryWidget(),
            SizedBox(
              height: 5,
            ),
            Myproduct_card(),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(selectedIndex: 0),
    );
  }
}
