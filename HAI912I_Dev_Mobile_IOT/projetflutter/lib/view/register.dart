import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Pour SystemUiOverlayStyle

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 52), // Espace après le titre
              Text(
                'Register',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff000000),
                ),
              ),
              SizedBox(height: 52), // Espace après le titre

              // Champ de saisie pour le nom d'utilisateur
              TextField(
                decoration: InputDecoration(
                  labelText: 'User name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 16), // Espace entre les champs de saisie
              // Champ de saisie pour l'adresse e-mail
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email address',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 16), // Espace entre les champs de saisie
              // Champ de saisie pour le mot de passe
              TextField(
                decoration: InputDecoration(
                  labelText: 'Create password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                obscureText: true, // Cacher le texte pour la sécurité du mot de passe
              ),
              SizedBox(height: 65), // Espace avant le bouton
              // Bouton pour continuer
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Logique pour passer à l'écran suivant
                  },
                  child: Text('NEXT'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20), // Ajuster le padding vertical du bouton
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
