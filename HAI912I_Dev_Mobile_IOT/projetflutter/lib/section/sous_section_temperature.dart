import 'package:flutter/material.dart';
import 'package:projetflutter/service/temperature_service.dart';
import 'package:projetflutter/view/temperature_screen.dart'; // Assurez-vous que ce chemin est correct

class SousSectionTemperature extends StatefulWidget {
  @override
  _SousSectionTemperatureState createState() => _SousSectionTemperatureState();
}

class _SousSectionTemperatureState extends State<SousSectionTemperature> {
  late ServiceTemperature serviceTemperature;

  double minTemperature = 0.0;
  double maxTemperature = 0.0;


  @override
  void initState() {
    super.initState();
    serviceTemperature = ServiceTemperature();
    // Initialisation des températures min et max
    loadMinMaxTemperatures();
  }

  // loading min max temperature
  Future<void> loadMinMaxTemperatures() async {
    try {
      double minTemp = await ServiceTemperature.getMinTemperature();
      double maxTemp = await ServiceTemperature.getMaxTemperature();
      if (mounted) {
        setState(() {
          minTemperature = minTemp;
          maxTemperature = maxTemp;
        });
      }
    } catch (e) {
      print("Erreur lors de la récupération des températures: $e");
      // Vous pouvez choisir de définir les températures sur une valeur par défaut ou de gérer l'erreur comme vous le souhaitez
    }
  }


  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / 375;

    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 3 * fem,
        right: 3 * fem,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Temperature()), // Assurez-vous que cette classe existe
          );
        },

        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16 * fem, horizontal: 25 * fem),
          margin: EdgeInsets.only(left: 10 * fem, right: 10 * fem),
          decoration: BoxDecoration(
            color: Color(0xFF91ffffff),
            borderRadius: BorderRadius.circular(20 * fem),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Temperature',
                    style: TextStyle(
                      fontSize: 18 * fem,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF000000),
                    ),
                  ),
                  SizedBox(height: 4 * fem),

                  Text(
                    ' ${maxTemperature.toStringAsFixed(2)}°   |    ${minTemperature.toStringAsFixed(1)}°',
                    style: TextStyle(
                      fontSize: 16 * fem,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF000000),
                    ),
                  ),
                ],
              ),

              StreamBuilder<double>(
                stream: serviceTemperature.temperatureUpdates,
                builder: (context, snapshot) {
                  String temperatureText;
                  double fontSize = 16 * fem; // Utilisez la variable fem pour le scaling
                  Widget iconWidget; // Widget pour l'icône, peut être une Image ou un Text pour l'erreur

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    temperatureText = '...';
                    iconWidget = CircularProgressIndicator(); // ou un autre widget de votre choix
                  } else if (snapshot.hasError) {
                    temperatureText = 'Erreur';
                    // Utiliser un widget Text pour l'icône en cas d'erreur
                    iconWidget = Icon(Icons.sunny, size: 20 * fem, color: Colors.red);
                  } else if (snapshot.hasData) {
                    final currentTemperature = snapshot.data!;
                    temperatureText = '${currentTemperature.toStringAsFixed(2)}°C';
                    String iconPath = getWeatherIcon(currentTemperature); // Obtenez le chemin de l'icône basé sur la température
                    iconWidget = Image.asset(
                      iconPath,
                      width: 40 * fem,
                      height: 40 * fem,
                    );
                  } else {
                    temperatureText = 'Données non disponibles';
                    // Utiliser un widget Text pour l'icône si les données ne sont pas disponibles
                    iconWidget = Icon(Icons.info, size: 15 * fem, color: Colors.blue);
                  }

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        temperatureText,
                        style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      iconWidget, // Afficher l'icône ou l'erreur
                    ],
                  );
                },
              ),



            ],
          ),
        ),
      ),
    );
  }

  // icons of actuel temperature
  String getWeatherIcon(double temperature) {
    if (temperature >= 35) {
      return 'assets/page-1/images2/6.png'; // Very hot / Sunny
    } else if (temperature >= 30) {
      return 'assets/page-1/images2/11.png'; // Hot
    } else if (temperature >= 25) {
      return 'assets/page-1/images2/11.png'; // Warm / Partly Cloudy
    } else if (temperature >= 20) {
      return 'assets/page-1/images2/7.png'; // Mild
    } else if (temperature >= 15) {
      return 'assets/page-1/images2/3.png'; // Cool
    } else if (temperature >= 10) {
      return 'assets/page-1/images2/5.png'; // Chilly
    } else if (temperature >= 5) {
      return 'assets/page-1/images2/1.png'; // Cold
    } else if (temperature >= 0) {
      return 'assets/page-1/images2/4.png'; // Very Cold
    } else {
      return 'assets/page-1/images2/2.png'; // Freezing
    }
  }

}
