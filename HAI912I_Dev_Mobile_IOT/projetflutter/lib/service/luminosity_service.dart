import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';

import 'dart:async';

class LuminosityService {
  final StreamController<double> _luminosityController = StreamController.broadcast();

  Stream<double> get luminosityUpdates => _luminosityController.stream;

  void updateLuminosity(double luminosity) {
    _luminosityController.add(luminosity);
  }



  Future<double> fetchLuminosity() async {
    // Remplacez avec l'adresse IP et le port de votre serveur Arduino
    var url = Uri.parse('http://192.168.137.78/light');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        // Assurez-vous que votre Arduino renvoie une réponse JSON avec une clé 'value'
        double lightValue = jsonResponse['value'].toDouble();
        return lightValue;
      } else {
        // Gérez le cas où le serveur ne renvoie pas une réponse 200 OK
        throw Exception('Failed to load luminosity');
      }
    } on Exception catch (e) {
      // Gérer les exceptions lors de la connexion au serveur ou lors de la conversion des données
      print(e.toString());
      throw Exception('Failed to connect to the Arduino server');
    }
  }


  Future<double> fetchLuminosijty() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.43.10/hight'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // Extraction de la valeur de la température
        double temperatureValue = data['value'];
        print("Les données sont la ______________ "+temperatureValue.toString());
        return temperatureValue; // Retourner directement la valeur double
      } else {
        print("les données ne sont pas recuperer ______________");
        throw Exception('Erreur de chargement');
      }
    } catch (e) {
      throw Exception('Erreur: $e');
    }
  }

  void dispose() {
    _luminosityController.close();
  }

}




final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  // other dark theme properties...
);

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  // other light theme properties...
);
