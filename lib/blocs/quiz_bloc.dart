// ignore_for_file: prefer_final_fields

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/constants/constants.dart';
import 'package:quiz_app/model/question_model.dart';

class QuizBloc extends ChangeNotifier {
  List<QuestionModel> _questionList = [];
  List<QuestionModel> get questionList => _questionList;

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool status) {
    _loading = status;
    notifyListeners();
  }

  int _activeQuiz = 1;
  int get activeQuiz => _activeQuiz;
  resetActiveQuiz() {
    _activeQuiz = 1;
    notifyListeners();
  }

  increaseQuizCount() {
    activeQuiz == questionList.length ? null : _activeQuiz++;
    notifyListeners();
  }

  decreaseQuizCount() {
    activeQuiz == 1 ? null : _activeQuiz--;
    notifyListeners();
  }

  int _point = 0;
  int get point => _point;
  increasePoint() {
    _point++;
    notifyListeners();
  }

  int _clickedIndex = -1;
  int get clickedIndex => _clickedIndex;
  setClickedIndex(int index) {
    _clickedIndex = index;
    notifyListeners();
  }

  resetClickedIndex() {
    _clickedIndex = -1;
    notifyListeners();
  }

  resetPoint() {
    _point = 0;
    notifyListeners();
  }

  Future getQuiz() async {
    _questionList = [];
    setLoading(true);
    try {
      Dio dio = Dio();

      final url = Constants.quizApiUrl;

      Response response = await dio.get(
        url,
        options: Options(responseType: ResponseType.json),
      );

      if (response.data != null) {
        for (var item in response.data["results"]) {
          _questionList.add(QuestionModel.fromJson(item));
        }
      }

      for (var item in questionList) {
        item.incorrectAnswers!.add(item.correctAnswer!);
      }

      for (var item in questionList) {
        item.incorrectAnswers!.shuffle();
      }

      debugPrint('Response data: ${response.data}');
    } catch (e) {
      debugPrint('Error: $e');
    }
    setLoading(false);
  }
}
