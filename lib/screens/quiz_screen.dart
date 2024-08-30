// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/blocs/quiz_bloc.dart';
import 'package:quiz_app/widgets/question_box.dart';
import 'package:quiz_app/widgets/quiz_time_box.dart';
import 'package:quiz_app/widgets/quiz_topbar.dart';
import 'package:quiz_app/widgets/reusaable_button.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuizBloc qb = context.watch<QuizBloc>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuizTopBar(),
          QuizTimeBox(),
          QuestionBox(),
          Spacer(),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(24),
            child: ReuseableButton(
              verticlaPadding: 12,
              title: "Next",
              onPressed: () {
                qb.resetClickedIndex();
                qb.increaseQuizCount();
              },
            ),
          )
        ],
      ),
    );
  }
}
