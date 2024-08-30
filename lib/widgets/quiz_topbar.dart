// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:quiz_app/constants/constants.dart';
import 'package:quiz_app/utils/navigator.dart';
class QuizTopBar extends StatelessWidget {
  const QuizTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      width: double.infinity,
      color: Constants.topbarColor,
      child: SafeArea(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: InkWell(
              onTap: () {
                NavigatorHelper.back(context);
              },
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.chevron_left,
                  color: Constants.topbarColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
