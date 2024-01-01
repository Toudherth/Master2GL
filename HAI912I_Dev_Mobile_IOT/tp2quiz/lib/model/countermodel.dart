import 'package:flutter/material.dart';
import 'package:tpquiz2/entity/question.dart';

class QuizModel extends ChangeNotifier {
  List<Question> _questions = [];
  int _currentIndex = 0;
  int _score = 0;

  Color _trueButtonColor = Colors.transparent;
  Color _falseButtonColor = Colors.transparent;

  QuizModel(this._questions);

  Question get currentQuestion => _questions[_currentIndex];
  int get score => _score;
  Color get trueButtonColor => _trueButtonColor;
  Color get falseButtonColor => _falseButtonColor;

  void answerQuestion(bool userChoice) {
    bool isCorrect = userChoice == currentQuestion.isCorrect;

    if (isCorrect) {
      _trueButtonColor = Colors.green;
      _falseButtonColor = Colors.transparent;
      _score++;
    } else {
      _trueButtonColor = Colors.transparent;
      _falseButtonColor = Colors.red;
    }

    _currentIndex++;

    // Réinitialisez les couleurs pour la nouvelle question
    resetColors();

    // Notify listeners seulement si le quiz n'est pas terminé
    if (!isQuizFinished) {
      notifyListeners();
    }
  }

  bool get isQuizFinished => _currentIndex >= _questions.length;

  bool get hasPreviousQuestion => _currentIndex > 0;
  bool get hasNextQuestion => _currentIndex < _questions.length - 1;

  void resetColors() {
    _trueButtonColor = Colors.transparent;
    _falseButtonColor = Colors.transparent;
  }

  void goToNextQuestion() {
    if (hasNextQuestion) {
      _currentIndex++;
      notifyListeners();
    }
  }

  void goToPreviousQuestion() {
    if (hasPreviousQuestion) {
      _currentIndex--;
      notifyListeners();
    }
  }

  // get score global
  int get totalScore => _score;

  void resetQuiz() {
    _currentIndex = 0;
    _score = 0;
    _trueButtonColor = Colors.transparent;
    _falseButtonColor = Colors.transparent;
    notifyListeners();
  }
}
