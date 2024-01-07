import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
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
        // frame1z2X (10:67)
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              // autogroup4ggbWFm (6mWhgnWwohDW7SQNpc4gGb)
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // rectangler4j (12:315)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1722*fem, 0*fem),
                    width: 375*fem,
                    height: 707*fem,
                    child: Image.asset(
                      'assets/page-1/images/rectangle.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    // autogroupdomdALK (6mWhp7e4n5MaKmb64VDoMD)
                    margin: EdgeInsets.fromLTRB(0*fem, 122*fem, 0*fem, 0*fem),
                    width: 420*fem,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // statusbarJBd (5:168)
                          margin: EdgeInsets.fromLTRB(63.33*fem, 0*fem, 31.67*fem, 11*fem),
                          width: double.infinity,
                          height: 19*fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // timeRX9 (5:186)
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
                                // ui8RZ (5:169)
                                margin: EdgeInsets.fromLTRB(0*fem, 3.33*fem, 0*fem, 4.33*fem),
                                height: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // cellSh9 (5:179)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5*fem, 0*fem),
                                      width: 17*fem,
                                      height: 10.67*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/cell.png',
                                        width: 17*fem,
                                        height: 10.67*fem,
                                      ),
                                    ),
                                    Container(
                                      // wifiJjM (5:174)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5*fem, 0.33*fem),
                                      width: 15.33*fem,
                                      height: 11*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/wifi-t9q.png',
                                        width: 15.33*fem,
                                        height: 11*fem,
                                      ),
                                    ),
                                    Container(
                                      // battery2fM (5:170)
                                      width: 24.33*fem,
                                      height: 11.33*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/battery-EZq.png',
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
                          // autogroup69abMSj (6mWhucUuWMxdV1yczQ69AB)
                          width: double.infinity,
                          height: 685*fem,
                          child: Stack(
                            children: [
                              Positioned(
                                // frame5uDM (17:58)
                                left: 0*fem,
                                top: 0*fem,
                                child: Container(
                                  width: 420*fem,
                                  height: 685*fem,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        // pexelsphoto1050021DE3 (16:48)
                                        left: 0*fem,
                                        top: 0*fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 400*fem,
                                            height: 676*fem,
                                            child: Image.asset(
                                              'assets/page-1/images/pexels-photo-105002-1-fXZ.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        // rectangle23v8T (17:59)
                                        left: 0*fem,
                                        top: 3.9825439453*fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 443.9*fem,
                                            height: 678.36*fem,
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
                                // frame4E99 (16:49)
                                left: 0*fem,
                                top: 496*fem,
                                child: Container(
                                  width: 374*fem,
                                  height: 189*fem,
                                  decoration: BoxDecoration (
                                    borderRadius: BorderRadius.circular(10*fem),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        // rectangle22WMZ (16:51)
                                        left: 0*fem,
                                        top: 11*fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 374*fem,
                                            height: 229*fem,
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
                                        // chevronupoLf (16:52)
                                        left: 175*fem,
                                        top: 9*fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 21*fem,
                                            height: 42*fem,
                                            child: Image.asset(
                                              'assets/page-1/images/chevron-up-JJw.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        // history7cF (17:57)
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
                                        // sunC7u (17:64)
                                        left: 18*fem,
                                        top: 106*fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 42*fem,
                                            height: 31*fem,
                                            child: Image.asset(
                                              'assets/page-1/images/sun-RMu.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        // sunWeP (17:65)
                                        left: 294*fem,
                                        top: 106*fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 42*fem,
                                            height: 31*fem,
                                            child: Image.asset(
                                              'assets/page-1/images/sun-DBy.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        // sunEqH (17:66)
                                        left: 224*fem,
                                        top: 106*fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 42*fem,
                                            height: 31*fem,
                                            child: Image.asset(
                                              'assets/page-1/images/sun-Sf5.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        // sunmqD (17:67)
                                        left: 154*fem,
                                        top: 106*fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 42*fem,
                                            height: 31*fem,
                                            child: Image.asset(
                                              'assets/page-1/images/sun-EmZ.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        // sunuRd (17:68)
                                        left: 84*fem,
                                        top: 106*fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 42*fem,
                                            height: 31*fem,
                                            child: Image.asset(
                                              'assets/page-1/images/sun-4pb.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        // Cfd (17:69)
                                        left: 29*fem,
                                        top: 151*fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 23*fem,
                                            height: 16*fem,
                                            child: Text(
                                              '30°',
                                              style: SafeGoogleFont (
                                                'Comfortaa',
                                                fontSize: 14*ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.115*ffem/fem,
                                                letterSpacing: -0.21*fem,
                                                color: Color(0xff000000),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        // tHZ (17:70)
                                        left: 236*fem,
                                        top: 151*fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 23*fem,
                                            height: 16*fem,
                                            child: Text(
                                              '30°',
                                              style: SafeGoogleFont (
                                                'Comfortaa',
                                                fontSize: 14*ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.115*ffem/fem,
                                                letterSpacing: -0.21*fem,
                                                color: Color(0xff000000),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        // PVD (17:73)
                                        left: 305*fem,
                                        top: 151*fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 23*fem,
                                            height: 16*fem,
                                            child: Text(
                                              '30°',
                                              style: SafeGoogleFont (
                                                'Comfortaa',
                                                fontSize: 14*ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.115*ffem/fem,
                                                letterSpacing: -0.21*fem,
                                                color: Color(0xff000000),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        // deT (17:71)
                                        left: 165*fem,
                                        top: 151*fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 23*fem,
                                            height: 16*fem,
                                            child: Text(
                                              '30°',
                                              style: SafeGoogleFont (
                                                'Comfortaa',
                                                fontSize: 14*ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.115*ffem/fem,
                                                letterSpacing: -0.21*fem,
                                                color: Color(0xff000000),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        // 8LK (17:72)
                                        left: 93*fem,
                                        top: 151*fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 23*fem,
                                            height: 16*fem,
                                            child: Text(
                                              '30°',
                                              style: SafeGoogleFont (
                                                'Comfortaa',
                                                fontSize: 14*ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.115*ffem/fem,
                                                letterSpacing: -0.21*fem,
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
                                // registerS67 (12:462)
                                left: 11.0405426025*fem,
                                top: 112.5*fem,
                                child: Container(
                                  width: 352.96*fem,
                                  height: 234*fem,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        // montpelliertio (12:463)
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 9.69*fem),
                                          width: double.infinity,
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
                                      Container(
                                        // autogroupricbbNK (6mWiGbsw1zzf14BqdWricb)
                                        margin: EdgeInsets.fromLTRB(31.32*fem, 0*fem, 0*fem, 23.5*fem),
                                        width: double.infinity,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              // vvP (15:22)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 87.64*fem, 0*fem),
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
                                            Container(
                                              // suneLb (17:63)
                                              margin: EdgeInsets.fromLTRB(0*fem, 18.81*fem, 0*fem, 0*fem),
                                              width: 132*fem,
                                              height: 96*fem,
                                              child: Image.asset(
                                                'assets/page-1/images/sun-Y1q.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Center(
                                        // maxminZyM (17:61)
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 9*fem),
                                          width: double.infinity,
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
                                      Center(
                                        // V6K (17:62)
                                        child: Container(
                                          width: double.infinity,
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
                                    ],
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
            Container(
              // backgroundD2K (5:103)
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
                        // autogroupsquvr5H (6mWk1dovEdFhhqp6SXSquV)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 83.66*fem, 0*fem),
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              // autogroupknzqyfh (6mWk73pZgTF5GgFoStknZq)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 9*fem),
                              width: 37.34*fem,
                              height: 31*fem,
                              child: Image.asset(
                                'assets/page-1/images/auto-group-knzq.png',
                                width: 37.34*fem,
                                height: 31*fem,
                              ),
                            ),
                            Container(
                              // hometnf (8:11)
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
                        // autogroupjkpfD4F (6mWkCo9zG7hBDAUp9SJKpf)
                        margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 84.13*fem, 0*fem),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // iconcogwkw (8:10)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2.74*fem, 8.96*fem),
                              width: 33*fem,
                              height: 30.04*fem,
                              child: Image.asset(
                                'assets/page-1/images/icon-cog.png',
                                width: 33*fem,
                                height: 30.04*fem,
                              ),
                            ),
                            Text(
                              // settingsTDV (8:12)
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
                        // autogroupcgv1zDR (6mWkJDAdhwgYmzvX9ocGV1)
                        margin: EdgeInsets.fromLTRB(0*fem, 0.48*fem, 0*fem, 0*fem),
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // autogroupf2dhKmV (6mWkNYNkTog3dU5VA6f2DH)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12.52*fem),
                              width: 32.87*fem,
                              height: 27*fem,
                              child: Image.asset(
                                'assets/page-1/images/auto-group-f2dh.png',
                                width: 32.87*fem,
                                height: 27*fem,
                              ),
                            ),
                            Container(
                              // profile1uD (8:13)
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