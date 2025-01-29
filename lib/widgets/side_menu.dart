import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // User Profile Section
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.green),
            accountName: Text(
              "Nadun Nimanshana",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            accountEmail: Text("nadunnimansha067@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/images.jpeg'),
            ),
          ),

          // Navigation Items
          Expanded(
            child: ListView(
              children: [
                
                _buildDrawerItem(Icons.home, "Home", () {
                  Navigator.pushNamed(context, "/home");

                }),
                _buildDrawerItem(Icons.shopping_cart, "Orders", () {
                  Navigator.pushNamed(context, "/orders");
                }),
                _buildDrawerItem(Icons.favorite, "Favorites", () {
                  Navigator.pushNamed(context, "/favorites");
                }),
                _buildDrawerItem(Icons.person, "Profile", () {
                  Navigator.pushNamed(context, "/profile");
                }),
                _buildDrawerItem(Icons.settings, "Settings", () {
                  Navigator.pushNamed(context, "/settings");
                }),
                Divider(),
                _buildDrawerItem(Icons.help_outline, "Help Center", () {
                  Navigator.pushNamed(context, "/help");
                }),
                _buildDrawerItem(Icons.info_outline, "About Us", () {
                  Navigator.pushNamed(context, "/about");
                }),
                Divider(),

                // Dark Mode Toggle
                ListTile(
                  leading: Icon(Icons.dark_mode, color: Colors.black),
                  title: Text("Dark Mode"),
                  trailing: Switch(
                    value: false, // Replace with state variable
                    onChanged: (value) {
                      // Handle Dark Mode Toggle
                    },
                  ),
                ),
              ],
            ),
          ),

          // Logout Button
          Padding(
            padding: EdgeInsets.all(16),
            child: ElevatedButton.icon(
              onPressed: () {
                // Handle Logout
                Navigator.pushReplacementNamed(context, "/login");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: Size(double.infinity, 50),
              ),
              icon: Icon(Icons.logout, color: Colors.white),
              label: Text("Log Out", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  // Helper Function for Drawer Items
  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: TextStyle(fontSize: 16)),
      onTap: onTap,
    );
  }
}
