import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:projetflutter/helper/database_helper.dart';

class ServiceTemperature {

  // api of get temperature
  Future<String> fetchTemperature() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.43.10/temperature'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // Extraction de la valeur de la température
        double temperatureValue = data['value'];
        return "${temperatureValue.toStringAsFixed(2)}°C"; // Formatage avec 2 décimales
      } else {
        return 'Erreur de chargement';
      }
    } catch (e) {
      return 'Erreur: $e';
    }
  }



  // add temperature in DBB


// Méthode pour insérer une température
  static Future<void> insertTemperature(double temperature) async {
    final db = await DatabaseHelper.getDB();
    print("Tentative d'ajout dans la BDD");
    int id = await db.insert('temperatures', {'value': temperature});
    if (id > 0) {
      print("Insertion réussie avec l'ID: $id");
    } else {
      print("Échec de l'insertion");
    }
  }

  // Méthode pour récupérer les températures
  static Future<List<Map<String, dynamic>>> getTemperatures() async {
    final db = await DatabaseHelper.getDB();
    //print("je suis dans get temperatures");
    //print(db.toString());
    return db.query('temperatures');
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
