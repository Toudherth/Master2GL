
import 'package:flutter/material.dart';
import 'package:projetflutter/service/temperature_service.dart';
//import 'package:testcouleurs/graphescreen.dart';
import 'package:flutter/services.dart';

// Dans votre widget UI, utilisez la FutureBuilder comme ceci:

class LineChartPage extends StatefulWidget {
  @override
  _LineChartPageState createState() => _LineChartPageState();
}

class _LineChartPageState extends State<LineChartPage> {
  late Future<List<Map<String, dynamic>>> temperatureData;

  @override
  void initState() {
    super.initState();
    temperatureData = ServiceTemperature.getTemperatures(); // Cette méthode retourne Future<List<Map<String, dynamic>>>
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: temperatureData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {


          // Ensuite, vous pouvez utiliser 'spots' pour construire votre graphique
          return LineChartPage(
            // Créez votre graphique en utilisant la liste 'spots'
          );
        } else {
          return Text('Aucune donnée disponible');
        }
      },
    );
  }
}
