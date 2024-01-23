import 'package:flutter/material.dart';
import 'package:d_chart/d_chart.dart';
import 'package:projetflutter/models/Temperature.dart';
import 'package:projetflutter/service/temperature_service.dart';

class StatistiqueScreen extends StatefulWidget {
  @override
  _StatistiqueScreenState createState() => _StatistiqueScreenState();
}

class _StatistiqueScreenState extends State<StatistiqueScreen> {
  ServiceTemperature serviceTemperature = ServiceTemperature();
  late Future<List<Temperature>> temperatureDataFuture;

  @override
  void initState() {
    super.initState();
    temperatureDataFuture = serviceTemperature.fetchTemperatures();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Statistique"),
        backgroundColor: Colors.white, // Personnaliser la couleur de l'AppBar
      ),
      body: FutureBuilder<List<Temperature>>(
        future: temperatureDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.deepPurple), // Indicateur de chargement stylisé
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur de récupération des données'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Aucune donnée de température disponible.'));
          } else {
            List<NumericData> chartData = snapshot.data!
                .where((temperature) => temperature.timestamp.minute % 10 == 0)
                .map((temperature) => NumericData(
              domain: temperature.timestamp.minute.toDouble(),
              measure: temperature.value,
            ))
                .toList();

            final numericGroupList = [
              NumericGroup(
                id: 'Temperature',
                data: chartData,
              ),
            ];

            return Padding(
              padding: EdgeInsets.all(16),
              child: Card(
                elevation: 4, // Ajout d'une ombre pour la profondeur
                child: Padding(
                  padding: EdgeInsets.all(8),

                  child: DChartLineN(
                    groupList: numericGroupList,
                    fillColor: (lineData, index, id) => Colors.deepPurple.withOpacity(0.5), // Couleur de remplissage avec une opacité
                    areaColor: (lineData, index, id) => Colors.deepPurple, // Couleur de la ligne
                    animate: true,

                  ),

                ),
              ),
            );
          }
        },
      ),
    );
  }
}


