import 'package:test_project/entity/question.dart';

import '';
class DataService {
  static List<Question> generateQuestions() {
    return [
      Question(
        questionText: "Is Flutter a framework for mobile development?",
        isCorrect: true,
        imageUrl: "assets/flutter_icon.png",
      ),
      Question(
        questionText: "Dart is primarily used for backend development.",
        isCorrect: false,
        imageUrl: "assets/dart_colour.png",
      ),

      Question(
        questionText: "Quelle est la capitale de la France?",
        isCorrect: true,
        imageUrl: "assets/frances.png",
      ),

    ];
  }
}