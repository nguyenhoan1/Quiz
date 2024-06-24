import 'package:flutter/material.dart';

class ViewFeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Feedback'),
        backgroundColor: Colors.indigo,
      ),
      body: ListView.builder(
        itemCount: 10, // Fake data count
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Feedback ${index + 1}'),
            subtitle: Text('Details for Feedback ${index + 1}'),
            trailing: Icon(Icons.feedback),
            onTap: () {
              // Handle view action
            },
          );
        },
      ),
    );
  }
}
