// styles.dart
export 'package:projetflutter/text_style.dart';
import 'package:flutter/material.dart';


class AppTextStyles {
  static TextStyle get globalTextStyle => TextStyle(
    color: Colors.blueGrey[900],
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
    letterSpacing: 0.5,
  );

  static TextStyle titleStyle(double screenWidth) => TextStyle(
    fontSize: screenWidth * 0.08,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle titleStylesun(double screenWidth) => TextStyle(
    fontSize: screenWidth * 0.08,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  // Vous pouvez ajouter plus de styles ici, par exemple :
  static TextStyle get subtitleStyle => TextStyle(
    color: Colors.blueGrey[600],
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
  );


  static TextStyle get basicTextStyle => TextStyle(
    fontSize: 9,
    color: Colors.black,
  );

}
