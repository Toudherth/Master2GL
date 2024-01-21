// main.dart

import 'package:flutter/material.dart';
import 'package:projetflutter/view/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Water Sun',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // Utilisez un TextTheme standard ou définissez le vôtre sans GoogleFonts
        textTheme: TextTheme(
          bodyText1: TextStyle(fontFamily: 'Roboto'), // Remplacez 'VotrePolice' par votre police
        ),
      ),
      home: Home(),
    );
  }
}

