import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projetflutter/text_style.dart';
import 'register_screen.dart';
import 'login_screen.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
              'assets/page-1/images2/plan.png',
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
                    'Water Sun', // Remplacez par le nom de votre application
                    style: AppTextStyles.titleStylesun(screenWidth),
                  ),
                  SizedBox(height: 100), // Espace supplémentaire avant les boutons
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
                        'CONNECTER',
                        style: AppTextStyles.basicTextStyle,
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
                    //height: 50,
                    width: _widthRegister,
                    height: _heightRegister,// Hauteur du bouton
                    child: CupertinoButton(
                      color: Colors.white,
                      child: Text(
                        'REGISTRER',
                        style: AppTextStyles.basicTextStyle,
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
