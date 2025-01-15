class Exam {
  final int id;
  final String title;
  final String examicon;
  final List<Question> questions;

  Exam(
      {required this.id,
      required this.title,
      required this.questions,
      required this.examicon});

  factory Exam.fromJson(Map<String, dynamic> json) {
    return Exam(
      id: json['id'],
      title: json['title'],
      examicon: json['examicon'],
      questions:
          (json['questions'] as List).map((q) => Question.fromJson(q)).toList(),
    );
  }
}

class Question {
  final int id;
  final String text;
  final List<String> options;
  final int answerIndex;

  Question({
    required this.id,
    required this.text,
    required this.options,
    required this.answerIndex,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      text: json['text'],
      options: List<String>.from(json['options']),
      answerIndex: json['answerIndex'],
    );
  }
}
