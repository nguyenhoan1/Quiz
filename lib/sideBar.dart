import 'package:flutter/material.dart';
import 'userProfile.dart';
import 'loginPage.dart';
import 'table.dart';

class SideBar extends StatelessWidget {
  void _navigateToProfile(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePage()));
  }

  void _navigateToTable(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => TablePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: GestureDetector(
              onTap: () => _navigateToProfile(context),
              child: Text("User Name"),
            ),
            accountEmail: Text("user@example.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://example.com/user_image.png"), // Replace with actual image URL
            ),
          ),
          ListTile(
            title: Text('Table'),
            onTap: () {
              _navigateToTable(context);
            },
          ),
          ExpansionTile(
            title: Text('Chức Năng'),
            children: <Widget>[
              ListTile(
                title: Text('Nạp xu'),
                onTap: () {
                  // Handle nap xu action
                },
              ),
              ListTile(
                title: Text('Giftcode'),
                onTap: () {
                  // Handle giftcode action
                },
              ),
            ],
          ),
          Divider(), // Optional: Adds a divider between menu items and the logout button
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Đăng Xuất'),
            onTap: () {
              // Handle logout action
              // For example, you can navigate to the login screen
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
