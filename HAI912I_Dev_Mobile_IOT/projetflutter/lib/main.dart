// main.dart

import 'package:flutter/material.dart';
import 'package:projetflutter/view/logged_out.dart'; // Assurez-vous que ce chemin est correct

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Votre Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // Utilisez un TextTheme standard ou définissez le vôtre sans GoogleFonts
        textTheme: TextTheme(
          bodyText1: TextStyle(fontFamily: 'VotrePolice'), // Remplacez 'VotrePolice' par votre police

          // ... autres styles ...
        ),
      ),
      home: MyButtonWidget(), // Assurez-vous que la classe Scene est définie quelque part dans votre projet
    );
  }
}

