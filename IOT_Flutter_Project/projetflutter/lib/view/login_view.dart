// views/login_view.dart
import 'package:flutter/material.dart';
import '../widgets/auth_form.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Se connecter'),
      ),
      body: AuthForm(
        buttonText: 'Se connecter',
        onSubmit: (email, password) {
          // Logique pour se connecter


        },
      ),
    );
  }
}
