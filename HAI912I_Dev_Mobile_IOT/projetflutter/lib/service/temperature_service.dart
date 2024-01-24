import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projetflutter/helper/database_helper.dart';
import 'package:projetflutter/models/Temperature.dart';

class ServiceTemperature {
  final StreamController<double> _temperatureController = StreamController<double>.broadcast();
  static const String _baseUrl = 'http://192.168.43.10/temperature';

  ServiceTemperature() {
    _initiateTemperatureUpdates();
  }

  Stream<double> get temperatureUpdates => _temperatureController.stream;

  void _initiateTemperatureUpdates() {
    Timer.periodic(Duration(seconds: 5), (timer) async {
      try {
        final temperature = await fetchTemperature();
        _temperatureController.add(temperature);
        await insertTemperature(temperature);
      } catch (e) {
        _temperatureController.addError('Error fetching temperature: $e');
      }
    });
  }

  static Future<double> fetchTemperature() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      double temperatureValue = data['value'];
      return temperatureValue;
    } else {
      throw Exception('Failed to load temperature with status code: ${response.statusCode}');
    }
  }

  static Future<void> insertTemperature(double temperature) async {
    final db = await DatabaseHelper.getDB();
    print("Tentative d'ajout dans la BDD");
    int id = await db.insert('temperatures', {'value': temperature});

    print("La date de l'ajout " +DateTime.timestamp().toString());
    print("URI : "+_baseUrl.toString());
    if (id > 0) {
      print("Insertion réussie de la temperature avec l'ID: $id");
    } else {
      print("Échec de l'insertion");
    }
  }

  // for statistique
  static Future<List<Temperature>> fetchTemperatures() async {
    final db = await DatabaseHelper.getDB();
    final List<Map<String, dynamic>> maps = await db.query('temperatures');

    return maps.map((map) => Temperature.fromMap(map)).toList();
  }

  // Méthode pour récupérer les températures for list
  static Future<List<Map<String, dynamic>>> getTemperatures() async {
    final db = await DatabaseHelper.getDB();
    final List<Map<String, dynamic>> maps = await db.query('temperatures');
    return maps;
  }

  static Future<double> getMinTemperature() async {
    final db = await DatabaseHelper.getDB();
    var result = await db.rawQuery('SELECT MIN(value) as minTemp FROM temperatures');

    if (result.isNotEmpty && result.first['minTemp'] != null) {
      return result.first['minTemp'] as double;
    } else {
      return 0.0;
    }
  }

  static Future<double> getMaxTemperature() async {
    final db = await DatabaseHelper.getDB();
    var result = await db.rawQuery('SELECT MAX(value) as maxTemp FROM temperatures');

    if (result.isNotEmpty && result.first['maxTemp'] != null) {
      return result.first['maxTemp'] as double;
    } else {
      return 0.0;
    }
  }

  void dispose() {
    _temperatureController.close();
  }
}
