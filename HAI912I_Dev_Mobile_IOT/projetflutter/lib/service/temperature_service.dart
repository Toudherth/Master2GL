import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:projetflutter/helper/database_helper.dart';
import 'dart:async';

import 'package:projetflutter/models/Temperature.dart';


class ServiceTemperature {
  final StreamController<double> _temperatureController = StreamController.broadcast();

  ServiceTemperature() {
    _initiateTemperatureUpdates();
  }

  Stream<double> get temperatureUpdates => _temperatureController.stream;

  void _initiateTemperatureUpdates() {
    Timer.periodic(Duration(seconds:5 ), (timer) async {
      try {
        final temperature = await _fetchTemperatureFromAPI();
        _temperatureController.add(temperature);
        // Insérer la température dans la base de données pourrait être fait ici ou en écoutant ce stream ailleurs.
      } catch (e) {
        _temperatureController.addError(e);
      }
    });
  }

  Future<double> _fetchTemperatureFromAPI() async {
    final response = await http.get(Uri.parse('http://192.168.43.10/temperature'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      double temperatureValue = data['value'];
      return temperatureValue;
    } else {
      throw Exception('Failed to load temperature');
    }
  }

  void dispose() {
    _temperatureController.close();
  }

  Future<List<Temperature>> fetchTemperatures() async {
    final db = await DatabaseHelper.getDB();
    final List<Map<String, dynamic>> maps = await db.query('temperatures');
    return List.generate(maps.length, (i) {
      return Temperature.fromMap(maps[i]);
    });
  }

  // api of get temperature
  static Future<double> fetchTemperature() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.43.10/temperature'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // Extraction de la valeur de la température
        double temperatureValue = data['value'];
        return temperatureValue; // Retourner directement la valeur double
      } else {
        throw Exception('Erreur de chargement');
      }
    } catch (e) {
      throw Exception('Erreur: $e');
    }
  }

// Méthode pour insérer une température
  static Future<void> insertTemperature(double temperature) async {
    final db = await DatabaseHelper.getDB();
    print("Tentative d'ajout dans la BDD");
    int id = await db.insert('temperatures', {'value': temperature});

    print("La date de l'ajout " +DateTime.timestamp().toString());
    if (id > 0) {
      print("Insertion réussie avec l'ID: $id");
    } else {
      print("Échec de l'insertion");
    }
  }

  // Méthode pour récupérer les températures
  static Future<List<Map<String, dynamic>>> getTemperatures() async {
    final db = await DatabaseHelper.getDB();
    final List<Map<String, dynamic>> maps = await db.query('temperatures');
    return maps;
  }


  // Add these methods in the ServiceTemperature class

  static Future<double> getMinTemperature() async {
    final db = await DatabaseHelper.getDB();
    var result = await db.rawQuery('SELECT MIN(value) as minTemp FROM temperatures');
    if (result.isNotEmpty) {
      return result.first['minTemp'] as double;
    } else {
      return 0.0;
    }
  }

  static Future<double> getMaxTemperature() async {
    final db = await DatabaseHelper.getDB();
    var result = await db.rawQuery('SELECT MAX(value) as maxTemp FROM temperatures');
    if (result.isNotEmpty) {
      return result.first['maxTemp'] as double;
    } else {
      return 0.0;
    }
  }




}










