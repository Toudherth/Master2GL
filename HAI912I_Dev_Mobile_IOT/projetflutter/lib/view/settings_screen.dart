import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Paramètres'),
        leading: CupertinoNavigationBarBackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
      ),


      body: ListView(
        children: <Widget>[
          SwitchListTile(
            title: Text('Activer les notifications'),
            value: true, // Ici, vous devriez utiliser une variable d'état
            onChanged: (bool value) {
              // Mettre à jour la valeur de l'état
            },
          ),
          ListTile(
            title: Text('Changer le thème'),
            onTap: () {
              // Logique pour changer le thème
            },
          ),
          ListTile(
            title: Text('A propos'),
            onTap: () {
              // Naviguer vers une page 'A propos'
            },
          ),
          // Ajoutez plus d'options de paramètres ici
        ],
      ),
    );
  }
}
