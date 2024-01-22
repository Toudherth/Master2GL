import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projetflutter/service/registation_service.dart';
import 'package:projetflutter/service/temperature_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final RegistrationService registrationService = RegistrationService();

  int _selectedIndex = 0;

  // Récupérez les informations de l'utilisateur
  Future<Map<String, String?>> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('userEmail');
    String? name = prefs.getString('userName');
    return {'email': email, 'name': name};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.white,
        leading: CupertinoNavigationBarBackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String result) async {
              switch (result) {
                case 'Option1':
                  Navigator.pushNamed(context, '/settings');
                  break;
                case 'Option2':
                // Logique pour la déconnexion
                  await registrationService.logout();
                  Navigator.pushReplacementNamed(context, '/login');
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Option1',
                child: Text('Parametres'),
              ),
              const PopupMenuItem<String>(
                value: 'Option2',
                child: Text('Déconnection'),
              ),

            ],
          ),
        ],
      ),
      body: FutureBuilder<Map<String, String?>>(
        future: getUserData(),
        builder: (BuildContext context, AsyncSnapshot<Map<String, String?>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60, // Taille de l'avatar
                      backgroundImage: NetworkImage('https://static.wikia.nocookie.net/e4e248f1-4d5e-4b35-96e0-2c9e8363f8fd/scale-to-width/755'), // URL de votre image de profil
                    ),
                    SizedBox(height: 10),
                    Text(
                      snapshot.data?['name'] ?? 'Nom non disponible',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      snapshot.data?['email'] ?? 'Email non disponible',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(child: Text('Aucun utilisateur connecté.'));
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
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
        currentIndex: 2,
        selectedItemColor: Colors.amber,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.pushNamed(context, '/home');
    }
    if (index == 1) {
      Navigator.pushNamed(context, '/parametre');
    }
    if (index == 2) {
      Navigator.pushNamed(context, '/profile');
    }

  }
}
