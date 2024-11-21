// data/repositories/user_repository_impl.dart
import 'package:quiz_app/core/features/quiz/data/datasourses/quiz_services.dart';
import 'package:quiz_app/core/features/quiz/domain/entities/quiz.dart';
import 'package:quiz_app/core/features/quiz/domain/repositories/quiz_repository.dart';


class QuizRepositoryImpl implements QuizRepository {
  final QuizServices quizService;

  QuizRepositoryImpl(this.quizService);

  @override
  Future<List<Quiz>?> getQuizes() async {
    final data = await quizService.getQuizService();
    return data?.map((e) => e.toEntity()).toList();
  }
}
