import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/answer.dart';
import 'package:flutter_application_1/provider/quiz_provider.dart';
import 'package:provider/provider.dart';

class ManageQnAPage extends StatefulWidget {
  @override
  _ManageQnAPageState createState() => _ManageQnAPageState();
}

class _ManageQnAPageState extends State<ManageQnAPage> {
  Map<int, String> selectedAnswers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Q&A'),
        backgroundColor: Colors.cyan,
      ),
      body: Consumer<QuizProvider>(
        builder: (context, quizProvider, child) {
          if (quizProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (quizProvider.questions.isEmpty || quizProvider.answers.isEmpty) {
            return Center(child: Text('No Q&A found.'));
          }
          return ListView.builder(
            itemCount: quizProvider.questions.length,
            itemBuilder: (context, index) {
              final question = quizProvider.questions[index];
              final answer = quizProvider.answers.firstWhere(
                (answer) => answer.questionId == question.id,
                orElse: () {
                  print('No answer found for question ID: ${question.id}'); // Log missing answer
                  return Answer(id: 0, questionId: question.id, content: 'No answer found');
                },
              );

              List<String> options = answer.content.split('\n');

              return Card(
                margin: EdgeInsets.all(10.0),
                child: ExpansionTile(
                  title: Text(
                    question.content,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: options.map((option) {
                          return RadioListTile<String>(
                            title: Text(option, style: TextStyle(color: Colors.black54)),
                            value: option,
                            groupValue: selectedAnswers[question.id],
                            onChanged: (value) {
                              setState(() {
                                selectedAnswers[question.id] = value!;
                              });
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
