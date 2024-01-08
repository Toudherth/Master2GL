import 'package:flutter/material.dart';
import 'dart:ui';

class Temperature extends StatefulWidget {
  @override
  _TemperatureState createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {

    double baseWidth = 375;
    double screenWidth = MediaQuery.of(context).size.width;
    double fem = screenWidth / baseWidth;


    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/page-1/images/pexels-photo-105002-1-9GP.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          color: Colors.black.withOpacity(0.3),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),

            body: Stack(
              children: [
                // Background image
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/page-1/images/pexels-photo-105002-1-9GP.png'), // Update with your image path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Blurred overlay
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(

                  ),
                ),
                // Content
                SafeArea(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 50),
                            Text(
                              'Montpellier',
                              style: Theme.of(context).textTheme.headline3?.copyWith(color: Colors.white),
                            ),
                            SizedBox(height: 30),
                            Text(
                              '30°',
                              style: Theme.of(context).textTheme.headline1?.copyWith(color: Colors.white),
                            ),
                            SizedBox(height: 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Min | Max',
                                      style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
                                    ),
                                    Text(
                                      '12° | 24°',
                                      style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
                                    ),
                                  ],
                                ),
                                Image.asset(
                                  'assets/page-1/images/sun-Y1q.png',
                                  width: 100,
                                  height: 100,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Positioned history card 1

                      // Interface spécifique positionnée en bas
                      Positioned(
                        bottom: 0, // Positionner en bas
                        left: 0,
                        right: 0,
                        child: Container(
                          width: double.infinity,
                          height: 270,
                          decoration: BoxDecoration(
                            color: Color(0xFFDCD7D7), // Changez la couleur selon vos besoins
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(80),
                              topRight: Radius.circular(80),
                            ),
                          ),
                          // ... Le contenu de votre 'frame4' ...
                        ),

                      ),
                    ],
                  ),


                ),
              ],
            ),

            bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.amber[800],
              onTap: _onItemTapped,
            ),



          ),
        ),
      ),
    );
  }
}


