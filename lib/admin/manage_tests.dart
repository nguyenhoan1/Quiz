import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/quiz_provider.dart';
import 'package:provider/provider.dart';

class ManageTestsPage extends StatefulWidget {
  @override
  _ManageTestsPageState createState() => _ManageTestsPageState();
}

class _ManageTestsPageState extends State<ManageTestsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<QuizProvider>(context, listen: false).fetchQuizzes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Tests'),
        backgroundColor: Colors.cyan,
      ),
      body: Consumer<QuizProvider>(
        builder: (context, quizProvider, child) {
          if (quizProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (quizProvider.quizzes.isEmpty) {
            return Center(child: Text('No tests found.'));
          }
          return ListView.builder(
            itemCount: quizProvider.quizzes.length,
            itemBuilder: (context, index) {
              final quiz = quizProvider.quizzes[index];
              return Card(
                margin: EdgeInsets.all(10.0),
                child: ExpansionTile(
                  title: Text(
                    quiz.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  children: quiz.questions.map((question) {
                    return ExpansionTile(
                      title: Text(
                        question.content,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      children: question.answers.map((answer) {
                        return ListTile(
                          title: Text('Answer: ${answer.content}'),
                        );
                      }).toList(),
                    );
                  }).toList(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
