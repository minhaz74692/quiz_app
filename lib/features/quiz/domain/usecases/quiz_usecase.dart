import 'package:quiz_app/features/quiz/domain/entities/quiz.dart';
import 'package:quiz_app/features/quiz/domain/repositories/quiz_repository.dart';

class QuizUsecase {
  final QuizRepository quizRepository;
  QuizUsecase(this.quizRepository);

  Future<List<Quiz>?> getQuizes() {
    return quizRepository.getQuizes();
  }
}
