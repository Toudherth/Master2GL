import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:myapp/utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,

      // appbar
      child: Container(
        // registerQwD (10:33)
        padding: EdgeInsets.fromLTRB(13*fem, 14*fem, 14.67*fem, 247*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // statusbar1pX (10:48)
              margin: EdgeInsets.fromLTRB(22.33*fem, 0*fem, 0*fem, 27*fem),
              width: double.infinity,
              height: 19*fem,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // timeuuu (10:66)
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
                    // uixNP (10:49)
                    margin: EdgeInsets.fromLTRB(0*fem, 3.33*fem, 0*fem, 4.33*fem),
                    height: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // cell4wD (10:59)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5*fem, 0*fem),
                          width: 17*fem,
                          height: 10.67*fem,
                          child: Image.asset(
                            'assets/page-1/images/cell-eMh.png',
                            width: 17*fem,
                            height: 10.67*fem,
                          ),
                        ),
                        Container(
                          // wifi32T (10:54)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5*fem, 0.33*fem),
                          width: 15.33*fem,
                          height: 11*fem,
                          child: Image.asset(
                            'assets/page-1/images/wifi.png',
                            width: 15.33*fem,
                            height: 11*fem,
                          ),
                        ),
                        Container(
                          // battery83u (10:50)
                          width: 24.33*fem,
                          height: 11.33*fem,
                          child: Image.asset(
                            'assets/page-1/images/battery-Mko.png',
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


            /**defjdjfjfjekjdkkkkkkkkkkkjdkshfkjs*****/
            // la suite de code
            Container(
              // unionBRV (10:46)
              margin: EdgeInsets.fromLTRB(3*fem, 0*fem, 0*fem, 32.15*fem),
              width: 12.21*fem,
              height: 11.35*fem,
              child: Image.asset(
                'assets/page-1/images/union-R5d.png',
                width: 12.21*fem,
                height: 11.35*fem,
              ),
            ),
            Container(
              // registergd9 (10:36)
              margin: EdgeInsets.fromLTRB(3*fem, 0*fem, 0*fem, 112.5*fem),
              child: Text(
                'Register',
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


            /**Les champs */
            Container(
              // componentZS3 (12:430)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4.33*fem, 16*fem),
              padding: EdgeInsets.fromLTRB(13*fem, 18*fem, 206*fem, 12*fem),
              width: double.infinity,
              decoration: BoxDecoration (
                border: Border.all(color: Color(0xff000000)),
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(10*fem),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // iconpersonRj9 (14:4)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 29*fem, 0*fem),
                    width: 23*fem,
                    height: 22*fem,
                    child: Image.asset(
                      'assets/page-1/images/icon-person.png',
                      width: 23*fem,
                      height: 22*fem,
                    ),
                  ),
                  Container(
                    // usernamejE3 (12:432)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                    child: Text(
                      'User name',
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
              // componentS8T (10:37)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4.33*fem, 16*fem),
              padding: EdgeInsets.fromLTRB(15*fem, 17*fem, 185*fem, 17*fem),
              width: double.infinity,
              decoration: BoxDecoration (
                border: Border.all(color: Color(0xff000000)),
                color: Color(0xffffffff),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // iconenvelopeclosedu23 (14:10)
                    margin: EdgeInsets.fromLTRB(0*fem, 2*fem, 27*fem, 0*fem),
                    width: 21*fem,
                    height: 16*fem,
                    child: Image.asset(
                      'assets/page-1/images/icon-envelope-closed.png',
                      width: 21*fem,
                      height: 16*fem,
                    ),
                  ),
                  Text(
                    // emailaddressC19 (10:39)
                    'Email address',
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
              // componentXZD (10:40)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4.33*fem, 68*fem),
              padding: EdgeInsets.fromLTRB(14*fem, 13*fem, 165*fem, 15*fem),
              width: double.infinity,
              decoration: BoxDecoration (
                border: Border.all(color: Color(0xff000000)),
                color: Color(0xffffffff),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // iconlocklockedqK1 (14:15)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 29*fem, 0*fem),
                    width: 22*fem,
                    height: 24*fem,
                    child: Image.asset(
                      'assets/page-1/images/icon-lock-locked.png',
                      width: 22*fem,
                      height: 24*fem,
                    ),
                  ),
                  Container(
                    // createpasswordwsq (10:42)
                    margin: EdgeInsets.fromLTRB(0*fem, 2*fem, 0*fem, 0*fem),
                    child: Text(
                      'Create password',
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
              // buttonFdd (10:43)
              width: 343*fem,
              height: 52*fem,
              decoration: BoxDecoration (
                border: Border.all(color: Color(0xff000000)),
                color: Color(0xff000000),
                borderRadius: BorderRadius.circular(6*fem),
              ),
              child: Center(
                child: Center(
                  child: Text(
                    'NEXT',
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
              ),
            ),
          ],
        ),
      ),
          );
  }
}