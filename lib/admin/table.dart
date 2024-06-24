import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/getall_table.dart';
import 'package:flutter_application_1/service/quizez_service.dart';

class TablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Table Page'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Table',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Quiz',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Tìm kiếm...',
                      prefixIcon: Icon(Icons.search, color: Colors.black54),
                      hintStyle: TextStyle(color: Colors.black54),
                      filled: true,
                      fillColor: Colors.grey[300],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(color: Colors.black),
                    onChanged: (value) {
                      context.findAncestorStateOfType<_TableWidgetState>()?._filterItems(value);
                    },
                  ),
                ),
                SizedBox(width: 16),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CreateItemPage()),
                      );
                    },
                    child: Text(
                      'Add',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: TableWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

class TableWidget extends StatefulWidget {
  @override
  _TableWidgetState createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  late Future<List<Quizez>> _quizzesFuture;
  List<Quizez> _quizzes = [];
  List<Quizez> _filteredQuizzes = [];

  @override
  void initState() {
    super.initState();
    _quizzesFuture = fetchQuizzes();
    _quizzesFuture.then((quizzes) {
      setState(() {
        _quizzes = quizzes;
        _filteredQuizzes = quizzes;
      });
    });
  }

  void _filterItems(String searchText) {
    setState(() {
      if (searchText.isEmpty) {
        _filteredQuizzes = _quizzes;
      } else {
        _filteredQuizzes = _quizzes
            .where((quiz) =>
                quiz.title.toLowerCase().contains(searchText.toLowerCase()) ||
                quiz.id.toLowerCase().contains(searchText.toLowerCase()) ||
                quiz.description.toLowerCase().contains(searchText.toLowerCase()))
            .toList();
      }
    });
  }

  void _updateItem(int index) {
    // Implement your update logic here
    print('Update item at index $index');
  }

  void _deleteItem(int index) {
    setState(() {
      _filteredQuizzes.removeAt(index);
    });
    print('Delete item at index $index');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Quizez>>(
      future: _quizzesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return ListView(
            children: _filteredQuizzes.map((quiz) {
              return Card(
                child: ListTile(
                  leading: Text(
                    quiz.id,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text(quiz.title, style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(quiz.description),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {
                          _updateItem(_filteredQuizzes.indexOf(quiz));
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          _deleteItem(_filteredQuizzes.indexOf(quiz));
                        },
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        }
      },
    );
  }
}

class CreateItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Item Page'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text('Create Item Page Content'),
      ),
    );
  }
}
