// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/constants/constants.dart';
import 'package:quiz_app/core/features/quiz/presentation/controllers/quiz_controller.dart';
class QuizTimeBox extends StatelessWidget {
  const QuizTimeBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    QuizProvider quizProvider = context.watch<QuizProvider>();
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Constants.quizTimeBoxColor1,
            Constants.quizTimeBoxColor2,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Quiz ${quizProvider.activeQuiz} (Single Choose)",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.timer_outlined,
                  color: Constants.topbarColor,
                ),
                Text("data"),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Text(
                  "Question ${quizProvider.activeQuiz} of ${quizProvider.questionList.length}",
                ),
                Spacer(),
                Text(
                  "Point: ${quizProvider.point}",
                  style: TextStyle(
                    color: Constants.buttonColor,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

