import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projetflutter/view/discover.dart';


class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Utilisation de MediaQuery pour obtenir la largeur de l'appareil
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 10), // Ajustez le padding gauche si nécessaire
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop(); // Action pour retourner en arrière
            },
          ),
        ),
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.dark, // Icônes de barre de statut foncées
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // 5% de padding horizontal
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenWidth * 0.1), // Espacement basé sur la largeur de l'écran
            Text(
              'Log in',
              style: TextStyle(
                fontSize: screenWidth * 0.08, // Taille de police dynamique basée sur la largeur de l'écran
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: screenWidth * 0.1),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email address',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: screenWidth * 0.05),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 65), // Espace avant le bouton
            // Bouton pour continuer
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Naviguer vers l'interface Register lorsque le bouton est pressé
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Discover()),
                  );
                  // Logique de connexion
                },
                child: Text('Log in'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  onPrimary: Colors.white,
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20), // Ajuster le padding vertical du bouton
                ),
              ),
            ),

        //Spacer(), // Utilisez Spacer pour pousser le bouton vers le bas
            Center( // Centrer le texte sur l'écran
              child: TextButton(
                onPressed: () {
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
    );
  }
}
