import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projetflutter/models/user.dart';
import 'package:projetflutter/service/registation_log_service.dart';
import 'package:projetflutter/view/discover.dart';


class Login extends StatelessWidget {
  final User? user; // Remove the late keyword if user can be null

  // Add a constructor that accepts a User object
  Login({Key? key, this.user}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    // data base
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    if(user != null ){
      emailController.text= user!.email;
      passwordController.text=user!.password;
    }
    // Utilisation de MediaQuery pour obtenir la largeur de l'appareil
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CupertinoNavigationBar(
        leading: CupertinoNavigationBarBackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        middle: Text('Login'),
        backgroundColor: CupertinoColors.white,
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
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email address',
                prefixIcon: Icon(CupertinoIcons.mail_solid),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16), // Espace entre les champs de saisie
            // Champ de saisie pour le mot de passe
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(CupertinoIcons.lock_circle_fill),
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
              height: 60.0, // Hauteur du bouton
              child: CupertinoButton(
                child: Text('Log in'),
                color: Colors.black,

                onPressed: () async {
                  final email = emailController.value.text;
                  final password = passwordController.value.text;

                  if (email.isEmpty || password.isEmpty) {
                    Fluttertoast.showToast(
                        msg: "Remplissez les champs",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        backgroundColor: Colors.grey,
                        textColor: Colors.black,
                        fontSize: 16.0
                    );
                    return;
                  }

                  // Supposons que 'user' est correctement défini ici
                  if (user == null) {
                    User? success = await RegistrationService.signIn(email, password);
                    if (success != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Discover()),
                      );
                    } else {
                      Fluttertoast.showToast(
                          msg: "Utilisateur introuvable ou mot de passe incorrect",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          backgroundColor: Colors.grey,
                          textColor: Colors.black,
                          fontSize: 16.0
                      );
                    }
                  }
                },


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
