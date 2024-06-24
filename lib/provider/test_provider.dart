import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/model/test.dart';

class TestProvider with ChangeNotifier {
  List<Test> _tests = [];

  List<Test> get tests => _tests;

  TestProvider() {
    // Fetch fake data initially
    fetchTests();
  }

  Future<void> fetchTests() async {
    // Simulate a network call
    await Future.delayed(Duration(seconds: 2));

    // Replace this with your actual API call
    _tests = List.generate(
      3,
      (index) => Test(
        id: index,
        title: 'Test ${index + 1}',
        description: 'Description for Test ${index + 1}',
        questions: [
          Question(
            id: index * 3 + 1,
            question: 'Question 1 for Test ${index + 1}',
            answers: [
              Answer(id: 1, text: 'Answer A'),
              Answer(id: 2, text: 'Answer B'),
              Answer(id: 3, text: 'Answer C'),
              Answer(id: 4, text: 'Answer D'),
            ],
          ),
          Question(
            id: index * 3 + 2,
            question: 'Question 2 for Test ${index + 1}',
            answers: [
              Answer(id: 5, text: 'Answer 1'),
              Answer(id: 6, text: 'Answer 2'),
              Answer(id: 7, text: 'Answer 3'),
              Answer(id: 8, text: 'Answer 4'),
            ],
          ),
          Question(
            id: index * 3 + 3,
            question: 'Question 3 for Test ${index + 1}',
            answers: [
              Answer(id: 9, text: 'Choice A'),
              Answer(id: 10, text: 'Choice B'),
              Answer(id: 11, text: 'Choice C'),
              Answer(id: 12, text: 'Choice D'),
            ],
          ),
        ],
      ),
    );

    notifyListeners();
  }

  Question getQuestionById(int questionId) {
    for (var test in _tests) {
      for (var question in test.questions) {
        if (question.id == questionId) {
          return question;
        }
      }
    }
    throw Exception('Question not found');
  }

  Answer getAnswerById(int questionId, int answerId) {
    var question = getQuestionById(questionId);
    for (var answer in question.answers) {
      if (answer.id == answerId) {
        return answer;
      }
    }
    throw Exception('Answer not found');
  }

  void addQuestion(int testId, Question question) {
    for (var test in _tests) {
      if (test.id == testId) {
        test.questions.insert(0, question); // Add new question at the beginning
        notifyListeners();
        break;
      }
    }
  }
}
