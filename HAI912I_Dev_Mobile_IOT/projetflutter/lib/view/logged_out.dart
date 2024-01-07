import 'dart:ui';
import 'package:flutter/material.dart';
import 'register.dart';
import 'login.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Image d'arrière-plan avec flou
          Positioned.fill(
            child: Image.asset(
              'assets/page-1/images/pexels-photo-105002-1-9GP.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          // Contenu du centre de l'écran
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo de l'application
                  Image.asset(
                    'assets/page-1/images/cloudy.png', // Remplacez par le chemin de votre logo
                    width: screenWidth * 0.5, // 50% de la largeur de l'écran
                    height: screenWidth * 0.5, // 50% de la largeur de l'écran
                  ),
                  SizedBox(height: 20),
                  // Nom de l'application
                  Text(
                    'Watter Sun', // Remplacez par le nom de votre application
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 100), // Espace supplémentaire avant les boutons
                  // Ajoutez d'autres widgets si nécessaire
                ],
              ),
            ),
          ),
          // Boutons LOG IN et REGISTER



          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: Text(
                      'LOG IN',
                      style: TextStyle(fontSize: 15), // Augmenter la taille du texte du bouton
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      side: BorderSide(color: Colors.black),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15), // Augmenter le padding pour un bouton plus grand
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                    child: Text(
                      'REGISTER',
                      style: TextStyle(fontSize: 15), // Augmenter la taille du texte du bouton
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15), // Augmenter le padding pour un bouton plus grand
                    ),
                  ),
                ),
              ],
            ),
          ),





        ],
      ),
    );
  }
}
