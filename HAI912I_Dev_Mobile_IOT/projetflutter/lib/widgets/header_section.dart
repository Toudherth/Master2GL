import 'package:flutter/material.dart';
import 'package:projetflutter/bloc/location_bloc.dart';
import 'package:projetflutter/helper/database_helper.dart';
import 'package:projetflutter/service/temperature_service.dart';

class HeaderSection extends StatefulWidget {
  @override
  _HeaderSectionState createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  final LocationBloc locationBloc = LocationBloc();
  final ServiceTemperature serviceTemperature = ServiceTemperature();
  double minTemperature = 0.0;
  double maxTemperature = 0.0;

  @override
  void initState() {
    super.initState();
    locationBloc.determinePosition();
    loadMinMaxTemperatures();
    serviceTemperature.temperatureUpdates.listen((temp) {
      ServiceTemperature.insertTemperature(temp);
      setState(() {});
    });
  }

  @override
  void dispose() {
    locationBloc.dispose();
    serviceTemperature.dispose();
    super.dispose();
  }
  // loading min max temperature
  Future<void> loadMinMaxTemperatures() async {
    double minTemp = await ServiceTemperature.getMinTemperature();
    double maxTemp = await ServiceTemperature.getMaxTemperature();
    setState(() {
      minTemperature = minTemp;
      maxTemperature = maxTemp;
    });
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 25,
        right: 25,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // localisation
          SizedBox(height: 50),


          StreamBuilder<String>(
              stream: locationBloc.locationStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text(
                    'Obtention de la localisation en cours...',
                    style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
                  );
                } else if (snapshot.hasError) {
                  return Text(
                      "Erreur: Impossible d'obtenir la localisation",
                  style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
                );
                } else if (snapshot.hasData) {
                return Text(
                '📍${snapshot.data}',
                style: Theme.of(context).textTheme.headline4?.copyWith(color: Colors.white),
                );
                } else {
                return Text(
                'La localisation est actuellement indisponible.',
                style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
                );
                }
              }
          ),

          SizedBox(height: 20),

          // temperature


          StreamBuilder<double>(
            stream: serviceTemperature.temperatureUpdates,
            builder: (context, snapshot) {
              String temperatureText;
              double fontSize;
              String weatherIconPath = 'assets/page-1/images2/default.png'; // Chemin par défaut pour l'icône

              if (snapshot.connectionState == ConnectionState.waiting) {
                temperatureText = 'Chargement...';
                fontSize = 15; // Taille de police plus petite pour le chargement
              } else if (snapshot.hasError) {
                temperatureText = 'Erreur 500..';
                fontSize = 15; // Taille de police plus petite pour l'erreur
              } else if (snapshot.hasData) {
                final currentTemperature = snapshot.data!;
                temperatureText = '${currentTemperature.toStringAsFixed(2)}°C';
                fontSize = 35; // Taille de police plus grande pour la température
                ServiceTemperature.insertTemperature(currentTemperature);
                weatherIconPath = getWeatherIcon(currentTemperature);
              } else {
                temperatureText = 'Données non disponibles';
                fontSize = 15; // Taille de police plus petite par défaut
              }

              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      temperatureText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    if (snapshot.hasData) SizedBox(height: 20),
                    if (snapshot.hasData)
                      Image.asset(
                        weatherIconPath,
                        width: 100,
                        height: 100,
                      ),
                  ],
                ),
              );
            },
          ),


          SizedBox(height: 40),




          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Température minimale avec icône
              Row(
                children: [
                  Image.asset('assets/page-1/images2/14.png', width: 54, height: 54), // Image de l'icône
                  SizedBox(width: 8), // Espace entre l'image et le texte
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Min',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold, // Ajoutez cette ligne pour le gras
                        ),

                      ),
                      SizedBox(width: 8),
                      Text(
                        '${minTemperature.toStringAsFixed(1)}°',
                        style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),

              Row(
                children: [
                  Image.asset('assets/page-1/images2/13.png', width: 54, height: 54), // Image de l'icône
                  SizedBox(width: 8), // Espace entre l'image et le texte
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Max',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold, // Ajoutez cette ligne pour le gras
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '${maxTemperature.toStringAsFixed(1)}°',
                        style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),





          SizedBox(height: 100),


        ],
      ),

    );
  }
}
