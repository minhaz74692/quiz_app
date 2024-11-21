import 'package:quiz_app/core/features/quiz/domain/entities/quiz.dart';

abstract class QuizRepository{
  Future<List<Quiz>?> getQuizes();
}