import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget {
  final String buttonText;
  final void Function(String email, String password) onSubmit;

  AuthForm({required this.buttonText, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentication Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Add your form fields here (e.g., TextFields for email and password)
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Retrieve email and password and call the onSubmit function
                String email = ''; // Get email from TextField
                String password = ''; // Get password from TextField
                onSubmit(email, password);
              },
              child: Text(buttonText),
            ),
          ],
        ),
      ),
    );
  }
}
