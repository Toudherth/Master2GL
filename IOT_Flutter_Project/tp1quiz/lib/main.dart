import 'package:flutter/material.dart';
import 'package:test_project/data/dataservice.dart';
import 'package:test_project/entity/question.dart';

void main() =>  runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue, // Utilisez la couleur lightBlue comme couleur principale
        //accentColor: Colors.blue, // Utilisez la couleur blue comme couleur d'accentuation
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blue), // Configurez également la couleur secondaire
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
        home: const QuizzPage(title: 'Quiz application'),
    );
  }
}

class QuizzPage extends StatefulWidget {

  const QuizzPage({Key? key, required this.title}) : super(key: key);
  final String title;



  @override
  State<QuizzPage> createState() => QuizzPageState();
}



/**La classes de States */
class QuizzPageState extends State<QuizzPage> {

  late Question question;
  late List<Question> questionList; // Liste de questions
  Color trueButtonColor = Colors.transparent;
  Color falseButtonColor = Colors.transparent;



  @override
  void initState() {
    super.initState();
    // Initialisez la liste de questions lors de l'initialisation de la page.
    questionList = DataService.generateQuestions();
    // Initialisez la première question.
    question = _nextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Colors.blueAccent,
      /**Body*/
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,


          children: <Widget>[
            Text(
              'Question: ${question.questionText}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            Image.asset(
              question.imageUrl,
              height: 150.0,
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _checkAnswer(true),
                  child: Text('True'),
                  style: ElevatedButton.styleFrom(primary: trueButtonColor),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () => _checkAnswer(false),
                  child: Text('False'),
                  style: ElevatedButton.styleFrom(primary: falseButtonColor),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Réponse: ${question.isCorrect}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
   /*   floatingActionButton: FloatingActionButton(
        onPressed: null, // _incrementCounter,
        //tooltip: 'Increment',
        // child: const Icon(Icons.add),
      ),*/
    );
  }
  Question _nextQuestion() {
    // Initialisez la variable question avant de l'utiliser.
   // question = Question(questionText: "What is your question?", isCorrect: true);
    return questionList.removeAt(0);
  }

  Future<void> _checkAnswer(bool userChoice) async {
    bool isCorrect = userChoice == question.isCorrect;

    setState(() {
      if (isCorrect) {
        trueButtonColor = Colors.green;
        falseButtonColor = Colors.transparent;
      } else {
        //trueButtonColor = Colors.transparent;
        falseButtonColor = Colors.red;
      }
      question = _nextQuestion();
    });
  }


}

