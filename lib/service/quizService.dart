import 'package:dio/dio.dart';
import 'package:flutter_application_1/model/quiz.dart';

class QuizService {
  final String baseUrl = "http://192.168.2.34:5284/api/Quiz/GetAll";
  final Dio _dio = Dio();

  Future<List<Quiz>> getAllQuizzes() async {
    try {
      final response = await _dio.get(baseUrl);
      print('Response data: ${response.data}'); // In ra phản hồi từ API
      if (response.statusCode == 200) {
        List<Quiz> quizzes = (response.data as List)
            .map((quiz) => Quiz.fromJson(quiz))
            .toList();
        return quizzes;
      } else {
        throw Exception('Failed to load quizzes');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load quizzes');
    }
  }
}
