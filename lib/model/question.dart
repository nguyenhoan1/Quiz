import 'answer.dart';

class Question {
  int id;
  String content;
  List<Answer> answers;

  Question({
    required this.id,
    required this.content,
    required this.answers,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'] ?? 0,
      content: json['content'] ?? '',
      answers: json['answers'] != null
          ? (json['answers'] as List)
              .map((answer) => Answer.fromJson(answer))
              .toList()
          : [],
    );
  }
}
