import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool pushNotifications = true;
  bool promotionalNotifications = false;

  String userName = "Nadun Nimanshana";
  String userEmail = "nadunnimansha067@gmail.com";
  String userPhone = "+94 123 456 789"; // Added phone number

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              userName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              userEmail,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            Text(
              userPhone, // Displaying phone number
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            SizedBox(height: 20),

            // My Account Section
            _buildSection("My Account", [
              _buildListTile(Icons.person, "Personal information", onTap: () {
                // Navigate to the EditPersonalInfoPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditPersonalInfoPage(
                      currentName: userName,
                      currentEmail: userEmail,
                      currentPhone: userPhone, // Passing phone number
                    ),
                  ),
                ).then((updatedInfo) {
                  // If data is updated, update the profile
                  if (updatedInfo != null) {
                    setState(() {
                      userName = updatedInfo['name'];
                      userEmail = updatedInfo['email'];
                      userPhone = updatedInfo['phone']; // Update phone number
                    });
                  }
                });
              }),
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
  Widget _buildListTile(IconData icon, String title, {Widget? trailing, Color iconColor = Colors.black87, Color textColor = Colors.black87, Function()? onTap}) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(title, style: TextStyle(color: textColor, fontSize: 14)),
      trailing: trailing ?? Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
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

// Edit Personal Information Page
class EditPersonalInfoPage extends StatefulWidget {
  final String currentName;
  final String currentEmail;
  final String currentPhone;

  EditPersonalInfoPage({required this.currentName, required this.currentEmail, required this.currentPhone});

  @override
  _EditPersonalInfoPageState createState() => _EditPersonalInfoPageState();
}

class _EditPersonalInfoPageState extends State<EditPersonalInfoPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController(); // Phone number controller

  @override
  void initState() {
    super.initState();
    // Set initial values for name, email, and phone number
    _nameController.text = widget.currentName;
    _emailController.text = widget.currentEmail;
    _phoneController.text = widget.currentPhone; // Set phone number
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Personal Information")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name", style: TextStyle(fontSize: 16)),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(hintText: "Enter your name"),
            ),
            SizedBox(height: 16),
            Text("Email", style: TextStyle(fontSize: 16)),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(hintText: "Enter your email"),
            ),
            SizedBox(height: 16),
            Text("Phone", style: TextStyle(fontSize: 16)), // Phone number field
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(hintText: "Enter your phone number"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // When save is pressed, send back the updated info to AccountPage
                Map<String, String> updatedInfo = {
                  'name': _nameController.text,
                  'email': _emailController.text,
                  'phone': _phoneController.text, // Include phone number
                };

                // Return the updated info to AccountPage
                Navigator.pop(context, updatedInfo);
              },
              child: Text("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }
}
