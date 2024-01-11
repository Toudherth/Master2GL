import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'register.dart';
import 'login.dart';


class MyButtonWidget extends StatefulWidget {
  @override
  _MyButtonWidgetState createState() => _MyButtonWidgetState();
}

class _MyButtonWidgetState extends State<MyButtonWidget> {
  double _widthLogin = 150; // Taille initiale pour le bouton LOG IN
  double _heightLogin = 50;
  double _widthRegister = 150; // Taille initiale pour le bouton REGISTER
  double _heightRegister = 50;

  void _animateLoginButton() {
    setState(() {
      _widthLogin = 200; // Nouvelle taille
      _heightLogin = 60;
    });
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        _widthLogin = 150; // Revenir à la taille initiale
        _heightLogin = 50;
      });
    });
  }

  void _animateRegisterButton() {
    setState(() {
      _widthRegister = 200; // Nouvelle taille
      _heightRegister = 60;
    });
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        _widthRegister = 150; // Revenir à la taille initiale
        _heightRegister = 50;
      });
    });
  }


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
                color: Colors.black.withOpacity(0.4),
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
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    height: 50, // Hauteur du bouton
                    child: CupertinoButton(
                      color: Colors.white,
                      child: Text(
                        'LOG IN',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    height: 50, // Hauteur du bouton
                    child: CupertinoButton(
                      color: Colors.black,
                      child: Text(
                        'SIGN IN',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Register()),
                        );
                      },
                      borderRadius: BorderRadius.circular(10),
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
