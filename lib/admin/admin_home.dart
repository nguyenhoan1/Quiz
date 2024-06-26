import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/manage_user.dart';
import 'package:flutter_application_1/component/admin_tabs_page.dart';
import 'view_results.dart';
import 'view_feedback.dart';
import 'user_appointments.dart';
class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Admin Page',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Psychological Tests',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.orangeAccent,
                  ),
            ),
            SizedBox(height: 8),
            Text(
              'Manage all the psychological tests, questions, answers, and feedback on the platform.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 16,
                  ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildCard(context, 'Manage Tests', Icons.library_books, Colors.blue, AdminTabsPage()),
                  _buildCard(context, 'View Results', Icons.bar_chart, Colors.green, ViewResultsPage()),
                  _buildCard(context, 'View Feedback', Icons.feedback, Colors.indigo, ViewFeedbackPage()),
                  _buildCard(context, 'User Appointments', Icons.calendar_today, Colors.brown, UserAppointmentsPage()),
                  _buildCard(context, 'Manage Users', Icons.people, Colors.purple, ManageUsersPage()), // Add Manage Users card
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, IconData icon, Color color, Widget page) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    elevation: 6,
    shadowColor: color.withOpacity(0.5),
    child: InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: color,
              child: Icon(icon, size: 40, color: Colors.white),
              radius: 30,
            ),
            SizedBox(height: 10),
            Flexible(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}
