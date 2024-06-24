class Quizez {
  final String id;
  final String title;
  final String description;

  Quizez({required this.id, required this.title, required this.description});

  factory Quizez.fromJson(Map<String, dynamic> json) {
    return Quizez(
      id: json.containsKey('id') ? json['id'] : '',
      title: json.containsKey('title') ? json['title'] : 'No Title',
      description: json.containsKey('description') ? json['description'] : 'No Description',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }
}