// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/blocs/quiz_bloc.dart';

class QuestionBox extends StatelessWidget {
  const QuestionBox({
    super.key,
  });
  // final List<String> questions;

  @override
  Widget build(BuildContext context) {
    var qb = context.watch<QuizBloc>();
    List<String> questions =
        qb.questionList[qb.activeQuiz - 1].incorrectAnswers!;
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            qb.questionList[qb.activeQuiz - 1].question!,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Choose only one answer"),
          SizedBox(
            height: 10,
          ),
          Column(
            children: List.generate(questions.length, (int index) {
              return GestureDetector(
                onTap: () async {
                  await qb.setClickedIndex(index);
                  if (questions[qb.clickedIndex] ==
                      qb.questionList[qb.activeQuiz - 1].correctAnswer!) {
                    qb.increasePoint();
                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: index == qb.clickedIndex
                              ? questions[index] ==
                                      qb.questionList[qb.clickedIndex]
                                          .correctAnswer!
                                  ? Colors.green
                                  : Colors.red
                              : Colors.grey,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(7),
                            bottomLeft: Radius.circular(7),
                          ),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                        child: Text(
                          index == 0
                              ? 'A'
                              : index == 1
                                  ? 'B'
                                  : index == 2
                                      ? 'C'
                                      : index == 3
                                          ? 'D'
                                          : '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(questions[index]),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
