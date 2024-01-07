import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
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
        // loggedoutspX (12:287)
        padding: EdgeInsets.fromLTRB(0*fem, 14*fem, 0*fem, 0*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // statusbarycf (12:289)
              margin: EdgeInsets.fromLTRB(35.33*fem, 0*fem, 14.67*fem, 11*fem),
              width: double.infinity,
              height: 19*fem,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // timeh2s (12:307)
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
                    // uiN91 (12:290)
                    margin: EdgeInsets.fromLTRB(0*fem, 3.33*fem, 0*fem, 4.33*fem),
                    height: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // cellVUX (12:300)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5*fem, 0*fem),
                          width: 17*fem,
                          height: 10.67*fem,
                          child: Image.asset(
                            'assets/page-1/images/cell-627.png',
                            width: 17*fem,
                            height: 10.67*fem,
                          ),
                        ),
                        Container(
                          // wifibnT (12:295)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5*fem, 0.33*fem),
                          width: 15.33*fem,
                          height: 11*fem,
                          child: Image.asset(
                            'assets/page-1/images/wifi-L1q.png',
                            width: 15.33*fem,
                            height: 11*fem,
                          ),
                        ),
                        Container(
                          // batteryXAK (12:291)
                          width: 24.33*fem,
                          height: 11.33*fem,
                          child: Image.asset(
                            'assets/page-1/images/battery.png',
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
              // autogroupajwo3PZ (6mWpnFN1eaPm8v67JXaJWo)
              width: double.infinity,
              height: 667*fem,
              child: Stack(
                children: [
                  Positioned(
                    // frame5Ngj (17:130)
                    left: 0*fem,
                    top: 0*fem,
                    child: Container(
                      width: 400*fem,
                      height: 667*fem,
                      child: Stack(
                        children: [
                          Positioned(
                            // pexelsphoto1050021ghR (17:131)
                            left: 0*fem,
                            top: 0*fem,
                            child: Align(
                              child: SizedBox(
                                width: 404*fem,
                                height: 724*fem,
                                child: Image.asset(
                                  'assets/page-1/images/pexels-photo-105002-1-yco.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // frame5Q7d (19:2)
                            left: 0*fem,
                            top: 0*fem,
                            child: Container(
                              width: 392*fem,
                              height: 667*fem,
                              child: Align(
                                // rectangle237Xq (19:4)
                                alignment: Alignment.centerLeft,
                                child: SizedBox(
                                  width: 409*fem,
                                  height: 922.21*fem,
                                  child: Container(
                                    decoration: BoxDecoration (
                                      color: Color(0x386a58da),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // groupqCw (12:317)
                    left: 26*fem,
                    top: 224*fem,
                    child: Container(
                      width: 252.5*fem,
                      height: 114*fem,
                      child: Stack(
                        children: [
                          Positioned(
                            // logoxYT (12:318)
                            left: 127.5*fem,
                            top: 39*fem,
                            child: Center(
                              child: Align(
                                child: SizedBox(
                                  width: 125*fem,
                                  height: 54*fem,
                                  child: Text(
                                    'Logo',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont (
                                      'Comfortaa',
                                      fontSize: 48*ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.115*ffem/fem,
                                      letterSpacing: -0.72*fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // cloudyEks (17:134)
                            left: 0*fem,
                            top: 0*fem,
                            child: Align(
                              child: SizedBox(
                                width: 146*fem,
                                height: 114*fem,
                                child: Image.asset(
                                  'assets/page-1/images/cloudy.png',
                                  fit: BoxFit.contain,
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
            Container(
              // autogroupgqqf979 (6mWqDQJmMABvKbZe6rGqQF)
              padding: EdgeInsets.fromLTRB(16*fem, 16*fem, 16*fem, 8*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroupuqzqsYw (6mWpwF72J8qVDWBM1HuQZq)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 20*fem),
                    width: double.infinity,
                    height: 52*fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // buttonCbD (12:309)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 9*fem, 0*fem),
                          width: 167*fem,
                          height: double.infinity,
                          decoration: BoxDecoration (
                            border: Border.all(color: Color(0xff000000)),
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(6*fem),
                          ),
                          child: Center(
                            child: Center(
                              child: Text(
                                'LOG IN',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont (
                                  'Roboto',
                                  fontSize: 13*ffem,
                                  fontWeight: FontWeight.w900,
                                  height: 1.1725*ffem/fem,
                                  letterSpacing: 0.52*fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          // autogroup89gxdgX (6mWq3Ew2jB8dwEEqUU89GX)
                          width: 167*fem,
                          height: double.infinity,
                          child: Stack(
                            children: [
                              Positioned(
                                // registerP9u (12:308)
                                left: 56.5*fem,
                                top: 1.5*fem,
                                child: Center(
                                  child: Align(
                                    child: SizedBox(
                                      width: 54*fem,
                                      height: 17*fem,
                                      child: Text(
                                        'REGISTER',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont (
                                          'SF Pro Text',
                                          fontSize: 13*ffem,
                                          fontWeight: FontWeight.w700,
                                          height: 1.2575*ffem/fem,
                                          letterSpacing: -0.195*fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // buttonfdD (12:312)
                                left: 0*fem,
                                top: 0*fem,
                                child: Container(
                                  width: 167*fem,
                                  height: 52*fem,
                                  decoration: BoxDecoration (
                                    color: Color(0xff000000),
                                    borderRadius: BorderRadius.circular(6*fem),
                                  ),
                                  child: Center(
                                    child: Center(
                                      child: Text(
                                        'REGISTER',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont (
                                          'Roboto',
                                          fontSize: 13*ffem,
                                          fontWeight: FontWeight.w900,
                                          height: 1.1725*ffem/fem,
                                          letterSpacing: 0.52*fem,
                                          color: Color(0xffffffff),
                                        ),
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
                    // shapeLUT (12:316)
                    margin: EdgeInsets.fromLTRB(104*fem, 0*fem, 104*fem, 0*fem),
                    width: double.infinity,
                    height: 5*fem,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(10*fem),
                      color: Color(0xff000000),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
          );
  }
}