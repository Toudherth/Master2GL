import 'package:projetflutter/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:projetflutter/helper//database_helper.dart'; // Import DatabaseHelper


class RegistrationService {
  late User user;

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
  static Future<User?> singnIn(String email, String password) async {
    final db = await DatabaseHelper.getDB();
    List<Map> users = await db.query("user", where: 'email = ? AND password = ?', whereArgs: [email, password]);

    if (users.isNotEmpty) {
      // Convert the Map to a User object
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('userEmail', email);
     // await prefs.setString('userName', user.name);

      return User.fromJson(Map<String, dynamic>.from(users.first));
    }
    return null;
  }


  // SignIn
  static Future<User?> signIn(String email, String password) async {
    final db = await DatabaseHelper.getDB();
    List<Map> users = await db.query("user", where: 'email = ? AND password = ?', whereArgs: [email, password]);

    if (users.isNotEmpty) {
      // Convert the Map to a User object
      User user = User.fromJson(Map<String, dynamic>.from(users.first));

      // Utiliser SharedPreferences pour enregistrer les informations de l'utilisateur
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('userEmail', user.email);
      await prefs.setString('userName', user.username); // Assurez-vous que l'objet User a un champ 'name'

      return user;
    }
    return null;
  }

  // Fonction pour gérer la déconnexion
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userEmail');
    await prefs.remove('userName');
    // Vous pouvez ajouter plus d'opérations de nettoyage si nécessaire
  }





}