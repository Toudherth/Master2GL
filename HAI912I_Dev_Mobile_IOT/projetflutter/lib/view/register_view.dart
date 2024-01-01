// views/register_view.dart
import 'package:flutter/material.dart';
import '../widgets/auth_form.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('S\'enregistrer'),
      ),
      body: AuthForm(
        buttonText: 'S\'enregistrer',
        onSubmit: (email, password) {
          // Logique pour s'enregistrer
        },
      ),
    );
  }
}
