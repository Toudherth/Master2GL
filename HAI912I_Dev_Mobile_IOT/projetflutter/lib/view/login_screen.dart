import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projetflutter/models/user.dart';
import 'package:projetflutter/service/registation_service.dart';
import 'package:projetflutter/text_style.dart';
import 'package:projetflutter/view/accueil_screen.dart';


class Login extends StatefulWidget {
  final User? user;
  Login({Key? key, this.user}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: widget.user?.email);
    passwordController = TextEditingController(text: widget.user?.password);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if (widget.user != null) {
      emailController.text = widget.user!.email;
      passwordController.text = widget.user!.password;
    }

    // Utilisation de MediaQuery pour obtenir la largeur de l'appareil
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('Connexion'),
        backgroundColor: CupertinoColors.white,
      ),

      body: SingleChildScrollView( // Ajoutez un SingleChildScrollView
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: screenWidth * 0.1), // Espacement basé sur la largeur de l'écran
              Text(
                'Connexion',
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
                  labelText: 'Address email',
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
                  labelText: 'Mot de passe',
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
                  child: Text('SE CONNECTER'),
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
                          fontSize: 14.0
                      );
                      return;
                    }

                    // Supposons que 'user' est correctement défini ici
                    if (widget.user == null) {
                      User? success = await RegistrationService.signIn(email, password);
                      if (success != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Accueil()),
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

              // Texte "FORGET PASSWORD"
              Center( // Centrer le texte sur l'écran
                child: TextButton(
                  onPressed: () {
                    // TODO: Implémenter la fonctionnalité de mot de passe oublié
                  },
                  child: Text(
                    'MOT DE PASSE OUBLIE',
                    style:  AppTextStyles.globalTextStyle,
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
