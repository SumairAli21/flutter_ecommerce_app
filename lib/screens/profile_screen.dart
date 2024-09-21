import 'package:flutter/material.dart';
import 'package:project/screens/login.dart';
import 'package:project/screens/main_screen.dart';
import 'package:project/wigits/color.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Image and Name
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage('assets/images/me.jpg'), // Update with your asset
            ),
            SizedBox(height: 16),
            Text(
              'Sumair Ali',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // Edit Profile button (if needed)
            TextButton.icon(
              onPressed: () {
                // Handle edit action
              },
              icon: Icon(Icons.edit, color: myColor.mybrown),
              label: Text('Edit Profile',
                  style: TextStyle(color: myColor.mybrown)),
            ),
            SizedBox(height: 16),
            // Profile options list
            Expanded(
              child: ListView(
                children: [
                  _buildProfileOption(
                      icon: Icons.person, text: 'Your profile', onTap: () {}),
                  _buildProfileOption(
                      icon: Icons.credit_card,
                      text: 'Payment Methods',
                      onTap: () {}),
                  _buildProfileOption(
                      icon: Icons.shopping_bag,
                      text: 'My Orders',
                      onTap: () {}),
                  _buildProfileOption(
                      icon: Icons.settings, text: 'Settings', onTap: () {}),
                  _buildProfileOption(
                      icon: Icons.help, text: 'Help Center', onTap: () {}),
                  _buildProfileOption(
                      icon: Icons.policy, text: 'Privacy Policy', onTap: () {}),
                  _buildProfileOption(
                      icon: Icons.person_add,
                      text: 'Invite Friends',
                      onTap: () {}),
                  _buildProfileOption(
                      icon: Icons.logout,
                      text: 'Log out',
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(selectedIndex: 3),
    );
  }

  // Build each profile option with an icon and a label
  Widget _buildProfileOption(
      {required IconData icon,
      required String text,
      required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: myColor.mybrown),
      title: Text(text),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}
