import 'package:flutter/material.dart';

class ManageAnswersPage extends StatefulWidget {
  @override
  _ManageAnswersPageState createState() => _ManageAnswersPageState();
}

class _ManageAnswersPageState extends State<ManageAnswersPage> {
  final TextEditingController _answerController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();
  bool _isAddingAnswer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Answers'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          if (_isAddingAnswer)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _answerController,
                    decoration: InputDecoration(labelText: 'Answer'),
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
                          _addAnswer();
                        },
                        child: Text('Save Answer'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isAddingAnswer = false;
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
            child: ListView.builder(
              primary: false, // Disable primary scroll controller
              itemCount: 10, // Fake data count
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Answer ${index + 1}'),
                  subtitle: Text('Details for Answer ${index + 1}'),
                  trailing: Icon(Icons.edit),
                  onTap: () {
                    // Handle edit action
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
            _isAddingAnswer = true;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _addAnswer() {
    final answerText = _answerController.text;
    final detailsText = _detailsController.text;

    if (answerText.isNotEmpty && detailsText.isNotEmpty) {
      // Add the new answer to your data source
      // Example: Provider.of<YourProvider>(context, listen: false).addAnswer(answer);

      _answerController.clear();
      _detailsController.clear();

      setState(() {
        _isAddingAnswer = false;
      });
    }
  }
}
