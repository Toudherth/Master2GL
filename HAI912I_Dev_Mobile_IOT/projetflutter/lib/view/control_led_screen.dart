import 'package:flutter/material.dart';



class ColorMixer extends StatefulWidget {
  @override
  _ColorMixerState createState() => _ColorMixerState();
}

class _ColorMixerState extends State<ColorMixer> {
  double cyan = 100;
  double magenta = 100;
  double yellow = 100;

  Color getColorFromCMY(double cyan, double magenta, double yellow) {
    // Conversion de CMY (0-100) en RGB (0-255)
    final red = (1.0 - cyan / 100) * 255;
    final green = (1.0 - magenta / 100) * 255;
    final blue = (1.0 - yellow / 100) * 255;
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
