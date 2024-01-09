import 'package:projetflutter/models/user.dart';

class AuthService {
  Future<User?> signIn(String email, String password) async {
    print(" je suis dans signIn");
    // Logique d'authentification, retourne un utilisateur ou null
  }

  Future<User?> signUp(String firstName, String lastName, String email, String password) async {
    print("je suis dans singUp");
    // Logique d'enregistrement, retourne un utilisateur ou null
  }
}