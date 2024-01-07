// main.dart

import 'package:flutter/material.dart';
import 'package:projetflutter/view/logged_out.dart'; // Assurez-vous que ce chemin est correct

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Votre Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // Utilisez un TextTheme standard ou définissez le vôtre sans GoogleFonts
        textTheme: TextTheme(
          bodyText1: TextStyle(fontFamily: 'VotrePolice'), // Remplacez 'VotrePolice' par votre police

          // ... autres styles ...
        ),
      ),
      home: Scene(), // Assurez-vous que la classe Scene est définie quelque part dans votre projet
    );
  }
}




/*import 'package:flutter/material.dart';
import 'package:projetflutter/helper/database_helper.dart';
import 'package:projetflutter/service/database_service.dart';
import 'package:projetflutter/view/temperature_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DatabaseHelper databaseHelper = DatabaseHelper.instance;
    final DatabaseService databaseService = DatabaseService(databaseHelper);

    return MaterialApp(
      title: 'Temperature Monitor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TemperatureScreen(databaseService: databaseService),
    );
  }
}

*/
/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projetflutter/view/login_view.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginView(),
        '/register': (context) => RegisterView(),
      },
    );
  }
}

/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ArduinoFlutter',
      theme: ThemeData(




        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'ArduinoFlutter'),
    );
  }
}
*/

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {



      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      /** Title */
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),

      /** Body */
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(



          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),


            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),

      /** Footer */
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}*/
