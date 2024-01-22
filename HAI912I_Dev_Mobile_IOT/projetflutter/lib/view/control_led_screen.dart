import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projetflutter/service/luminosity_service.dart';



class ColorMixer extends StatefulWidget {
  @override
  _ColorMixerState createState() => _ColorMixerState();
}

class _ColorMixerState extends State<ColorMixer> {
  final LuminosityService _luminosityService = LuminosityService();
  int _selectedIndex = 0;

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
        //title: Text('Controle de la LED'),
        leading: CupertinoNavigationBarBackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Contrôle de la LED',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0), // Grand padding vertical
            child: Container(
              height: 200,
              color: displayColor,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'CMY(${cyan.toStringAsFixed(0)}, ${magenta.toStringAsFixed(0)}, ${yellow.toStringAsFixed(0)})',
            style: TextStyle(fontSize: 21, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          sliderWithTitle('Cyan', cyan, Colors.cyan, (newValue) {
            setState(() => cyan = newValue);
          }),
          sliderWithTitle('Magenta', magenta, Color(0xFFFF00FF), (newValue) {
            setState(() => magenta = newValue);
          }),
          sliderWithTitle('Yellow', yellow, Colors.yellow.shade600, (newValue) {
            setState(() => yellow = newValue);
          }),

          SizedBox(height: 10),
          CupertinoButton(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            child: Text(
              'Contrôler la LED',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            onPressed: () {
              print("${cyan.toInt()}  ${magenta.toInt()}  ${yellow.toInt()}");
              _luminosityService.controlLED(cyan.toInt(), magenta.toInt(), yellow.toInt());
            },
          )


        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.pushNamed(context, '/home');
    }
    if (index == 1) {
      Navigator.pushNamed(context, '/parametre');
    }
    if (index == 2) {
      Navigator.pushNamed(context, '/profile');
    }

  }
}
