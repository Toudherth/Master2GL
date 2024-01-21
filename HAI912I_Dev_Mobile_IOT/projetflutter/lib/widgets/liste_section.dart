
import 'package:flutter/material.dart';
import 'package:projetflutter/service/temperature_service.dart';

class ListeSection extends StatefulWidget {
  @override
  _ListeSectionState createState() => _ListeSectionState();
}

class _ListeSectionState extends State<ListeSection> {
  late ScrollController _scrollController;
  late Future<List<Map<String, dynamic>>> temperaturesFuture;

  late List<Map<String, dynamic>> temperatures;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    temperaturesFuture = ServiceTemperature.getTemperatures(); // Récupération des températures
    _loadTemperatures();
  }

  Future<void> _loadTemperatures() async {
    temperatures = await ServiceTemperature.getTemperatures();
    setState(() {}); // Mise à jour de l'UI avec les nouvelles données
  }


  String getWeatherIcon(double temperature) {
    if (temperature >= 35) {
      return 'assets/page-1/images2/6.png'; // Very hot / Sunny
    } else if (temperature >= 30) {
      return 'assets/page-1/images2/11.png'; // Hot
    } else if (temperature >= 25) {
      return 'assets/page-1/images2/7.png'; // Warm / Partly Cloudy
    } else if (temperature >= 20) {
      return 'assets/page-1/images2/7.png'; // Mild
    } else if (temperature >= 15) {
      return 'assets/page-1/images2/3.png'; // Cool
    } else if (temperature >= 10) {
      return 'assets/page-1/images2/5.png'; // Chilly
    } else if (temperature >= 5) {
      return 'assets/page-1/images2/1.png'; // Cold
    } else if (temperature >= 0) {
      return 'assets/page-1/images2/4.png'; // Very Cold
    } else {
      return 'assets/page-1/images2/2.png'; // Freezing
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 16),
          Center(
            child: Icon(
              Icons.keyboard_arrow_up,
              color: Colors.black,
              size: 34,
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.only(left: 24),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'History',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: temperaturesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Erreur de chargement'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('Aucune donnée'));
                } else {
                  return ListView.builder(
                    controller: _scrollController,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var temperatureRecord = snapshot.data![index];
                      double temperature = temperatureRecord['value'];
                      String timestamp = temperatureRecord['timestamp'];
                      String weatherIconPath = getWeatherIcon(temperature);

                      return ListTile(
                        leading: Image.asset(weatherIconPath),
                        title: Text('${temperature.toStringAsFixed(2)}°C'),
                        subtitle: Text(timestamp),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}


