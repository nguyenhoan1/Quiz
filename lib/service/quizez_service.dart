import 'dart:convert';
import 'package:flutter_application_1/model/getall_table.dart';
import 'package:http/http.dart' as http;

Future<List<Quizez>> fetchQuizzes() async {
  final response = await http.get(Uri.parse('https://mocki.io/v1/f6851262-f94b-4bd1-af57-8f2bd0ed737f'));

  if (response.statusCode == 200) {
    List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((json) => Quizez.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load quizzes');
  }
}
