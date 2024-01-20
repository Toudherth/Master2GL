import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projetflutter/models/user.dart';
import 'package:projetflutter/service/registation_log_service.dart';
import 'package:projetflutter/view/discover.dart';

// Le StatefulWidget
class Register extends StatefulWidget {
  final User? user; // Conserver le même constructeur pour passer l'objet User

  Register({Key? key, this.user}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

// La classe State correspondante
class _RegisterState extends State<Register> {
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    // Initialisation des contrôleurs avec les données de l'utilisateur si elles existent
    usernameController = TextEditingController(text: widget.user?.username);
    emailController = TextEditingController(text: widget.user?.email);
    passwordController = TextEditingController(text: widget.user?.password);
  }

  @override
  void dispose() {
    // N'oubliez pas de nettoyer les contrôleurs lorsque le State est détruit
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CupertinoNavigationBar(
        leading: CupertinoNavigationBarBackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        middle: Text('Register'),
        backgroundColor: CupertinoColors.white,
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
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'User name' ,
                  prefixIcon: Icon(CupertinoIcons.person_alt_circle_fill),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 16), // Espace entre les champs de saisie
              // Champ de saisie pour l'adresse e-mail
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
              ),
              SizedBox(height: 16), // Espace entre les champs de saisie
              // Champ de saisie pour le mot de passe
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Create password',
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
                  child: Text('NEXT'),
                  color: Colors.black,

                    onPressed: () async{
                      final username = usernameController.value.text;
                      final email = emailController.value.text;
                      final password = passwordController.value.text;

                      if(username.isEmpty || email.isEmpty || password.isEmpty){

                        Fluttertoast.showToast(
                            msg: "Remplissez les champs",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                        return;  // Assurez-vous que cette ligne est à l'intérieur du bloc if
                      }

                      final User model = User(username: username, email: email, password: password, id: widget.user?.id);


                      if(widget.user == null){
                        // bool success = await RegistrationService.addUser(model);

                        int rowsAffected = await RegistrationService.addUser(model);
                        bool success = rowsAffected > 0;
                        if(success){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Discover()),
                          );
                        }
                      } else {
                        Fluttertoast.showToast(
                            msg: "Ceci est un toast",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );

                      }
                      // Logique pour passer à l'écran suivant
                    },
                ),
              ),



            ],
          ),
        ),
      ),
    );




  }
}
