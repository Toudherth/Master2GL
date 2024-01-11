import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';



import 'package:flutter/material.dart';
import 'package:projetflutter/view/luminusite.dart';
import 'dart:ui';
import 'package:projetflutter/view/temperature.dart'; // Assurez-vous que ce chemin est correct

class SousSectionSombre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / 375;

    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 10,
        right: 10,
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
            borderRadius: BorderRadius.circular(30 * fem),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [


              // Vos widgets pour la colonne de gauche
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [


                ],
              ),
              // Vos widgets pour la colonne du milieu
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class Sombre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 374;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // sombreZis (25:68)
        width: double.infinity,
        height: 812*fem,
        decoration: BoxDecoration (
          color: Color(0xff252020),
        ),
        child: Stack(
          children: [
            Positioned(
              // statusbarhq5 (25:70)
              left: 35.3333282471*fem,
              top: 14*fem,
              child: Container(
                width: 325*fem,
                height: 19*fem,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // timeDYX (25:88)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 232.33*fem, 0*fem),
                      child: Text(
                        '9:27',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'SFProText', // Remplacez par le nom de votre police personnalisée
                          fontSize: 15 * ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.2575,
                          letterSpacing: -0.3333333433 * fem,
                          color: Color(0xff000000),
                        ),

                      ),
                    ),
                    Container(
                      // uiiVH (25:71)
                      margin: EdgeInsets.fromLTRB(0*fem, 3.33*fem, 0*fem, 4.33*fem),
                      height: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // cellTBy (25:81)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5*fem, 0*fem),
                            width: 17*fem,
                            height: 10.67*fem,
                            child: Image.asset(
                              'assets/page-1/images/cell-yfq.png',
                              width: 17*fem,
                              height: 10.67*fem,
                            ),
                          ),
                          Container(
                            // wifiyRD (25:76)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5*fem, 0.33*fem),
                            width: 15.33*fem,
                            height: 11*fem,
                            child: Image.asset(
                              'assets/page-1/images/wifi-KMu.png',
                              width: 15.33*fem,
                              height: 11*fem,
                            ),
                          ),
                          Container(
                            // battery6kj (25:72)
                            width: 24.33*fem,
                            height: 11.33*fem,
                            child: Image.asset(
                              'assets/page-1/images/battery-h1V.png',
                              width: 24.33*fem,
                              height: 11.33*fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // tabbarqCX (25:90)
              left: 0*fem,
              top: 0*fem,
              child: Container(
                width: 377*fem,
                height: 812*fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // autogroupmchhMRm (6mWuACuBsiC9BhFP4XmChH)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 306*fem),
                      padding: EdgeInsets.fromLTRB(119*fem, 370.5*fem, 112*fem, 29.5*fem),
                      width: 374*fem,
                      decoration: BoxDecoration (
                        image: DecorationImage (
                          fit: BoxFit.contain,
                          image: AssetImage (
                            'assets/page-1/images/crescent-moon-bg.png',
                          ),
                        ),
                      ),
                      child: Text(
                        'Mode Sombre',
                        style: TextStyle(
                          fontFamily: 'SFProText', // Remplacez par le nom de votre police personnalisée
                          fontSize: 15 * ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.2575,
                          letterSpacing: -0.3333333433 * fem,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    Container(
                      // backgroundzUj (25:91)
                      margin: EdgeInsets.fromLTRB(2*fem, 0*fem, 0*fem, 0*fem),
                      padding: EdgeInsets.fromLTRB(52*fem, 15*fem, 49*fem, 15*fem),
                      width: 375*fem,
                      height: 83*fem,
                      decoration: BoxDecoration (
                        color: Color(0xff1b1919),
                      ),
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur (
                            sigmaX: 13.5914087296*fem,
                            sigmaY: 13.5914087296*fem,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // autogroupoxuf3C7 (6mWuHNMvHB6rDCYSTKoXUf)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 83.66*fem, 0*fem),
                                height: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      // iconhomeyLf (25:108)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12.13*fem),
                                      width: 34.34*fem,
                                      height: 27.87*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/icon-home.png',
                                        width: 34.34*fem,
                                        height: 27.87*fem,
                                      ),
                                    ),
                                    Container(
                                      // homesgw (25:114)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1.34*fem, 0*fem),
                                      child: Text(
                                        'Home',
                                        style: TextStyle(
                                          fontFamily: 'SFProText', // Remplacez par le nom de votre police personnalisée
                                          fontSize: 15 * ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.2575,
                                          letterSpacing: -0.3333333433 * fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // autogroupkupuzFm (6mWuNNDbJi1ooyG1qyKUPu)
                                margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 84.13*fem, 0*fem),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // iconcogiSf (25:112)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2.74*fem, 8.96*fem),
                                      width: 33*fem,
                                      height: 30.04*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/icon-cog-nFD.png',
                                        width: 33*fem,
                                        height: 30.04*fem,
                                      ),
                                    ),
                                    Text(
                                      // settingsER1 (25:115)
                                      'Settings',
                                      style: TextStyle(
                                        fontFamily: 'SFProText', // Remplacez par le nom de votre police personnalisée
                                        fontSize: 15 * ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.2575,
                                        letterSpacing: -0.3333333433 * fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // autogroup3ra3ydV (6mWuSwvHuwrMSgFTcu3Ra3)
                                margin: EdgeInsets.fromLTRB(0*fem, 0.48*fem, 0*fem, 0*fem),
                                height: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // iconpersonJfm (25:110)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12.52*fem),
                                      width: 29*fem,
                                      height: 27*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/icon-person-CfD.png',
                                        width: 29*fem,
                                        height: 27*fem,
                                      ),
                                    ),
                                    Container(
                                      // profilebPy (25:116)
                                      margin: EdgeInsets.fromLTRB(0.87*fem, 0*fem, 0*fem, 0*fem),
                                      child: Text(
                                        'Profile',
                                        style: TextStyle(
                                          fontFamily: 'SFProText', // Remplacez par le nom de votre police personnalisée
                                          fontSize: 15 * ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.2575,
                                          letterSpacing: -0.3333333433 * fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}