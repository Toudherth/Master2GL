import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projetflutter/service/luminosity_service.dart';

class Lumenusite extends StatefulWidget {
  @override
  _LuminositeState createState() => _LuminositeState();
}

class _LuminositeState extends State<Lumenusite> {
  int _selectedIndex = 0;
  final LuminosityService luminosityService = LuminosityService();

  // initialisation de seuil
  double _currentThreshold = 1000;

  @override
  void initState() {
    super.initState();
    // Ici, vous pouvez initialiser le service de luminosité si nécessaire.
  }


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
      stream: luminosityService.luminosityUpdates,
      builder: (context, snapshot) {
        bool isDarkMode = snapshot.hasData && snapshot.data! < 50;


        // Choisissez votre thème en fonction de la luminosité.
        var themeData = isDarkMode ? ThemeData.dark() : ThemeData.light();

        SystemUiOverlayStyle statusBarStyle = isDarkMode
            ? SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.black, // pour le mode sombre
          statusBarIconBrightness: Brightness.light, // Icônes claires
        )
            : SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.white, // pour le mode clair
          statusBarIconBrightness: Brightness.dark, // Icônes sombres
        );

        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: statusBarStyle,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              // Configurez le reste de votre thème ici
              appBarTheme: AppBarTheme(
                systemOverlayStyle: statusBarStyle, // Utilisé par l'AppBar
              ),
            ),
            home: Scaffold(
              appBar: AppBar(
                //title: Text(isDarkMode ? 'Mode Sombre' : 'Mode Clair'),
                backgroundColor: isDarkMode ? Colors.grey[900] : Colors.transparent,
                leading: CupertinoNavigationBarBackButton(
                  onPressed: () => Navigator.of(context).pop(),
                ),
                elevation: 0,
              ),


              body: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center, // Centre le contenu verticalement
                    children: [
                      Text(
                        'Mode ${isDarkMode ? "Sombre" : "Clair"}',
                        style: themeData.textTheme.headline6?.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      //SizedBox(height: 20), // Un espace pour aérer le contenu
                      Image.asset(
                        'assets/page-1/images/sun-qJs.png', // Assurez-vous que le chemin de l'asset est correct
                        width: 300, // Ajustez la largeur comme nécessaire
                        height: 300, // Ajustez la hauteur comme nécessaire
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Seuil de luminosité (${_currentThreshold.round()}):',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      Slider(
                        value: _currentThreshold,
                        min: 500,
                        max: 4000,
                        //divisions: 35, // Pour avoir des étapes de 100 entre 500 et 4000
                        label: _currentThreshold.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _currentThreshold = value;
                          });
                        },
                      ),

                      SizedBox(height: 30),

                    /*  ElevatedButton(
                        onPressed: () {
                          // Envoyez le seuil au backend
                        },
                        child: Text('Valider le seuil'),
                      ),
*/
                      ElevatedButton(
                        onPressed: () {
                          // Envoyez le seuil au backend
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (isDarkMode) {
                                return Colors.white; // Bouton blanc en mode sombre
                              }
                              return Colors.black; // Bouton noir en mode clair
                            },
                          ),
                          foregroundColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (isDarkMode) {
                                return Colors.black; // Texte noir en mode sombre
                              }
                              return Colors.white; // Texte blanc en mode clair
                            },
                          ),
                        ),
                        child: Text('Valider le seuil'),
                      ),



                    ],
                  ),
                ),
              ),

// ... Votre code suivant ...

              bottomNavigationBar: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
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
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.amber[800],
                onTap: _onItemTapped,
              ),
            ),
          ),
        );
      },
    );
  }


 @override
  void dispose() {
    luminosityService.dispose(); // Assurez-vous de disposer le service si nécessaire.
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
