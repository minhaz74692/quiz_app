import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/core/features/quiz/presentation/controllers/quiz_controller.dart';
import 'package:quiz_app/utils/navigator.dart';
import 'package:quiz_app/utils/reusaable_button.dart';
import 'package:quiz_app/core/features/quiz/presentation/pages/quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuizProvider quizProvider = context.watch<QuizProvider>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ReuseableButton(
          verticlaPadding: quizProvider.loading ? 8 : 12,
          horizontalPadding: 20,
          widget: quizProvider.loading
              ? const SizedBox(
                  height: 28,
                  width: 28,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : null,
          onPressed: () async {
            !quizProvider.loading
                ? await quizProvider.getQuiz().then((_) {
                    quizProvider.resetActiveQuiz();
                    quizProvider.resetClickedIndex();
                    quizProvider.questionList.isNotEmpty
                        ? NavigatorHelper.toScreen(context, const QuizScreen())
                        : null;
                  })
                : null;
          },
          title: "Start Quiz",
        ),
      ),
    );
  }
}
