import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Admin Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // Navigate to Home
            },
          ),
          ListTile(
            leading: Icon(Icons.library_books),
            title: Text('Manage Tests'),
            onTap: () {
              // Navigate to Manage Tests
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Users'),
            onTap: () {
              // Navigate to Users
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Navigate to Settings
            },
          ),
          
        ],
      ),
    );
  }
}
