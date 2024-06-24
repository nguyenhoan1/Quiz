class Quiz {
  int id;
  String? name;
  String? note;

  Quiz({
    required this.id,
    required this.name,
    required this.note,
    // required this.image
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
    id: json['id'],
    name: json['name'],
    note: json['note']
    // image: json['image']
    );
  }
 Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'note': note,
    };
  }
}
