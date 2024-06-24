import 'package:flutter/material.dart';
import 'sideBar.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
      ),
      drawer: SideBar(),
      body: Center(
        child: Text('Welcome to the Admin Page'),
      ),
    );
  }
}
