import 'package:flutter/material.dart';
import 'package:projetflutter/view/control_led_screen.dart';
import 'package:projetflutter/view/luminusite_screen.dart';
import 'dart:ui';
import 'package:projetflutter/view/temperature_screen.dart'; // Assurez-vous que ce chemin est correct



class SousSectionLuminosite extends StatelessWidget {
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
            MaterialPageRoute(builder: (context) => Lumenusite()),
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
                    'Luminosité',
                    style: TextStyle(
                      fontSize: 18 * fem,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff000000),
                    ),
                  ),

                  Row(
                    children: [
                      Image.asset(
                        'assets/page-1/images2/12.png',
                        width: 45 * fem,
                        height: 40 * fem,
                      ),
                      SizedBox(width: 25 * fem),
                      Image.asset(
                        'assets/page-1/images2/6.png',
                        width: 45 * fem,
                        height: 40 * fem,
                      ),
                    ],
                  ),
                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Row(
                    children: [
                      Icon(Icons.lightbulb_outlined, size: 35 * fem),
                      SizedBox(width: 4 * fem),

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
