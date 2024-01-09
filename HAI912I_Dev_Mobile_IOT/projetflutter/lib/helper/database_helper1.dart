
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('temperature.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
CREATE TABLE temperatureData ( 
  id INTEGER PRIMARY KEY AUTOINCREMENT, 
  temperature REAL NOT NULL,
  minTemperature REAL NOT NULL,
  maxTemperature REAL NOT NULL,
  date TEXT NOT NULL
  )
''');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}