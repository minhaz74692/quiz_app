import 'dart:convert';

import 'package:quiz_app/core/features/quiz/domain/entities/quiz.dart';

QuizModel QuizModelFromJson(String str) => QuizModel.fromJson(json.decode(str));

String QuizModelToJson(QuizModel data) => json.encode(data.toJson());

class QuizModel {
  String? type;
  String? difficulty;
  String? category;
  String? question;
  String? correctAnswer;
  List<String>? incorrectAnswers;

  QuizModel({
    this.type,
    this.difficulty,
    this.category,
    this.question,
    this.correctAnswer,
    this.incorrectAnswers,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        type: json["type"],
        difficulty: json["difficulty"],
        category: json["category"],
        question: json["question"],
        correctAnswer: json["correct_answer"],
        incorrectAnswers:
            List<String>.from(json["incorrect_answers"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "difficulty": difficulty,
        "category": category,
        "question": question,
        "correct_answer": correctAnswer,
        "incorrect_answers":
            List<dynamic>.from(incorrectAnswers!.map((x) => x)),
      };

  // Convert Model to Entity
  Quiz toEntity() {
    return Quiz(
      type: type ?? '',
      difficulty: difficulty ?? '',
      category: category ?? '',
      question: question ?? '',
      correctAnswer: correctAnswer ?? '',
      incorrectAnswers: incorrectAnswers ?? [],
    );
  }
}
