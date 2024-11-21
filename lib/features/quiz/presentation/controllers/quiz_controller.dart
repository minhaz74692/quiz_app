// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:quiz_app/core/features/quiz/domain/entities/quiz.dart';
import 'package:quiz_app/core/features/quiz/domain/usecases/quiz_usecase.dart';

class QuizProvider extends ChangeNotifier {
  final QuizUsecase quizUsecase;
  QuizProvider(this.quizUsecase);
  List<Quiz> _questionList = [];
  List<Quiz> get questionList => _questionList;

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
      _questionList = await quizUsecase.getQuizes() ?? [];
      setLoading(false);
      notifyListeners();
    } catch (e) {
      debugPrint('Error: $e');
      setLoading(false);
      notifyListeners();
    }
  }
}
