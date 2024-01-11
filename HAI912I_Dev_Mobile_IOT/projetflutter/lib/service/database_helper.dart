import 'package:path/path.dart';
import 'package:projetflutter/models/user.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const int _version=1;
  static const String _dbName="temperaturesdb.db";



  static Future<Database> _getDB() async{
    return openDatabase(join(await getDatabasesPath(), _dbName),

      onCreate: (db, version) async =>
          await db.execute("CREATE TABLE user (id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT NOT NULL, email TEXT NOT NULL , password TEXT NOT NULL);"),
          version: _version
    );
  }
  // Add
  static Future<int> addUser(User user) async {
    final db= await _getDB();
    return await db.insert("user", user.toJson()
    ,conflictAlgorithm: ConflictAlgorithm.replace);
  }
  // Update
  static Future<int> updateUser(User user) async {
    final db= await _getDB();
    return await db.update("user", user.toJson(),
      where: 'id= ?',
      whereArgs: [user.id],
      conflictAlgorithm: ConflictAlgorithm.replace
    );
  }
  // Delete
  static Future<int> deleteeUser(User user) async {
    final db= await _getDB();
    return await db.update("user", user.toJson(),
        where: 'id= ?',
        whereArgs: [user.id],
    ); }

    // get all
    static Future<List<User>?> getAllUsers() async {
    final db= await _getDB();
    final List<Map<String, dynamic>> maps = await db.query("user");
    if(maps.isEmpty){
      return null;
    }

    return List.generate(maps.length, (index) => User.fromJson(maps[index]));
    }



}