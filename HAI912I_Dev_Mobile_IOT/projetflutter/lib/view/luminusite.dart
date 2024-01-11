import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:projetflutter/bloc/location_bloc.dart';
import 'package:projetflutter/widgets/sous_section_sombre.dart';


class Lumenusite extends StatefulWidget {
  @override
  _LumenusiteState createState() => _LumenusiteState();
}

class _LumenusiteState extends State<Lumenusite> {
  int _selectedIndex = 0;

  final LocationBloc locationBloc = LocationBloc(); // Création de l'instance de LocationBloc

  @override
  void initState() {
    super.initState();
    locationBloc.determinePosition(); // Obtenez la position dès l'initialisation
  }

  @override
  void dispose() {
    locationBloc.dispose(); // Disposez du bloc pour éviter les fuites de mémoire
    super.dispose();
  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              child: Column(
                children: [
                //  HeaderSection(),
                 /// ListeSection(),
                  // Ajoutez d'autres sections si nécessaire


                  /** la logique de luminusité*/
                  /***
                   *  uon va utiliser une boucle for pour deduire si le parametre de luminusité est grand ou pas et on va definir un sueil sur quoi ion decide si on est dans le sombre ou dans le claire
                   * */

                  Center( // Centrer le texte sur l'écran
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SousSectionSombre()),
                        );
                        // TODO: Implémenter la fonctionnalité de mot de passe oublié
                      },
                      child: Text(
                        'FORGET PASSWORD',
                        style: TextStyle(
                          color: Colors.black, // Couleur du texte
                          fontWeight: FontWeight.bold, // Gras
                        ),
                      ),
                    ),
                  ),



                ],
              ),
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
