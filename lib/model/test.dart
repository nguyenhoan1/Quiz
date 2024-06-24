class Answer {
  final int id;
  final String text;

  Answer({required this.id, required this.text});
}

class Question {
  final int id;
  final String question;
  final List<Answer> answers;

  Question({required this.id, required this.question, required this.answers});
}

class Test {
  final int id;
  final String title;
  final String description;
  final List<Question> questions;

  Test({required this.id, required this.title, required this.description, required this.questions});
}
