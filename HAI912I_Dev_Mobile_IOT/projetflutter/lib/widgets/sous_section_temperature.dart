import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:projetflutter/view/temperature.dart'; // Assurez-vous que ce chemin est correct

class SousSectionTemperature extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / 375;

    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 3,
        right: 3,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Temperature()),
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
                    'Max | Min',
                    style: TextStyle(
                      fontSize: 16 * fem,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff000000),
                    ),
                  ),
                  SizedBox(height: 4 * fem),
                  Text(
                    '24° | 12°',
                    style: TextStyle(
                      fontSize: 16 * fem,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff000000),
                    ),
                  ),
                ],
              ),
              // Vos widgets pour la colonne du milieu
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'TEMPERATURE',
                    style: TextStyle(
                      fontSize: 14 * fem,
                      fontWeight: FontWeight.w900,
                      color: Color(0xff736f6f),
                    ),
                  ),
                  SizedBox(height: 8 * fem),
                  Image.asset(
                    'assets/page-1/images/sun-rn7.png',
                    width: 35 * fem,
                    height: 40 * fem,
                  ),
                ],
              ),
              // Votre widget pour la colonne de droite
              Text(
                '30°C',
                style: TextStyle(
                  fontSize: 30 * fem,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000000),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
