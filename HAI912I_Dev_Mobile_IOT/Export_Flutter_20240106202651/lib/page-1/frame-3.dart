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
        // frame387D (11:128)
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              // r13jy (17:75)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 244*fem, 0*fem),
              width: 375*fem,
              height: 812*fem,
              decoration: BoxDecoration (
                color: Color(0xffffffff),
              ),
            ),
            Container(
              // autogroupfchhmfy (6mWkhs9tJGQRHFPBLLFchH)
              width: 408*fem,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // statusbarWdZ (11:169)
                    margin: EdgeInsets.fromLTRB(56.33*fem, 0*fem, 26.67*fem, 8*fem),
                    width: double.infinity,
                    height: 19*fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // time2ro (11:187)
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
                          // uiXYf (11:170)
                          margin: EdgeInsets.fromLTRB(0*fem, 3.33*fem, 0*fem, 4.33*fem),
                          height: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // cellraw (11:180)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5*fem, 0*fem),
                                width: 17*fem,
                                height: 10.67*fem,
                                child: Image.asset(
                                  'assets/page-1/images/cell-Qf5.png',
                                  width: 17*fem,
                                  height: 10.67*fem,
                                ),
                              ),
                              Container(
                                // wifiA5q (11:175)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5*fem, 0.33*fem),
                                width: 15.33*fem,
                                height: 11*fem,
                                child: Image.asset(
                                  'assets/page-1/images/wifi-yc7.png',
                                  width: 15.33*fem,
                                  height: 11*fem,
                                ),
                              ),
                              Container(
                                // batteryg4B (11:171)
                                width: 24.33*fem,
                                height: 11.33*fem,
                                child: Image.asset(
                                  'assets/page-1/images/battery-S59.png',
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
                    // autogroupsl7vcCj (6mWkqwkkpn5dqJ5Kt7SL7V)
                    width: double.infinity,
                    height: 771*fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // frame6Ys5 (18:135)
                          left: 0*fem,
                          top: 0*fem,
                          child: Container(
                            width: 408*fem,
                            height: 526*fem,
                            child: Stack(
                              children: [
                                Positioned(
                                  // pexelsphoto1050021HJs (18:136)
                                  left: 0*fem,
                                  top: 0*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 400*fem,
                                      height: 676*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/pexels-photo-105002-1.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // rectangle23zj5 (18:137)
                                  left: 0*fem,
                                  top: 3.0581359863*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 431.22*fem,
                                      height: 520.9*fem,
                                      child: Container(
                                        decoration: BoxDecoration (
                                          color: Color(0x386a58da),
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
                          // frame6h7h (17:96)
                          left: 5.0405426025*fem,
                          top: 23.5*fem,
                          child: Container(
                            width: 359.96*fem,
                            height: 91.65*fem,
                            child: Stack(
                              children: [
                                Positioned(
                                  // registerzcb (17:124)
                                  left: 0*fem,
                                  top: 0*fem,
                                  child: Container(
                                    width: 359.96*fem,
                                    height: 82.11*fem,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          // autogroupzrud7SK (6mWm1MejtdbmswthCbZRud)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 44.96*fem, 0*fem),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Center(
                                                // montpelliereh9 (17:125)
                                                child: Container(
                                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 9.86*fem),
                                                  child: Text(
                                                    'Montpellier',
                                                    textAlign: TextAlign.center,
                                                    style: SafeGoogleFont (
                                                      'Comfortaa',
                                                      fontSize: 36*ffem,
                                                      fontWeight: FontWeight.w700,
                                                      height: 1.115*ffem/fem,
                                                      letterSpacing: -0.54*fem,
                                                      color: Color(0xff000000),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Center(
                                                // maxminY1q (20:4)
                                                child: Container(
                                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 29.43*fem, 0*fem),
                                                  child: Text(
                                                    'Max  | Min ',
                                                    textAlign: TextAlign.center,
                                                    style: SafeGoogleFont (
                                                      'Comfortaa',
                                                      fontSize: 16*ffem,
                                                      fontWeight: FontWeight.w700,
                                                      height: 1.115*ffem/fem,
                                                      letterSpacing: -0.24*fem,
                                                      color: Color(0xff000000),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          // RbR (17:126)
                                          margin: EdgeInsets.fromLTRB(0*fem, 10.11*fem, 0*fem, 0*fem),
                                          child: Text(
                                            '30°',
                                            style: SafeGoogleFont (
                                              'Comfortaa',
                                              fontSize: 64*ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.115*ffem/fem,
                                              letterSpacing: -0.96*fem,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // YAF (20:5)
                                  left: 57.2829742432*fem,
                                  top: 73.6511363983*fem,
                                  child: Center(
                                    child: Align(
                                      child: SizedBox(
                                        width: 73*fem,
                                        height: 18*fem,
                                        child: Text(
                                          '24°  |  12°',
                                          textAlign: TextAlign.center,
                                          style: SafeGoogleFont (
                                            'Comfortaa',
                                            fontSize: 16*ffem,
                                            fontWeight: FontWeight.w700,
                                            height: 1.115*ffem/fem,
                                            letterSpacing: -0.24*fem,
                                            color: Color(0xff000000),
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
                          // frame6DnB (17:80)
                          left: 0*fem,
                          top: 118*fem,
                          child: Container(
                            width: 373*fem,
                            height: 611*fem,
                            child: Stack(
                              children: [
                                Positioned(
                                  // rectangle237sZ (20:2)
                                  left: 0*fem,
                                  top: 11*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 374*fem,
                                      height: 616*fem,
                                      child: Container(
                                        decoration: BoxDecoration (
                                          borderRadius: BorderRadius.circular(40*fem),
                                          color: Color(0xffffffff),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // chevronupS99 (17:83)
                                  left: 174.971455574*fem,
                                  top: 8.9857367422*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 21.06*fem,
                                      height: 42.03*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/chevron-up.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // backgroundw5u (20:3)
                                  left: 0*fem,
                                  top: 88*fem,
                                  child: ClipRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur (
                                        sigmaX: 13.5914087296*fem,
                                        sigmaY: 13.5914087296*fem,
                                      ),
                                      child: Align(
                                        child: SizedBox(
                                          width: 375*fem,
                                          height: 83*fem,
                                          child: Container(
                                            decoration: BoxDecoration (
                                              color: Color(0xffffffff),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // historyRmm (17:85)
                                  left: 18.5*fem,
                                  top: 51*fem,
                                  child: Center(
                                    child: Align(
                                      child: SizedBox(
                                        width: 75*fem,
                                        height: 23*fem,
                                        child: Text(
                                          'History',
                                          textAlign: TextAlign.center,
                                          style: SafeGoogleFont (
                                            'Comfortaa',
                                            fontSize: 20*ffem,
                                            fontWeight: FontWeight.w700,
                                            height: 1.115*ffem/fem,
                                            letterSpacing: -0.3*fem,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // suniks (17:86)
                                  left: 122*fem,
                                  top: 179*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 42*fem,
                                      height: 31*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/sun-V39.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // sundN3 (17:87)
                                  left: 122*fem,
                                  top: 333*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 42*fem,
                                      height: 31*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/sun-TQP.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // sun9rB (17:88)
                                  left: 122*fem,
                                  top: 282*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 42*fem,
                                      height: 31*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/sun-7Yo.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // suntHy (17:89)
                                  left: 122*fem,
                                  top: 232*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 42*fem,
                                      height: 31*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/sun-Cts.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // sun1Nb (17:90)
                                  left: 122*fem,
                                  top: 128*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 42*fem,
                                      height: 31*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/sun-pd1.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // w1M (17:91)
                                  left: 41.6649169922*fem,
                                  top: 136.2581748962*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 32*fem,
                                      height: 23*fem,
                                      child: Text(
                                        '30°',
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
                                Positioned(
                                  // LpB (17:99)
                                  left: 42.6568603516*fem,
                                  top: 186.1764717102*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 32*fem,
                                      height: 23*fem,
                                      child: Text(
                                        '30°',
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
                                Positioned(
                                  // ScK (17:100)
                                  left: 41.6649169922*fem,
                                  top: 236.0947761536*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 32*fem,
                                      height: 23*fem,
                                      child: Text(
                                        '30°',
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
                                Positioned(
                                  // YQT (17:101)
                                  left: 41.6649169922*fem,
                                  top: 288.0097999573*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 32*fem,
                                      height: 23*fem,
                                      child: Text(
                                        '30°',
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
                                Positioned(
                                  // 47u (17:102)
                                  left: 41.6649169922*fem,
                                  top: 343.9183082581*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 32*fem,
                                      height: 23*fem,
                                      child: Text(
                                        '30°',
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
                                Positioned(
                                  // 9v3 (17:103)
                                  left: 223.2048339844*fem,
                                  top: 138.2589931488*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 115*fem,
                                      height: 18*fem,
                                      child: Text(
                                        '30°               12°',
                                        style: SafeGoogleFont (
                                          'Comfortaa',
                                          fontSize: 16*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.115*ffem/fem,
                                          letterSpacing: -0.24*fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // Tvj (17:104)
                                  left: 223.2048339844*fem,
                                  top: 185.1821956635*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 115*fem,
                                      height: 18*fem,
                                      child: Text(
                                        '30°               12°',
                                        style: SafeGoogleFont (
                                          'Comfortaa',
                                          fontSize: 16*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.115*ffem/fem,
                                          letterSpacing: -0.24*fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // aEf (17:105)
                                  left: 223.2048339844*fem,
                                  top: 240.0923213959*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 115*fem,
                                      height: 18*fem,
                                      child: Text(
                                        '30°               12°',
                                        style: SafeGoogleFont (
                                          'Comfortaa',
                                          fontSize: 16*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.115*ffem/fem,
                                          letterSpacing: -0.24*fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // gHh (17:106)
                                  left: 223.2048339844*fem,
                                  top: 296.9991817474*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 115*fem,
                                      height: 18*fem,
                                      child: Text(
                                        '30°               12°',
                                        style: SafeGoogleFont (
                                          'Comfortaa',
                                          fontSize: 16*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.115*ffem/fem,
                                          letterSpacing: -0.24*fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // z3V (17:107)
                                  left: 223.2048339844*fem,
                                  top: 346.9174861908*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 115*fem,
                                      height: 18*fem,
                                      child: Text(
                                        '30°               12°',
                                        style: SafeGoogleFont (
                                          'Comfortaa',
                                          fontSize: 16*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.115*ffem/fem,
                                          letterSpacing: -0.24*fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // sunHoH (17:109)
                                  left: 122*fem,
                                  top: 430*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 42*fem,
                                      height: 31*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/sun-MCf.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // sunQd1 (17:110)
                                  left: 122*fem,
                                  top: 585*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 42*fem,
                                      height: 31*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/sun.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // sun8ou (17:111)
                                  left: 122*fem,
                                  top: 533*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 42*fem,
                                      height: 31*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/sun-znX.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // sunGQK (17:112)
                                  left: 122*fem,
                                  top: 483*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 42*fem,
                                      height: 31*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/sun-xt3.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // sunPjq (17:113)
                                  left: 122*fem,
                                  top: 379*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 42*fem,
                                      height: 31*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/sun-qX1.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // L9H (17:114)
                                  left: 41.6649169922*fem,
                                  top: 386.8480262756*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 32*fem,
                                      height: 23*fem,
                                      child: Text(
                                        '30°',
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
                                Positioned(
                                  // 2no (17:115)
                                  left: 42.6568603516*fem,
                                  top: 436.766330719*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 32*fem,
                                      height: 23*fem,
                                      child: Text(
                                        '30°',
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
                                Positioned(
                                  // 8aw (17:116)
                                  left: 41.6649169922*fem,
                                  top: 486.6846351624*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 32*fem,
                                      height: 23*fem,
                                      child: Text(
                                        '30°',
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
                                Positioned(
                                  // dXh (17:117)
                                  left: 41.6649169922*fem,
                                  top: 538.5996437073*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 32*fem,
                                      height: 23*fem,
                                      child: Text(
                                        '30°',
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
                                Positioned(
                                  // kMR (17:118)
                                  left: 41.6649169922*fem,
                                  top: 594.5081520081*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 32*fem,
                                      height: 23*fem,
                                      child: Text(
                                        '30°',
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
                                Positioned(
                                  // 35d (17:119)
                                  left: 223.2048339844*fem,
                                  top: 386.852148056*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 115*fem,
                                      height: 18*fem,
                                      child: Text(
                                        '30°               12°',
                                        style: SafeGoogleFont (
                                          'Comfortaa',
                                          fontSize: 16*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.115*ffem/fem,
                                          letterSpacing: -0.24*fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // 875 (17:120)
                                  left: 223.2048339844*fem,
                                  top: 433.7753353119*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 115*fem,
                                      height: 18*fem,
                                      child: Text(
                                        '30°               12°',
                                        style: SafeGoogleFont (
                                          'Comfortaa',
                                          fontSize: 16*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.115*ffem/fem,
                                          letterSpacing: -0.24*fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // v2w (17:121)
                                  left: 223.2048339844*fem,
                                  top: 491.6805477142*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 115*fem,
                                      height: 18*fem,
                                      child: Text(
                                        '30°               12°',
                                        style: SafeGoogleFont (
                                          'Comfortaa',
                                          fontSize: 16*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.115*ffem/fem,
                                          letterSpacing: -0.24*fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // bum (17:122)
                                  left: 223.2048339844*fem,
                                  top: 546.5907344818*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 115*fem,
                                      height: 18*fem,
                                      child: Text(
                                        '30°               12°',
                                        style: SafeGoogleFont (
                                          'Comfortaa',
                                          fontSize: 16*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.115*ffem/fem,
                                          letterSpacing: -0.24*fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // WG3 (17:123)
                                  left: 223.2048339844*fem,
                                  top: 595.5105953217*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 115*fem,
                                      height: 18*fem,
                                      child: Text(
                                        '30°               12°',
                                        style: SafeGoogleFont (
                                          'Comfortaa',
                                          fontSize: 16*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.115*ffem/fem,
                                          letterSpacing: -0.24*fem,
                                          color: Color(0xff000000),
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
                          // backgroundoW3 (11:131)
                          left: 0*fem,
                          top: 688*fem,
                          child: Container(
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
                                      // autogroupgshmsuD (6mWmvFJH62GFe79NR7GsHm)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 83.66*fem, 0*fem),
                                      height: double.infinity,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            // autogrouphcfmoXy (6mWn1pyK6mUzPmUjGZhcFM)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 9*fem),
                                            width: 37.34*fem,
                                            height: 31*fem,
                                            child: Image.asset(
                                              'assets/page-1/images/auto-group-hcfm.png',
                                              width: 37.34*fem,
                                              height: 31*fem,
                                            ),
                                          ),
                                          Container(
                                            // homeKFR (11:154)
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
                                      // autogroupzx4kqDm (6mWn7Kp9q463Z1sGCUZx4K)
                                      margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 84.13*fem, 0*fem),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // iconcogxpB (11:152)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2.74*fem, 8.96*fem),
                                            width: 33*fem,
                                            height: 30.04*fem,
                                            child: Image.asset(
                                              'assets/page-1/images/icon-cog-6af.png',
                                              width: 33*fem,
                                              height: 30.04*fem,
                                            ),
                                          ),
                                          Text(
                                            // settingssgF (11:155)
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
                                      // autogroupz6ax1XZ (6mWnCzKP8FvTu69SyUZ6AX)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0.48*fem, 0*fem, 0*fem),
                                      height: double.infinity,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // autogroupbqp1wRD (6mWnJ9qSii4nggkgDDBqP1)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12.52*fem),
                                            width: 32.87*fem,
                                            height: 27*fem,
                                            child: Image.asset(
                                              'assets/page-1/images/auto-group-bqp1.png',
                                              width: 32.87*fem,
                                              height: 27*fem,
                                            ),
                                          ),
                                          Container(
                                            // profileFRu (11:156)
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
                        ),
                      ],
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