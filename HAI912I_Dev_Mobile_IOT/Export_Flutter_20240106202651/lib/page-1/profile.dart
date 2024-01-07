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
        // profilejwy (12:188)
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogroup7dm5sYP (6mWgpPoF851W9fWVJR7DM5)
              padding: EdgeInsets.fromLTRB(16*fem, 14*fem, 14.67*fem, 421.5*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // statusbaryrK (12:208)
                    margin: EdgeInsets.fromLTRB(19.33*fem, 0*fem, 0*fem, 27*fem),
                    width: double.infinity,
                    height: 19*fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // timehXR (12:226)
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
                          // ui1HD (12:209)
                          margin: EdgeInsets.fromLTRB(0*fem, 3.33*fem, 0*fem, 4.33*fem),
                          height: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // celljyu (12:219)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5*fem, 0*fem),
                                width: 17*fem,
                                height: 10.67*fem,
                                child: Image.asset(
                                  'assets/page-1/images/cell-t51.png',
                                  width: 17*fem,
                                  height: 10.67*fem,
                                ),
                              ),
                              Container(
                                // wifi4mH (12:214)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5*fem, 0.33*fem),
                                width: 15.33*fem,
                                height: 11*fem,
                                child: Image.asset(
                                  'assets/page-1/images/wifi-Rf9.png',
                                  width: 15.33*fem,
                                  height: 11*fem,
                                ),
                              ),
                              Container(
                                // batteryBqu (12:210)
                                width: 24.33*fem,
                                height: 11.33*fem,
                                child: Image.asset(
                                  'assets/page-1/images/battery-Ufu.png',
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
                    // unionJfd (12:433)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 332.13*fem, 4.65*fem),
                    width: 12.21*fem,
                    height: 11.35*fem,
                    child: Image.asset(
                      'assets/page-1/images/union-ej5.png',
                      width: 12.21*fem,
                      height: 11.35*fem,
                    ),
                  ),
                  Container(
                    // ellipse2Lj (12:190)
                    margin: EdgeInsets.fromLTRB(108*fem, 0*fem, 108.33*fem, 31.5*fem),
                    width: double.infinity,
                    height: 128*fem,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(64*fem),
                      image: DecorationImage (
                        fit: BoxFit.cover,
                        image: AssetImage (
                          'assets/page-1/images/ellipse-bg.png',
                        ),
                      ),
                    ),
                  ),
                  Center(
                    // janeXHV (12:191)
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.33*fem, 15*fem),
                      child: Text(
                        'Jane',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont (
                          'Comfortaa',
                          fontSize: 36*ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.115*ffem/fem,
                          letterSpacing: -0.54*fem,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    // sanfranciscocapnP (12:192)
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1.33*fem, 0*fem),
                      child: Text(
                        'SAN FRANCISCO, CA',
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
                ],
              ),
            ),
            Container(
              // autogroupnsufXB1 (6mWfRmSvRsUhp2UffiNsUF)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 32*fem),
              width: double.infinity,
              height: 621*fem,
              child: Stack(
                children: [
                  Positioned(
                    // rectangle25dzj (12:194)
                    left: 192*fem,
                    top: 401*fem,
                    child: Align(
                      child: SizedBox(
                        width: 167*fem,
                        height: 220*fem,
                        child: Image.asset(
                          'assets/page-1/images/rectangle-25.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // rectangle238wV (12:196)
                    left: 192*fem,
                    top: 82*fem,
                    child: Align(
                      child: SizedBox(
                        width: 167*fem,
                        height: 310*fem,
                        child: Image.asset(
                          'assets/page-1/images/rectangle-23.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // rectangle244KM (12:197)
                    left: 16*fem,
                    top: 311*fem,
                    child: Align(
                      child: SizedBox(
                        width: 167*fem,
                        height: 310*fem,
                        child: Image.asset(
                          'assets/page-1/images/rectangle-24.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // tabbarBum (12:227)
                    left: 0*fem,
                    top: 0*fem,
                    child: Align(
                      child: SizedBox(
                        width: 375*fem,
                        height: 83*fem,
                        child: Image.asset(
                          'assets/page-1/images/tab-bar.png',
                          width: 375*fem,
                          height: 83*fem,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // backgroundht7 (12:261)
                    left: 0*fem,
                    top: 0*fem,
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
                                // autogroupb3n3NUT (6mWfng1kf3u3jek4PHb3n3)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 83.66*fem, 0*fem),
                                height: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      // autogroupyd4f69Z (6mWgBFCUZQd3XXuyZjyD4F)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 9*fem),
                                      width: 37.34*fem,
                                      height: 31*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/auto-group-yd4f.png',
                                        width: 37.34*fem,
                                        height: 31*fem,
                                      ),
                                    ),
                                    Container(
                                      // homeoJs (12:284)
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
                                // autogroup1xqdUA7 (6mWgJQfCxsXkZ3D2xY1Xqd)
                                margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 84.13*fem, 0*fem),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // iconcogB4X (12:282)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2.74*fem, 8.96*fem),
                                      width: 33*fem,
                                      height: 30.04*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/icon-cog-BXR.png',
                                        width: 33*fem,
                                        height: 30.04*fem,
                                      ),
                                    ),
                                    Text(
                                      // settings5vb (12:285)
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
                                // autogroupnfgw1JT (6mWgQVKQgNSasBDMMFnfgw)
                                margin: EdgeInsets.fromLTRB(0*fem, 0.48*fem, 0*fem, 0*fem),
                                height: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // autogroupkdtzXGo (6mWgVQLtRSjrsXz6pMkDTZ)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12.52*fem),
                                      width: 32.87*fem,
                                      height: 27*fem,
                                      child: Image.asset(
                                        'assets/page-1/images/auto-group-kdtz.png',
                                        width: 32.87*fem,
                                        height: 27*fem,
                                      ),
                                    ),
                                    Container(
                                      // profilecJF (12:286)
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
            Container(
              // button4g3 (12:199)
              margin: EdgeInsets.fromLTRB(16*fem, 0*fem, 16*fem, 0*fem),
              width: double.infinity,
              height: 52*fem,
              decoration: BoxDecoration (
                border: Border.all(color: Color(0xff000000)),
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(6*fem),
              ),
              child: Center(
                child: Center(
                  child: Text(
                    'SEE MORE',
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
          ],
        ),
      ),
          );
  }
}