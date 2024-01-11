import 'package:projetflutter/models/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:projetflutter/helper//database_helper1.dart'; // Import DatabaseHelper


class RegistrationService {

  // Add
  static Future<int> addUser(User user) async {
    final db= await DatabaseHelper.getDB();
    return await db.insert("user", user.toJson()
        ,conflictAlgorithm: ConflictAlgorithm.replace);
  }
  // Update
  static Future<int> updateUser(User user) async {
    final db= await DatabaseHelper.getDB();
    return await db.update("user", user.toJson(),
        where: 'id= ?',
        whereArgs: [user.id],
        conflictAlgorithm: ConflictAlgorithm.replace
    );
  }
  // Delete
  static Future<int> deleteeUser(User user) async {
    final db= await DatabaseHelper.getDB();
    return await db.update("user", user.toJson(),
      where: 'id= ?',
      whereArgs: [user.id],
    ); }

  // get all
  static Future<List<User>?> getAllUsers() async {
    final db= await DatabaseHelper.getDB();
    final List<Map<String, dynamic>> maps = await db.query("user");
    if(maps.isEmpty){
      return null;
    }

    return List.generate(maps.length, (index) => User.fromJson(maps[index]));
  }

  // SignIn
  static Future<User?> signIn(String email, String password) async {
    final db = await DatabaseHelper.getDB();
    List<Map> users = await db.query("user", where: 'email = ? AND password = ?', whereArgs: [email, password]);

    if (users.isNotEmpty) {
      // Convert the Map to a User object
      return User.fromJson(Map<String, dynamic>.from(users.first));
    }
    return null;
  }






}