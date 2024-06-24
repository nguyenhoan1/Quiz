import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/provider/test_provider.dart';
import 'package:flutter_application_1/model/test.dart';

class ManageQuestionsPage extends StatefulWidget {
  @override
  _ManageQuestionsPageState createState() => _ManageQuestionsPageState();
}

class _ManageQuestionsPageState extends State<ManageQuestionsPage> {
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();
  final int testId = 0; // Assuming you are managing questions for test with id 0
  bool _isAddingQuestion = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Questions'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          if (_isAddingQuestion)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _questionController,
                    decoration: InputDecoration(labelText: 'Question'),
                  ),
                  TextField(
                    controller: _detailsController,
                    decoration: InputDecoration(labelText: 'Details'),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _addQuestion(context);
                        },
                        child: Text('Save Question'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isAddingQuestion = false;
                          });
                        },
                        child: Text('Cancel'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          Expanded(
            child: Consumer<TestProvider>(
              builder: (context, testProvider, child) {
                final test = testProvider.tests.firstWhere((t) => t.id == testId);
                return ListView.builder(
                  itemCount: test.questions.length,
                  itemBuilder: (context, index) {
                    final question = test.questions[index];
                    return ListTile(
                      title: Text(question.question),
                      subtitle: Text('Details for ${question.question}'),
                      trailing: Icon(Icons.edit),
                      onTap: () {
                        // Handle edit action
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isAddingQuestion = true;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _addQuestion(BuildContext context) {
    final questionText = _questionController.text;
    final detailsText = _detailsController.text;

    if (questionText.isNotEmpty && detailsText.isNotEmpty) {
      final newQuestion = Question(
        id: DateTime.now().millisecondsSinceEpoch, // Unique ID based on timestamp
        question: questionText,
        answers: [], // Add answers as needed
      );

      Provider.of<TestProvider>(context, listen: false).addQuestion(testId, newQuestion);

      _questionController.clear();
      _detailsController.clear();

      setState(() {
        _isAddingQuestion = false;
      });
    }
  }
}
