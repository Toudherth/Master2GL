import 'package:flutter/material.dart';
import 'package:projetflutter/service/luminosity_service.dart';



class ColorMixer extends StatefulWidget {
  @override
  _ColorMixerState createState() => _ColorMixerState();
}

class _ColorMixerState extends State<ColorMixer> {

  final LuminosityService _luminosityService = LuminosityService();


  double cyan = 100;
  double magenta = 100;
  double yellow = 100;

  Color getColorFromCMY(double cyan, double magenta, double yellow) {
    // Conversion de CMY (0-255) en RGB (0-255)
    final red = 255 - cyan;
    final green = 255 - magenta;
    final blue = 255 - yellow;
    return Color.fromRGBO(red.toInt(), green.toInt(), blue.toInt(), 1);
  }


  @override
  Widget build(BuildContext context) {
    Color displayColor = getColorFromCMY(cyan, magenta, yellow);

    return Scaffold(
      appBar: AppBar(
        title: Text('Controle de la LED'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0), // Grand padding vertical

            // Ce Container est juste pour la couleur
            child: Container(
              height: 200, // Hauteur fixe pour la boîte de couleur
              color: displayColor,
            ),
          ),
          SizedBox(height: 30),
          Text(
            'CMY(${cyan.toStringAsFixed(0)}, ${magenta.toStringAsFixed(0)}, ${yellow.toStringAsFixed(0)})',
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
          SizedBox(height: 100),
          sliderWithTitle('Cyan', cyan, Colors.cyan, (newValue) {
            setState(() => cyan = newValue);
          }),
          sliderWithTitle('Magenta', magenta, Color(0xFFFF00FF), (newValue) {
            setState(() => magenta = newValue);
          }),
          sliderWithTitle('Yellow', yellow, Colors.yellow.shade600, (newValue) {
            setState(() => yellow = newValue);
          }),

          ElevatedButton(
            onPressed: () {
              print(cyan.toInt().toString()+"  "+ magenta.toInt().toString()+"  "+ yellow.toInt().toString());
              _luminosityService.controlLED(cyan.toInt(), magenta.toInt(), yellow.toInt());
            },
            child: Text('Contrôler la LED'),
          )

        ],
      ),
    );

    // app bar

  }


  Widget sliderWithTitle(String title, double value, Color color, ValueChanged<double> onChanged) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontSize: 20)),
        Slider(
          value: value,
          min: 0,
          max: 255,
          divisions: 255,
          label: value.round().toString(),
          activeColor: color,
          onChanged: onChanged,
        ),
      ],
    );
  }
}


fluttertoast: ^8.2.4



Future<void> controlLED(int cyan, int magenta, int yellow) async {
  // ... votre code pour la requête HTTP ...

  if (response.statusCode == 200) {
    // Afficher le toast avec la réponse du backend
    Fluttertoast.showToast(
      msg: "LED contrôlée avec succès: ${response.body}",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0
    );
  } else {
    // Afficher le toast en cas d'erreur
    Fluttertoast.showToast(
      msg: "Erreur lors du contrôle de la LED: ${response.body}",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
    );
  }
}



  // Controle de LED

  Future<void> controlLED(int cyan, int magenta, int yellow) async {
    try {
      print("LED --------------");
      final response = await http.post(
        Uri.parse('http://192.168.43.10/led'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'cyan': cyan,
          'magenta': magenta,
          'yellow': yellow,
        }),
      );
      print(" la reponse de LED "+response.toString());

      if (response.statusCode == 200) {
        print("LED contrôlée avec succès.");
      } else {
        print("Erreur lors du contrôle de la LED: ${response.body}");
      }
    } catch (e) {
      print("Erreur lors du contrôle de la LED: $e");
    }
  }

