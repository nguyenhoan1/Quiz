import 'question.dart';

class Quiz {
  int id;
  String name;
  List<Question> questions;

  Quiz({
    required this.id,
    required this.name,
    required this.questions,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      questions: json['questions'] != null
          ? (json['questions'] as List)
              .map((question) => Question.fromJson(question))
              .toList()
          : [],
    );
  }
}
