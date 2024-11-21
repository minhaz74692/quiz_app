import 'package:get_it/get_it.dart';
import 'package:quiz_app/core/features/quiz/data/datasourses/quiz_services.dart';
import 'package:quiz_app/core/features/quiz/data/repositories/quiz_repository_impl.dart';
import 'package:quiz_app/core/features/quiz/domain/repositories/quiz_repository.dart';
import 'package:quiz_app/core/features/quiz/domain/usecases/quiz_usecase.dart';
import 'package:quiz_app/core/features/quiz/presentation/controllers/quiz_controller.dart';

// Initialize GetIt instance
final di = GetIt.instance;

void diContainer() {
  // Register DataSource
  di.registerLazySingleton<QuizServices>(() => QuizServices());

  // Register Repository
  di.registerLazySingleton<QuizRepository>(
      () => QuizRepositoryImpl(di<QuizServices>()));

  // Register Usecase
  di.registerLazySingleton<QuizUsecase>(
      () => QuizUsecase(di<QuizRepository>()));

  // Register Provider
  di.registerFactory(() => QuizProvider(di<QuizUsecase>()));
}
