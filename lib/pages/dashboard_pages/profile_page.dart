import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool pushNotifications = true;
  bool promotionalNotifications = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Account"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Section
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person, size: 50, color: Colors.grey[700]),
            ),
            SizedBox(height: 10),
            Text(
              "Nadun Nimanshana",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "nadunnimansha067@gmail.com",
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            SizedBox(height: 20),

            // My Account Section
            _buildSection("My Account", [
              _buildListTile(Icons.person, "Personal information"),
              _buildListTile(Icons.language, "Language", trailing: Text("English (US)")),
              _buildListTile(Icons.privacy_tip, "Privacy Policy"),
              _buildListTile(Icons.settings, "Setting"),
            ]),

            // Notifications Section
            _buildSection("Notifications", [
              _buildSwitchTile("Push Notifications", pushNotifications, (value) {
                setState(() {
                  pushNotifications = value;
                });
              }),
              _buildSwitchTile("Promotional Notifications", promotionalNotifications, (value) {
                setState(() {
                  promotionalNotifications = value;
                });
              }),
            ]),

            // More Section
            _buildSection("More", [
              _buildListTile(Icons.help, "Help Center"),
              _buildListTile(Icons.logout, "Log Out", iconColor: Colors.red, textColor: Colors.red),
            ]),
          ],
        ),
      ),
    );
  }

  // Method to Build a Section with a Title
  Widget _buildSection(String title, List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(children: children),
          ),
        ],
      ),
    );
  }

  // Method to Build a ListTile Item
  Widget _buildListTile(IconData icon, String title, {Widget? trailing, Color iconColor = Colors.black87, Color textColor = Colors.black87}) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(title, style: TextStyle(color: textColor, fontSize: 14)),
      trailing: trailing ?? Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {
        // Handle navigation or action
      },
    );
  }

  // Method to Build a Switch Tile
  Widget _buildSwitchTile(String title, bool value, Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(title, style: TextStyle(fontSize: 14)),
      value: value,
      onChanged: onChanged,
      activeColor: Colors.green,
    );
  }
}
