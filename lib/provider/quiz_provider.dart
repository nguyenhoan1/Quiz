import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/answer.dart';
import 'package:flutter_application_1/model/question.dart';
import 'package:flutter_application_1/model/quiz.dart';
import 'package:flutter_application_1/service/qanda_service.dart';
import 'package:flutter_application_1/service/quizService.dart';

class QuizProvider with ChangeNotifier {
  List<Quiz> _quizzes = [];
  List<Question> _questions = [];
  List<Answer> _answers = [];
  bool _isLoading = false;

  List<Quiz> get quizzes => _quizzes;
  List<Question> get questions => _questions;
  List<Answer> get answers => _answers;
  bool get isLoading => _isLoading;

  final QuizService _quizService = QuizService();
  final QuestionService _questionService = QuestionService();
  final AnswerService _answerService = AnswerService();

 
  Future<void> fetchQuizzes() async {
    _isLoading = true;
    notifyListeners();

    try {
      _quizzes = await _quizService.getAllQuizzes();
      print('Quizzes fetched: ${_quizzes.length}');
    } catch (error) {
      print('Error fetching quizzes: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  Future<void> fetchQuizData() async {
    _isLoading = true;
    notifyListeners();

    try {
      _questions = await _questionService.getAllQuestions();
      _answers = await _answerService.getAllAnswers();
      print('Questions fetched: ${_questions.length}');
      print('Answers fetched: ${_answers.length}');
      for (var question in _questions) {
        print('Question: ${question.content}');
      }
      for (var answer in _answers) {
        print('Answer: ${answer.content}');
      }
    } catch (error) {
      print('Error fetching quiz data: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

