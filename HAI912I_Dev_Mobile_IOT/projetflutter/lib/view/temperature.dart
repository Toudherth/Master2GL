import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:projetflutter/widgets/header_section.dart';
import 'package:projetflutter/widgets/liste.dart';


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
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/page-1/images/pexels-photo-105002-1-9GP.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                HeaderSection(),
                ListeSection(), // Assurez-vous que cette section a un contenu scrollable
                // Ajoutez d'autres sections si nécessaire
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
    );
  }
}

/*
void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });

  switch (index) {
    case 0:
    // Code pour revenir à la page d'accueil (Home)
      Navigator.of(context).popUntil((route) => route.isFirst);
      break;
    case 1:
    // Code pour naviguer vers la page de paramètres (Settings)
      Navigator.of(context).pushNamed('/settings');
      break;
    case 2:
    // Code pour naviguer vers la page de profil (Profile)
      Navigator.of(context).pushNamed('/profile');
      break;
  }
}

*/

