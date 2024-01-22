import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center( // Centre le widget Column dans le Scaffold
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centre verticalement les widgets dans la Column
          crossAxisAlignment: CrossAxisAlignment.center, // Centre horizontalement les widgets dans la Column
          children: <Widget>[
            CircleAvatar(
              radius: 60, // Taille de l'avatar
              backgroundImage: NetworkImage('https://static.wikia.nocookie.net/e4e248f1-4d5e-4b35-96e0-2c9e8363f8fd/scale-to-width/755'), // Insérez l'URL de votre image de profil ici
            ),

            SizedBox(height: 10),
            Text(
              'Jane',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'SAN FRANCISCO, CA',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            // Ajoutez plus de widgets ici pour les autres informations de profil
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
        currentIndex: 2, // Mettez en surbrillance l'icône de profil
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          // Mettez ici votre logique pour naviguer entre les onglets
        },
      ),

    );

  }
}
