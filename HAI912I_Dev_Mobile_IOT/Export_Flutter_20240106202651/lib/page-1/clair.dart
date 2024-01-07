import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 374;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // clairWTD (19:6)
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              // autogrouputcjepK (6mWsifU4FT8T5c8e7nUtcj)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 130*fem),
              width: double.infinity,
              height: 707*fem,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // rectangleaCB (19:27)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1723*fem, 0*fem),
                    width: 375*fem,
                    height: 707*fem,
                    child: Image.asset(
                      'assets/page-1/images/rectangle-h47.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    // autogroupg2yquET (6mWsoupK8MtTTcghH4g2yq)
                    margin: EdgeInsets.fromLTRB(0*fem, 114*fem, 0*fem, 180*fem),
                    width: 373*fem,
                    height: double.infinity,
                    child: Stack(
                      children: [
                        Positioned(
                          // statusbarqP1 (19:8)
                          left: 34.3333282471*fem,
                          top: 8*fem,
                          child: Container(
                            width: 325*fem,
                            height: 19*fem,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // timevvF (19:26)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 232.33*fem, 0*fem),
                                  child: Text(
                                    '9:27',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont (
                                      'SF Pro Text',
                                      fontSize: 15*ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.2575*ffem/fem,
                                      letterSpacing: -0.3333333433*fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                                Container(
                                  // uioj9 (19:9)
                                  margin: EdgeInsets.fromLTRB(0*fem, 3.33*fem, 0*fem, 4.33*fem),
                                  height: double.infinity,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // cell7zj (19:19)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5*fem, 0*fem),
                                        width: 17*fem,
                                        height: 10.67*fem,
                                        child: Image.asset(
                                          'assets/page-1/images/cell-iQK.png',
                                          width: 17*fem,
                                          height: 10.67*fem,
                                        ),
                                      ),
                                      Container(
                                        // wifiBUo (19:14)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5*fem, 0.33*fem),
                                        width: 15.33*fem,
                                        height: 11*fem,
                                        child: Image.asset(
                                          'assets/page-1/images/wifi-HrT.png',
                                          width: 15.33*fem,
                                          height: 11*fem,
                                        ),
                                      ),
                                      Container(
                                        // batteryrqq (19:10)
                                        width: 24.33*fem,
                                        height: 11.33*fem,
                                        child: Image.asset(
                                          'assets/page-1/images/battery-Y1R.png',
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
                          // sunx8B (25:118)
                          left: 0*fem,
                          top: 0*fem,
                          child: Align(
                            child: SizedBox(
                              width: 373*fem,
                              height: 413*fem,
                              child: Image.asset(
                                'assets/page-1/images/sun-qJs.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // modeclairqhm (25:153)
                          left: 130*fem,
                          top: 364.5*fem,
                          child: Align(
                            child: SizedBox(
                              width: 112*fem,
                              height: 23*fem,
                              child: Text(
                                'Mode Clair',
                                style: SafeGoogleFont (
                                  'Comfortaa',
                                  fontSize: 20*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.115*ffem/fem,
                                  letterSpacing: -0.3*fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // backgroundJrF (19:48)
              padding: EdgeInsets.fromLTRB(49*fem, 15*fem, 48*fem, 15*fem),
              width: 375*fem,
              height: 83*fem,
              decoration: BoxDecoration (
                color: Color(0xffffffff),
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
                        // autogroupvqzuP71 (6mWtTE5UFwWHGaArrpvqZu)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 83.66*fem, 0*fem),
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              // autogroupsnv97Yo (6mWtYDw9HUREsLtSFUSnV9)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 9*fem),
                              width: 37.34*fem,
                              height: 31*fem,
                              child: Image.asset(
                                'assets/page-1/images/auto-group-snv9.png',
                                width: 37.34*fem,
                                height: 31*fem,
                              ),
                            ),
                            Container(
                              // homeRJb (19:71)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1.34*fem, 0*fem),
                              child: Text(
                                'Home',
                                style: SafeGoogleFont (
                                  'Inter',
                                  fontSize: 10*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2125*ffem/fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // autogroupclwfLAf (6mWtcioecFe6udw46rcLWf)
                        margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 84.13*fem, 0*fem),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // iconcog4cT (19:69)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2.74*fem, 8.96*fem),
                              width: 33*fem,
                              height: 30.04*fem,
                              child: Image.asset(
                                'assets/page-1/images/icon-cog-DdM.png',
                                width: 33*fem,
                                height: 30.04*fem,
                              ),
                            ),
                            Text(
                              // settingsBSB (19:72)
                              'Settings',
                              style: SafeGoogleFont (
                                'Inter',
                                fontSize: 10*ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.2125*ffem/fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // autogroupmt2pvPm (6mWti3z6md1nt4RwBgMt2P)
                        margin: EdgeInsets.fromLTRB(0*fem, 0.48*fem, 0*fem, 0*fem),
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // autogrouphqtrTPh (6mWtnDXpxZmvYhhFLtHqTR)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12.52*fem),
                              width: 32.87*fem,
                              height: 27*fem,
                              child: Image.asset(
                                'assets/page-1/images/auto-group-hqtr.png',
                                width: 32.87*fem,
                                height: 27*fem,
                              ),
                            ),
                            Container(
                              // profileAou (19:73)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.13*fem, 0*fem),
                              child: Text(
                                'Profile',
                                style: SafeGoogleFont (
                                  'Inter',
                                  fontSize: 10*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2125*ffem/fem,
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
          );
  }
}