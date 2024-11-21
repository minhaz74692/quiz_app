// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/core/features/quiz/data/datasourses/quiz_services.dart';
import 'package:quiz_app/core/features/quiz/data/repositories/quiz_repository_impl.dart';
import 'package:quiz_app/core/features/quiz/domain/usecases/quiz_usecase.dart';
import 'package:quiz_app/core/features/quiz/presentation/controllers/quiz_controller.dart';
import 'package:quiz_app/screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });
  

  @override
  Widget build(BuildContext context) {
    final quizService = QuizServices();
    final quizRepository = QuizRepositoryImpl(quizService); // Replace with your actual implementation
final quizUsecase = QuizUsecase(quizRepository);
    return MultiProvider(
      providers: [
      
        ChangeNotifierProvider<QuizProvider>(
            create: (BuildContext context) => QuizProvider(quizUsecase)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
