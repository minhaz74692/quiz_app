import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/constants/constants.dart';
import 'package:quiz_app/core/features/quiz/data/models/quiz_model.dart';

class QuizServices {
  Future<List<QuizModel>?> getQuizService() async {
    try {
      Dio dio = Dio();

      final url = Constants.quizApiUrl;

      Response response = await dio.get(
        url,
        options: Options(responseType: ResponseType.json),
      );

      if (response.data != null) {
        debugPrint(response.data["results"]
            .map((e) => QuizModel.fromJson(e))
            .runtimeType
            .toString());
        final results = (response.data["results"] as List<dynamic>)
            .map((e) => QuizModel.fromJson(e))
            .toList();
        return results;
      }
      // debugPrint('Response data: ${response.data}');
      return null;
    } catch (e) {
      debugPrint('Error getQuiz: $e');
      return null;
    }
  }
}
