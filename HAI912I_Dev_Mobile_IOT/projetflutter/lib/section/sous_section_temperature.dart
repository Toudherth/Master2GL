import 'package:flutter/material.dart';
import 'package:projetflutter/service/temperature_service.dart';
import 'package:projetflutter/view/luminusite_screen.dart';
import 'package:projetflutter/view/temperature_screen.dart'; // Assurez-vous que ce chemin est correct

class SousSectionTemperature extends StatefulWidget {
  @override
  _SousSectionTemperatureState createState() => _SousSectionTemperatureState();
}

class _SousSectionTemperatureState extends State<SousSectionTemperature> {


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
                    'Température',
                    style: TextStyle(
                      fontSize: 18 * fem,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff000000),
                    ),
                  ),

                  Row(
                    children: [
                      Image.asset(
                        'assets/page-1/images2/2.png',
                        width: 50 * fem,
                        height: 46 * fem,
                      ),
                      SizedBox(width: 25 * fem),
                      Image.asset(
                        'assets/page-1/images2/7.png',
                        width: 50 * fem,
                        height: 46 * fem,
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
                      Icon(Icons.sunny_snowing, size: 35 * fem),
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
