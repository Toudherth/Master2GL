import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projetflutter/entity/Temperature.dart';
import 'package:projetflutter/service/database_service.dart';

class TemperatureScreen extends StatelessWidget {
  final DatabaseService databaseService;

  TemperatureScreen({required this.databaseService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Montpellier'),
      ),
      body: FutureBuilder<List<TemperatureData>>(
        future: databaseService.getTemperatureData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            // Affiche un indicateur de chargement tant que les données ne sont pas chargées
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            // Gère les erreurs de chargement des données
            return Center(child: Text('An error has occurred: ${snapshot.error}'));
          }

          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            // Si des données sont présentes et que la liste n'est pas vide, accéder au dernier élément
            var data = snapshot.data!.last;
            return Column(
              children: [
                Text('Temperature: ${data.temperature}°'),
                Text('Min: ${data.minTemperature}°'),
                Text('Max: ${data.maxTemperature}°'),
                // Continuez avec votre implémentation UI...
              ],
            );
          } else {
            // Affiche un message indiquant qu'aucune donnée n'est disponible
            return Center(child: Text('No temperature data available.'));
          }
        },
      ),
    );
  }
}
