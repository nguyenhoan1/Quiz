import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/component/bulletlist.dart';
import 'package:flutter_application_1/model/test.dart';
import 'package:flutter_application_1/provider/test_provider.dart';

class ManageTestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Tests'),
        backgroundColor: Colors.blue,
      ),
      body: Consumer<TestProvider>(
        builder: (context, testProvider, child) {
          if (testProvider.tests.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            primary: false, // Disable primary scroll controller
            itemCount: testProvider.tests.length,
            itemBuilder: (context, index) {
              final test = testProvider.tests[index];
              return ExpansionTile(
                title: Text(test.title),
                subtitle: Text(test.description),
                children: _buildQuestions(test.questions),
              );
            },
          );
        },
      ),
    );
  }

  List<Widget> _buildQuestions(List<Question> questions) {
    return questions.map((q) {
      return ListTile(
        title: Text(q.question),
        subtitle: BulletList(items: q.answers.map((a) => a.text).toList()),
        trailing: Icon(Icons.edit),
        onTap: () {
          // Handle edit action
        },
      );
    }).toList();
  }
}
