import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tpquiz2/data/dataservice.dart';
import 'package:tpquiz2/model/countermodel.dart';
import 'package:tpquiz2/entity/question.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tpquiz2/service/quizpage.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => QuizModel(DataService.generateQuestions()),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuizPage(),
    );
  }
}
