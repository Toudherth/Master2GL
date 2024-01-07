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
      child: Container(
        // registerCKD (12:395)
        padding: EdgeInsets.fromLTRB(13*fem, 14*fem, 14.67*fem, 278.5*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // statusbarhFy (12:410)
              margin: EdgeInsets.fromLTRB(22.33*fem, 0*fem, 0*fem, 27*fem),
              width: double.infinity,
              height: 19*fem,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // timectj (12:428)
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
                    // uiigs (12:411)
                    margin: EdgeInsets.fromLTRB(0*fem, 3.33*fem, 0*fem, 4.33*fem),
                    height: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // cellSsm (12:421)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5*fem, 0*fem),
                          width: 17*fem,
                          height: 10.67*fem,
                          child: Image.asset(
                            'assets/page-1/images/cell-s9M.png',
                            width: 17*fem,
                            height: 10.67*fem,
                          ),
                        ),
                        Container(
                          // wifiMjq (12:416)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5*fem, 0.33*fem),
                          width: 15.33*fem,
                          height: 11*fem,
                          child: Image.asset(
                            'assets/page-1/images/wifi-TbZ.png',
                            width: 15.33*fem,
                            height: 11*fem,
                          ),
                        ),
                        Container(
                          // batterysTH (12:412)
                          width: 24.33*fem,
                          height: 11.33*fem,
                          child: Image.asset(
                            'assets/page-1/images/battery-wNT.png',
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
            Container(
              // unionCkT (12:408)
              margin: EdgeInsets.fromLTRB(3*fem, 0*fem, 0*fem, 32.15*fem),
              width: 12.21*fem,
              height: 11.35*fem,
              child: Image.asset(
                'assets/page-1/images/union.png',
                width: 12.21*fem,
                height: 11.35*fem,
              ),
            ),
            Container(
              // loginues (12:398)
              margin: EdgeInsets.fromLTRB(3*fem, 0*fem, 0*fem, 111.5*fem),
              child: Text(
                'Log in',
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
              // componentCts (12:399)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4.33*fem, 16*fem),
              padding: EdgeInsets.fromLTRB(15*fem, 17*fem, 183*fem, 17*fem),
              width: double.infinity,
              decoration: BoxDecoration (
                border: Border.all(color: Color(0xff000000)),
                color: Color(0xffffffff),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // iconenvelopeclosedtmh (14:11)
                    margin: EdgeInsets.fromLTRB(0*fem, 2*fem, 29*fem, 0*fem),
                    width: 21*fem,
                    height: 16*fem,
                    child: Image.asset(
                      'assets/page-1/images/icon-envelope-closed-Lm1.png',
                      width: 21*fem,
                      height: 16*fem,
                    ),
                  ),
                  Text(
                    // emailaddressodm (12:401)
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
              // component8g3 (12:402)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4.33*fem, 68*fem),
              padding: EdgeInsets.fromLTRB(14*fem, 13*fem, 161*fem, 15*fem),
              width: double.infinity,
              decoration: BoxDecoration (
                border: Border.all(color: Color(0xff000000)),
                color: Color(0xffffffff),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // iconlocklocked2Fd (14:16)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 32*fem, 0*fem),
                    width: 22*fem,
                    height: 24*fem,
                    child: Image.asset(
                      'assets/page-1/images/icon-lock-locked-1d5.png',
                      width: 22*fem,
                      height: 24*fem,
                    ),
                  ),
                  Container(
                    // createpassword8pT (12:404)
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
              // buttonSq9 (12:405)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 21.5*fem),
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
                    'LOG IN',
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
            Center(
              // forgetpassword5NK (25:159)
              child: Container(
                width: double.infinity,
                child: Text(
                  'FORGET PASSWORD',
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
          ],
        ),
      ),
          );
  }
}