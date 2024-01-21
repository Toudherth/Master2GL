import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:projetflutter/bloc/location_bloc.dart';
import 'package:projetflutter/widgets/sous_section_led.dart';
import 'package:projetflutter/widgets/sous_section_luminosite.dart';
import 'package:projetflutter/widgets/sous_section_temperature.dart';

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {

  final LocationBloc locationBloc = LocationBloc();

  @override
  void initState() {
    super.initState();
    locationBloc.determinePosition();
  }

  @override
  void dispose() {
    locationBloc.dispose();
    super.dispose();
  }
  int _selectedIndex = 0;

  String formattedTime = DateFormat('HH:mm').format(DateTime.now());
  String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());

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
                                  .headline3
                                  ?.copyWith(color: Colors.white),
                            );
                          } else if (snapshot.hasError) {
                            return Text(
                              'Erreur de localisation: ${snapshot.error}',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline3
                                  ?.copyWith(color: Colors.white),
                            );
                          } else if (snapshot.hasData) {
                            return Text(
                              '📍 ${snapshot.data}',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline3
                                  ?.copyWith(color: Colors.white),
                            );
                          } else {
                            return Text(
                              'Localisation non disponible',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline3
                                  ?.copyWith(color: Colors.white),
                            );
                          }
                        }
                    ),


                    SizedBox(height: 10 * fem),
                    Text(
                      formattedTime,
                      style: Theme.of(context).textTheme.headline3?.copyWith(color: Colors.white, fontSize: 40),
                    ),
                    Text(
                      formattedDate,
                      style: Theme.of(context).textTheme.headline3?.copyWith(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(height: 30 * fem),
                    SousSectionTemperature(),
                    SizedBox(height: screenWidth * 0.05),
                    SousSectionLuminosite(),
                    SizedBox(height: screenWidth * 0.05),
                    SousSectionLED(),
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
