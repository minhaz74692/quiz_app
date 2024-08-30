import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/blocs/quiz_bloc.dart';
import 'package:quiz_app/utils/navigator.dart';
import 'package:quiz_app/widgets/reusaable_button.dart';
import 'package:quiz_app/screens/quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuizBloc qb = context.watch<QuizBloc>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ReuseableButton(
          verticlaPadding: qb.loading ? 8 : 12,
          horizontalPadding: 20,
          widget: qb.loading
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
            !qb.loading
                ? await qb.getQuiz().then((_) {
                    qb.resetActiveQuiz();
                    qb.resetClickedIndex();
                    qb.questionList.isNotEmpty
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
