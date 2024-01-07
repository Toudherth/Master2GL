import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:projetflutter/view/temperature.dart';

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
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


                Padding(
                  padding: EdgeInsets.only(

                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Montpellier',
                        style: Theme.of(context).textTheme.headline3?.copyWith(color: Colors.white),
                      ),
                      SizedBox(height: 10 * fem),
                      Expanded(
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '22:30',
                                style: Theme.of(context).textTheme.headline3?.copyWith(color: Colors.white, fontSize: 40),
                              ),

                              Text(
                                  '01/01/2024',
                                style: Theme.of(context).textTheme.headline3?.copyWith(color: Colors.white, fontSize: 18),
                              ),

                              SizedBox(height: 30 * fem), // Ajustez cet espace selon vos besoins


                              /** Etape 1 */
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Temperature()), // Remplacer par votre page de destination
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
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Max | Min',
                                            style: TextStyle(
                                              fontSize: 16 * fem,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                          SizedBox(height: 4 * fem), // Ajustez cet espace selon vos besoins
                                          Text(
                                            '24° | 12°',
                                            style: TextStyle(
                                              fontSize: 16 * fem,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'TEMPERATURE',
                                            style: TextStyle(
                                              fontSize: 14 * fem,
                                              fontWeight: FontWeight.w900,
                                              color: Color(0xff736f6f),
                                            ),
                                          ),
                                          SizedBox(height: 8 * fem), // Ajustez cet espace selon vos besoins
                                          Image.asset(
                                            'assets/page-1/images/sun-rn7.png',
                                            width: 35 * fem,
                                            height: 40 * fem,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '30°C',
                                        style: TextStyle(
                                          fontSize: 30 * fem,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ],
                                  ),

                                ),
                              ),


                              SizedBox(height: screenWidth * 0.05),

                              /** Etape 2 */

                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Temperature()), // Remplacer par votre page de destination
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
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Luminosité',
                                            style: TextStyle(
                                              fontSize: 16 * fem,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                          SizedBox(height: 4 * fem), // Ajustez cet espace selon vos besoins
                                          Row(
                                            children: [
                                              Image.asset(
                                                'assets/page-1/images/moon-symbol.png',// Remplacez avec le chemin vers votre icône de lune
                                                width: 20 * fem, // Ajustez la taille selon vos besoins
                                                height: 20 * fem,
                                              ),
                                              SizedBox(width: 4 * fem),
                                              Image.asset(
                                                'assets/page-1/images/sun-fj1.png',// Remplacez avec le chemin vers votre icône de soleil
                                                width: 20 * fem, // Ajustez la taille selon vos besoins
                                                height: 20 * fem,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),

                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Lumière',
                                            style: TextStyle(
                                              fontSize: 14 * fem,
                                              fontWeight: FontWeight.w900,
                                              color: Color(0xff736f6f),
                                            ),
                                          ),
                                          SizedBox(height: 8 * fem), // Ajustez cet espace selon vos besoins
                                          Row(
                                            children: [
                                              Icon(Icons.lightbulb_outline, size: 20 * fem), // Icone de la lumière
                                              SizedBox(width: 4 * fem),
                                              Text(
                                                '80%', // Pourcentage de luminosité
                                                style: TextStyle(
                                                  fontSize: 14 * fem,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),
                                ),
                              ),



                              SizedBox(height: screenWidth * 0.05),


                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Temperature()), // Remplacer par votre page de destination
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
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Max | Min',
                                            style: TextStyle(
                                              fontSize: 16 * fem,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                          SizedBox(height: 4 * fem), // Ajustez cet espace selon vos besoins
                                          Text(
                                            '24° | 12°',
                                            style: TextStyle(
                                              fontSize: 16 * fem,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'TEMPERATURE',
                                            style: TextStyle(
                                              fontSize: 14 * fem,
                                              fontWeight: FontWeight.w900,
                                              color: Color(0xff736f6f),
                                            ),
                                          ),
                                          SizedBox(height: 8 * fem), // Ajustez cet espace selon vos besoins
                                          Image.asset(
                                            'assets/page-1/images/sun-rn7.png',
                                            width: 35 * fem,
                                            height: 40 * fem,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '30°C',
                                        style: TextStyle(
                                          fontSize: 30 * fem,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(height: screenWidth * 0.05),

                              /** Etape 4 */

                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Temperature()), // Remplacer par votre page de destination
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
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Max | Min',
                                            style: TextStyle(
                                              fontSize: 16 * fem,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                          SizedBox(height: 4 * fem), // Ajustez cet espace selon vos besoins
                                          Text(
                                            '24° | 12°',
                                            style: TextStyle(
                                              fontSize: 16 * fem,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'TEMPERATURE',
                                            style: TextStyle(
                                              fontSize: 14 * fem,
                                              fontWeight: FontWeight.w900,
                                              color: Color(0xff736f6f),
                                            ),
                                          ),
                                          SizedBox(height: 8 * fem), // Ajustez cet espace selon vos besoins
                                          Image.asset(
                                            'assets/page-1/images/sun-rn7.png',
                                            width: 35 * fem,
                                            height: 40 * fem,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '30°C',
                                        style: TextStyle(
                                          fontSize: 30 * fem,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ],
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
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
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
              currentIndex: _selectedIndex, // No item is selected
              selectedItemColor: Colors.amber[800],
              unselectedItemColor: Colors.black,
              onTap: _onItemTapped,
            ),


          ),
        ),
      ),
    );
  }
}
