// main.dart

import 'package:flutter/material.dart';
import 'package:projetflutter/view/accueil_screen.dart';
import 'package:projetflutter/view/home_screen.dart';
import 'package:projetflutter/view/login_screen.dart';
import 'package:projetflutter/view/profile_screen.dart';
import 'package:projetflutter/view/settings_screen.dart';

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

        textTheme: TextTheme(
          bodyText1: TextStyle(fontFamily: 'Roboto'),
        ),
      ),
      routes: {
        '/home': (context) => Accueil(),
        '/profile': (context) => ProfileScreen(),
        '/parametre': (context) => SettingsScreen(),
        '/login': (context) => Login(),

      },
      home: Home(),
    );
  }
}

