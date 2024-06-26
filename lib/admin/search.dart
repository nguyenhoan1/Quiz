import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/quiz.dart';
import 'package:flutter_application_1/provider/quiz_provider.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<Quiz> _searchResults = [];

  void _searchQuizzes(String query) {
    final provider = Provider.of<QuizProvider>(context, listen: false);
    final results = provider.quizzes.where((quiz) {
      final quizNameLower = quiz.name.toLowerCase();
      final queryLower = query.toLowerCase();
      return quizNameLower.contains(queryLower);
    }).toList();

    setState(() {
      _searchResults = results;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Tests'),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    _searchQuizzes(_searchController.text);
                  },
                ),
              ),
              onChanged: (query) {
                _searchQuizzes(query);
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  final quiz = _searchResults[index];
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
