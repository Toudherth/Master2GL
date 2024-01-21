import 'package:flutter/material.dart';
import 'package:projetflutter/view/led_controler.dart';
import 'package:projetflutter/view/luminusite.dart';
import 'dart:ui';
import 'package:projetflutter/view/temperature.dart'; // Assurez-vous que ce chemin est correct


class SousSectionLED extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / 375;

    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 3,
        right: 3,
        bottom: MediaQuery.of(context).size.width * 0.05, // Espacement en bas
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            // MaterialPageRoute(builder: (context) => Lumenusite()),
            MaterialPageRoute(builder: (context) => ColorMixer()),
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16 * fem, horizontal: 25 * fem),
          margin: EdgeInsets.only(left: 10 * fem, right: 10 * fem),
          decoration: BoxDecoration(
            color: Color(0x91ffffff),
            borderRadius: BorderRadius.circular(20 * fem),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Vos widgets pour la colonne de gauche
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Controle de la LED',
                    style: TextStyle(
                      fontSize: 16 * fem,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff000000),
                    ),
                  ),
                  SizedBox(height: 4 * fem),
                  Row(
                    children: [
                      Image.asset(
                        'assets/page-1/images/moon-symbol.png',
                        width: 20 * fem,
                        height: 20 * fem,
                      ),
                      SizedBox(width: 4 * fem),
                      Image.asset(
                        'assets/page-1/images/sun-fj1.png',
                        width: 20 * fem,
                        height: 20 * fem,
                      ),
                    ],
                  ),
                ],
              ),
              // Vos widgets pour la colonne du milieu
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Lumière',
                    style: TextStyle(
                      fontSize: 14 * fem,
                      fontWeight: FontWeight.w900,
                      color: Color(0xff736f6f),
                    ),
                  ),
                  SizedBox(height: 8 * fem),
                  Row(
                    children: [
                      Icon(Icons.lightbulb_outline, size: 20 * fem),
                      SizedBox(width: 4 * fem),
                      Text(
                        '80%',
                        style: TextStyle(
                          fontSize: 14 * fem,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff000000),
                        ),
                      ),
                    ],
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
