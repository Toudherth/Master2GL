import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = "temperaturesdb.db";

  static Future<Database> getDB() async {
    return openDatabase(
        join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async {
          await db.execute(
              "CREATE TABLE user (id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT NOT NULL, email TEXT NOT NULL, password TEXT NOT NULL);"
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
