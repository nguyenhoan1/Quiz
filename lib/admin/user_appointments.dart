import 'package:flutter/material.dart';

class UserAppointmentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Appointments'),
        backgroundColor: Colors.brown,
      ),
      body: ListView.builder(
        itemCount: 10, // Fake data count
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Appointment ${index + 1}'),
            subtitle: Text('Details for Appointment ${index + 1}'),
            trailing: Icon(Icons.calendar_today),
            onTap: () {
              // Handle view action
            },
          );
        },
      ),
    );
  }
}
