import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:d_chart/d_chart.dart';
import 'package:projetflutter/models/Temperature.dart';
import 'package:projetflutter/service/temperature_service.dart';
import 'package:projetflutter/widgets/static_luminosity.dart';
import 'package:projetflutter/widgets/static_temperature.dart';

class StatistiqueScreen extends StatefulWidget {
  @override
  _StatistiqueScreenState createState() => _StatistiqueScreenState();
}

class _StatistiqueScreenState extends State<StatistiqueScreen> {
  ServiceTemperature serviceTemperature = ServiceTemperature();
  late Future<List<Temperature>> temperatureDataFuture;

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    temperatureDataFuture = ServiceTemperature.fetchTemperatures();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: CupertinoNavigationBarBackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: FutureBuilder<List<Temperature>>(


        future: temperatureDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: Colors.deepPurple));
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur de récupération des données'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Aucune donnée de température disponible.'));
          } else {

            List<NumericData> chartData = snapshot.data!
                .where((temperature) => temperature.timestamp.minute % 10 == 0)
                .map((temperature) => NumericData(
              domain: temperature.timestamp.second.toDouble(),
              measure: temperature.value,
            ))
                .toList();

            final numericGroupList = [
              NumericGroup(
                id: 'Temperature',
                data: chartData,
              ),
            ];

            // Categorize the temperatures into ranges
            Map<String, int> temperatureRanges = {
              '0-5': 0,
              '5-10': 0,
              '10-15': 0,
              '15-20': 0,
              '25-30': 0,
              '30-35': 0,
              '35-40': 0,
            };

            for (var temperature in snapshot.data!) {
              for (var temperature in snapshot.data!) {
                if (temperature.value >= 25 && temperature.value < 30) {
                  temperatureRanges['25-30'] = (temperatureRanges['25-30'] ?? 0) + 1;
                } else if (temperature.value >= 30 && temperature.value < 35) {
                  temperatureRanges['30-35'] = (temperatureRanges['30-35'] ?? 0) + 1;
                } else if (temperature.value >= 35 && temperature.value < 40) {
                  temperatureRanges['35-40'] = (temperatureRanges['35-40'] ?? 0) + 1;
                } else if (temperature.value >= 0 && temperature.value < 5) {
                  temperatureRanges['0-5'] = (temperatureRanges['0-5'] ?? 0) + 1;
                } else if (temperature.value >= 5 && temperature.value < 10 ){
                  temperatureRanges['5-10'] = (temperatureRanges['5-10'] ?? 0) + 1;
                } else if (temperature.value >= 10 && temperature.value < 15) {
                  temperatureRanges['10-15'] = (temperatureRanges['10-15'] ?? 0) + 1;
                } else if (temperature.value >= 15 && temperature.value < 20 ){
                  temperatureRanges['15-20'] = (temperatureRanges['15-20'] ?? 0) + 1;
                } else if (temperature.value >= 20 && temperature.value < 25) {
                  temperatureRanges['20-25'] = (temperatureRanges['20-25'] ?? 0) + 1;
                }
              }

            }

            List<OrdinalData> pieData = temperatureRanges.entries.map((entry) {
              Color color;
              switch (entry.key) {
                case '0-5':
                  color = Colors.grey;
                  break;
                case '5-10':
                  color = Colors.green;
                  break;
                case '10-15':
                  color = Colors.blue;
                  break;
                case '15-20':
                  color = Colors.orange;
                  break;
                case '25-30':
                  color = Colors.purple;
                  break;
                case '30-35':
                  color = Colors.red;
                  break;
                case '35-40':
                  color = Colors.yellow;
                  break;
                default:
                  color = Colors.brown;
              }
              return OrdinalData(
                domain: entry.key,
                measure: entry.value,
                color: color,
              );
            }).toList();







            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(

                  children: [
                    Text(
                      'Statistiques',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    ),

                    SizedBox(height: 30),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(16),
                      child: StaticTemperature(temperatureDataFuture: temperatureDataFuture)



                    ),
                    SizedBox(height: 20), // Espace entre les deux sections
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(16),
                      child: StaticLumenusite()

                    ),
                  ],
                ),
              ),
            );
          }
        },
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