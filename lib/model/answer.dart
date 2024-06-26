class Answer {
  int id;
  int questionId; 
  String content;

  Answer({
    required this.id,
    required this.questionId,
    required this.content,
  });

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      id: json['id'] ?? 0,
      questionId: json['question_Id'] ?? 0,
      content: json['content'] ?? '',
    );
  }
}
