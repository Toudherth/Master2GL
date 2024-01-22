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
  final LuminosityService _luminosityService = LuminosityService();

  // initialisation de seuil
  double _currentThreshold = 1000;
  bool _isNightMode = false;


  @override
  void initState() {
    super.initState();
    _luminosityService.luminosityUpdates.listen((luminosityValue) {
      setState(() {
        _isNightMode = luminosityValue < _currentThreshold;
        print("is Dark mode ? " +_isNightMode.toString());
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
      stream: _luminosityService.luminosityUpdates,
      builder: (context, snapshot) {
        //TODO: declaration de dark and white mode
        var themeData = _isNightMode ? ThemeData.dark() : ThemeData.light();

        //  l'image en fonction du mode
        String imagePath = _isNightMode
            ? 'assets/page-1/images2/12.png' // Image du mode sombre
            : 'assets/page-1/images/sun-qJs.png'; // Image du mode clair


        // Configurez le style de la barre de statut
        SystemUiOverlayStyle statusBarStyle = _isNightMode
            ? SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
        )
            : SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        );


        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: statusBarStyle,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeData,
            home: Scaffold(
              appBar: AppBar(
                backgroundColor: _isNightMode ? Colors.grey[900] : Colors.white,
                leading: CupertinoNavigationBarBackButton(
                  onPressed: () => Navigator.of(context).pop(),
                ),
                elevation: 0,
              ),



              body: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Mode ${_isNightMode ? "Sombre" : "Clair"}',
                        style: themeData.textTheme.headline6?.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: _isNightMode ? Colors.white : Colors.black,
                        ),
                      ),

                      Image.asset(
                        imagePath,
                        width: 300,
                        height: 300,
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Seuil de luminosité (${_currentThreshold.round()}):',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: _isNightMode ? Colors.white : Colors.black,
                        ),
                      ),

                      // slider pour le seuil
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: _isNightMode ? Colors.indigo.shade700 : Colors.amber.shade700,
                          inactiveTrackColor: _isNightMode ? Colors.indigo[200] : Colors.amber[200],
                          thumbColor: _isNightMode ? Colors.indigo.shade900 : Colors.amber.shade900,
                          overlayColor: _isNightMode ? Colors.white.withAlpha(32) : Colors.amber.withAlpha(32),
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                        ),
                        child: Slider(
                          value: _currentThreshold,
                          min: 500,
                          max: 4000,
                          label: _currentThreshold.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              _currentThreshold = value.roundToDouble(); // un double esr arrondi à l'entier le plus proche
                              print("Seuil: ${_currentThreshold.toInt()}");
                            });
                          },
                        ),
                      ),

                      SizedBox(height: 30),
                      CupertinoButton(
                        color: _isNightMode ? Colors.white : Colors.black, // Couleur du fond en fonction du mode
                        borderRadius: BorderRadius.circular(10), // Bordure arrondie
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15), // Padding interne du bouton
                        child: Text(
                          'Valider le seuil',
                          style: TextStyle(
                            fontSize: 15,
                            color: _isNightMode ? Colors.black : Colors.white, // Couleur du texte en fonction du mode
                          ),
                        ),
                        onPressed: () {
                          // Logique pour envoyer le seuil au service
                          _luminosityService.setThreshold(_currentThreshold);
                        },
                      )


                    ],
                  ),
                ),
              ),
              // bottom bar
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: _isNightMode ? Colors.black87 : Colors.white, // Couleur de fond
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
                selectedItemColor: _isNightMode ? Colors.indigo.shade700 : Colors.amber.shade700, // Couleur de l'icône active
                unselectedItemColor: _isNightMode ? Colors.indigo[200] : Colors.amber[200], // Couleur des icônes inactives
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
    //_luminosityService.dispose();
    super.dispose();
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
