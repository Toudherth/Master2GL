// DatabaseService.dart
import 'package:projetflutter/models/Temperature.dart';
import 'package:projetflutter/helper/database_helper.dart';

class DatabaseService {
  final DatabaseHelper _databaseHelper;

  DatabaseService(this._databaseHelper);

  Future<List<TemperatureData>> getTemperatureData() async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('temperatureData');

    return List.generate(maps.length, (i) {
      return TemperatureData.fromMap(maps[i]);
    });
  }
}