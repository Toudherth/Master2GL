import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tpquiz2/model/countermodel.dart';

class QuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Question: ${quizProvider.currentQuestion.questionText}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            Image.asset(
              quizProvider.currentQuestion.imageUrl,
              height: 150.0,
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    quizProvider.answerQuestion(true);
                  },
                  child: Text('True'),
                  style: ElevatedButton.styleFrom(primary: quizProvider.trueButtonColor),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    quizProvider.answerQuestion(false);
                  },
                  child: Text('False'),
                  style: ElevatedButton.styleFrom(primary: quizProvider.falseButtonColor),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            if (quizProvider.isQuizFinished)
              Text('Quiz Finished! Your Score: ${quizProvider.score}'),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (quizProvider.hasPreviousQuestion)
                ElevatedButton(
                  onPressed: () {
                    quizProvider.goToPreviousQuestion();
                  },
                  child: Text('Previous'),
                ),
              if (quizProvider.hasNextQuestion)
                ElevatedButton(
                  onPressed: () {
                    quizProvider.goToNextQuestion();
                  },
                  child: Text('Next'),
                ),
              SizedBox(height: 16.0),
              if (quizProvider.isQuizFinished)
                Column(
                  children: [
                    Text('Quiz Finished! Your Score: ${quizProvider.totalScore}'),
                    ElevatedButton(
                      onPressed: () {
                        // Réinitialisez le quiz si nécessaire
                        quizProvider.resetQuiz();
                      },
                      child: Text('Restart Quiz'),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
