import 'package:flutter/material.dart';
import 'package:project/screens/home_screen.dart';
import 'package:project/screens/mycart_screen.dart';
import 'package:project/screens/profile_screen.dart';
import 'package:project/screens/whishlist_screen.dart';
import 'package:project/wigits/color.dart';

class AppBottomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  const AppBottomNavigationBar({required this.selectedIndex});

  @override
  _AppBottomNavigationBarState createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyHome()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyCartScreen()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => WishlistScreen()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: 10.0), // Adding some padding
        child: BottomNavigationBar(
          currentIndex: widget.selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: Colors
              .transparent, // Set background transparent to apply container's decoration
          selectedItemColor: myColor.mybrown, // Active item color
          unselectedItemColor: Colors.grey, // Inactive item color
          type: BottomNavigationBarType.fixed, // Fixed for a stable layout
          elevation: 0, // Remove the BottomNavigationBar's own shadow
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'My Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'WishList',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
