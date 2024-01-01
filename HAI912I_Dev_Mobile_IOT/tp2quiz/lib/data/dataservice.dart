import 'package:tpquiz2/entity/question.dart';

class DataService {
  static List<Question> generateQuestions() {

    return [
    Question(questionText: "Flutter est-il un framework pour le développement mobile ?", isCorrect: true, imageUrl: 'assets/flutter_icon.png'),
    Question(questionText: "Dart est principalement utilisé pour le développement backend.", isCorrect: false, imageUrl: 'assets/dart_colour.png'),
    Question(questionText: "Quelle est la capitale de la France ?", isCorrect: true, imageUrl: 'assets/frances.png'),
   /* Question(questionText: "La Terre est-elle plate ?", isCorrect: false, imageUrl: 'assets/earth.png'),
    Question(questionText: "L'eau bout-elle à une température de 100 degrés Celsius ?", isCorrect: true, imageUrl: 'assets/water.png'),
    // Ajoutez 5 nouvelles questions ci-dessous
    Question(questionText: "Le soleil tourne-t-il autour de la Terre ?", isCorrect: false, imageUrl: 'assets/sun.png'),
    Question(questionText: "Les serpents peuvent-ils voler ?", isCorrect: true, imageUrl: 'assets/snake.png'),
    Question(questionText: "La lune est-elle faite de fromage ?", isCorrect: false, imageUrl: 'assets/moon.png'),
    Question(questionText: "Les pingouins vivent-ils en Arctique ?", isCorrect: true, imageUrl: 'assets/penguin.png'),
    Question(questionText: "Le code QR a été inventé en Chine ?", isCorrect: true, imageUrl: 'assets/qr_code.png'),
   */ // Ajoutez autant de questions que nécessaire
    ];

  }
}
