import 'package:flutter/material.dart';
import 'package:project/wigits/product_list.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Myimageslider extends StatelessWidget {
  final List imagelist = ProductList.imglist;
  Myimageslider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 180,
        autoPlay: true,
        enlargeCenterPage: true,
        autoPlayInterval: Duration(seconds: 3),
        viewportFraction: 0.8,
      ),
      // imagelist ko map karke slider create karna
      items: imagelist.map((imageUrl) {
        return Builder(
          builder: (BuildContext context) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
