import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = "temperaturesdb.db";



  static Future<Database> getDB() async {
    return openDatabase(
        join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async {
          // Création de la table utilisateur
          await db.execute(
              "CREATE TABLE user (id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT NOT NULL, email TEXT NOT NULL, password TEXT NOT NULL);"
          );
          // Création de la table de températures
          await db.execute(
              "CREATE TABLE temperatures (id INTEGER PRIMARY KEY AUTOINCREMENT, value REAL NOT NULL, timestamp DATETIME DEFAULT CURRENT_TIMESTAMP);"
          );
          await db.execute(
              "CREATE TABLE luminosity (id INTEGER PRIMARY KEY AUTOINCREMENT, value REAL NOT NULL, timestamp DATETIME DEFAULT CURRENT_TIMESTAMP);"
          );
        },
        version: _version
    );
  }

  static Future<void> close() async {
    final db = await getDB();
    await db.close();
  }
}
