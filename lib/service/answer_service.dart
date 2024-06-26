import 'package:dio/dio.dart';
import 'package:flutter_application_1/model/answer.dart';

class AnswerService {
  final String baseUrl = "http://192.168.2.34:5284/api/Answer/GetAll";
  final Dio _dio = Dio();

  Future<List<Answer>> getAllAnswers() async {
    try {
      final response = await _dio.get(baseUrl);
      print('AnswerService response data: ${response.data}'); // Log response
      if (response.statusCode == 200) {
        List<Answer> answers = (response.data as List)
            .map((answer) => Answer.fromJson(answer))
            .toList();
        return answers;
      } else {
        throw Exception('Failed to load answers');
      }
    } catch (e) {
      print('Error in AnswerService: $e'); // Log error
      throw Exception('Failed to load answers');
    }
  }
}
