import 'package:dio/dio.dart';
import 'package:flutter_application_1/model/answer.dart';
import 'package:flutter_application_1/model/question.dart';

class QuestionService {
  final String baseUrl = "http://192.168.2.34:5284/api/Question/GetAll";
  final Dio _dio = Dio();

  Future<List<Question>> getAllQuestions() async {
    try {
      final response = await _dio.get(baseUrl);
      if (response.statusCode == 200) {
        List<Question> questions = (response.data as List)
            .map((question) => Question.fromJson(question))
            .toList();
        return questions;
      } else {
        throw Exception('Failed to load questions');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load questions');
    }
  }
}

class AnswerService {
  final String baseUrl = "http://192.168.2.34:5284/api/Answer/GetAll";
  final Dio _dio = Dio();

  Future<List<Answer>> getAllAnswers() async {
    try {
      final response = await _dio.get(baseUrl);
      if (response.statusCode == 200) {
        List<Answer> answers = (response.data as List)
            .map((answer) => Answer.fromJson(answer))
            .toList();
        return answers;
      } else {
        throw Exception('Failed to load answers');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load answers');
    }
  }
}