import 'package:flutter/material.dart';

class ViewResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Results'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: 10, // Fake data count
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Result ${index + 1}'),
            subtitle: Text('Details for Result ${index + 1}'),
            trailing: Icon(Icons.bar_chart),
            onTap: () {
              // Handle view action
            },
          );
        },
      ),
    );
  }
}
