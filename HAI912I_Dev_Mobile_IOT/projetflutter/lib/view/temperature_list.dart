import 'package:flutter/material.dart';
import 'dart:ui';

class TemperatureList extends StatefulWidget {
  @override
  _TemperatureListState createState() => _TemperatureListState();
}

class _TemperatureListState extends State<TemperatureList> {
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
          color: Colors.black.withOpacity(0.4),
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

                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          width: double.infinity,
                          height: 270,
                          decoration: BoxDecoration(
                            color: Color(0xFFDCD7D7),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(80),
                              topRight: Radius.circular(80),
                            ),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 16),
                              Center(
                                child: Icon(
                                  Icons.keyboard_arrow_up,
                                  color: Colors.black,
                                  size: 34,
                                ),
                              ),
                              SizedBox(height: 16),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 24),
                                  child: Text(
                                    'History',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              Expanded(
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5, // Le nombre d'éléments dans la liste
                                  itemBuilder: (BuildContext context, int index) {
                                    return Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            '30°',
                                            style: TextStyle(
                                              // Utilisez le style que vous préférez ici
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                          SizedBox(width: 8), // Espace entre le texte et l'icône
                                          Image.asset(
                                            'assets/page-1/images/sun-Y1q.png',
                                            fit: BoxFit.cover,
                                            width: 50, // La taille de l'image
                                            height: 50,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
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
