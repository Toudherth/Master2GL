import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projetflutter/bloc/location_bloc.dart';
import 'package:projetflutter/section/sous_section_led.dart';
import 'package:projetflutter/section/sous_section_luminosite.dart';
import 'package:projetflutter/section/sous_section_statistique.dart';
import 'package:projetflutter/section/sous_section_temperature.dart';

class Accueil extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Accueil>  with TickerProviderStateMixin {

  final LocationBloc locationBloc = LocationBloc();



 late  AnimationController _animationController;
  late Animation<double> _opacityTemp;
  late Animation<double> _opacityLuminosite;
  late Animation<double> _opacityLED;
  late Animation<double> _opacityStatistique;

  @override
  void initState() {
    super.initState();
    locationBloc.determinePosition();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    // Les animations commencent avec une opacité de 0 et finissent avec une opacité de 1
    _opacityTemp = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _opacityLuminosite = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _opacityLED = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _opacityStatistique = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    locationBloc.dispose();
    super.dispose();
  }


  int _selectedIndex = 0;

  String formattedTime = DateFormat('HH:mm').format(DateTime.now());
  String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());


  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double screenWidth = MediaQuery.of(context).size.width;
    double fem = screenWidth / baseWidth;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/page-1/images2/plan.png'),
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
              leading: CupertinoNavigationBarBackButton(
                onPressed: () => Navigator.of(context).pop(),
                color: Colors.white, // Définit la couleur du bouton sur blanc
              ),

              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StreamBuilder<String>(
                        stream: locationBloc.locationStream,


                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Text(
                              'Chargement de la localisation...',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(color: Colors.white),
                            );
                          } else if (snapshot.hasError) {
                            return Text(
                              'Erreur de localisation',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(color: Colors.white),
                            );
                          } else if (snapshot.hasData) {
                            return Text(
                              '📍 ${snapshot.data}',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(color: Colors.white),
                            );
                          } else {
                            return Text(
                              'Localisation non disponible',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(color: Colors.white),
                            );
                          }
                        }
                    ),


                    SizedBox(height: 20 * fem),
                    Text(
                      formattedTime,
                      style: Theme.of(context).textTheme.headline1?.copyWith(color: Colors.white, fontSize: 40),
                    ),
                    Text(
                      formattedDate,
                      style: Theme.of(context).textTheme.headline3?.copyWith(color: Colors.white, fontSize: 18),
                    ),
                    buildAnimatedSection(SousSectionTemperature(), _opacityTemp),
                    SizedBox(height: screenWidth * 0.01),
                    buildAnimatedSection(SousSectionLuminosite(), _opacityLuminosite),
                    SizedBox(height: screenWidth * 0.01),
                    buildAnimatedSection(SousSectionLED(), _opacityLED),
                    SizedBox(height: screenWidth * 0.01),
                    buildAnimatedSection(SousSectionStatistique(), _opacityStatistique),

                  ],
                ),
              ),
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
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.amber[900],
              unselectedItemColor: Colors.black,
              onTap: _onItemTapped,
            ),





          ),
        ),
      ),
    );
  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.pushNamed(context, '/home');
    }
    if (index == 1) {
      Navigator.pushNamed(context, '/parametre');
    }
    if (index == 2) {
      Navigator.pushNamed(context, '/profile');
    }

  }

  Widget buildAnimatedSection(Widget child, Animation<double> animation) {
    // Cette fonction construit un widget animé qui utilise la valeur de l'animation fournie
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Opacity(
          opacity: animation.value,
          child: child,
        );
      },
      child: child, // Le widget enfant qui doit être animé
    );
  }
}

