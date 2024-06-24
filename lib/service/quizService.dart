import 'package:flutter_application_1/model/quiz.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuizService {
  // Fetches all questions from the server
  Future<List<Quiz>> findAll() async {
    print('Starting fetch...');
    var uri = Uri.parse("http://192.168.2.34:5284/api/Quiz/GetAll");
    try {
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        print('Response body: ${response.body}'); 
        var jsonAll = jsonDecode(response.body) as List<dynamic>;
        var quizs = List.generate(
            jsonAll.length, (index) => Quiz.fromJson(jsonAll[index]));
        print('List of questions: $quizs');
        return quizs;
      } else {
        print('Server error: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error occurred during fetching all quizs: $e');
      return [];
    }
  }

  Future<Quiz?> create(Quiz quizs) async {
    var uri = Uri.parse("http://192.168.2.34:5284/api/Quiz/Create");

    try {
      var response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(quizs.toJson()),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        return Quiz.fromJson(jsonResponse);
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return null;
      }
    } catch (e) {
      print('Error creating question: $e');
      return null;
    }
  }
}
