import 'package:dio/dio.dart';
import 'package:flutter_application_1/model/question.dart';

class QuestionService {
  final String baseUrl = "http://192.168.2.34:5284/api/Question/GetAll";
  final Dio _dio = Dio();

  Future<List<Question>> getAllQuestions() async {
    try {
      final response = await _dio.get(baseUrl);
      print('QuestionService response: ${response.data}'); // Log response
      if (response.statusCode == 200) {
        List<Question> questions = (response.data as List)
            .map((question) => Question.fromJson(question))
            .toList();
        return questions;
      } else {
        throw Exception('Failed to load questions');
      }
    } catch (e) {
      print('Error in QuestionService: $e'); // Log error
      throw Exception('Failed to load questions');
    }
  }
}
