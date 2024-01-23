


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:d_chart/d_chart.dart';
import 'package:projetflutter/models/Temperature.dart';
import 'package:projetflutter/service/temperature_service.dart';

class StaticTemperature extends StatefulWidget {
  final Future<List<Temperature>> temperatureDataFuture;

  StaticTemperature({Key? key, required this.temperatureDataFuture}) : super(key: key);

  @override
  _StaticTemperatureState createState() => _StaticTemperatureState();
}

class _StaticTemperatureState extends State<StaticTemperature> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Temperature>>(
      future: widget.temperatureDataFuture, // Access the future from the widget
      builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: Colors.deepPurple));
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur de récupération des données'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Aucune donnée de température disponible.'));
          } else {

            List<NumericData> chartData = snapshot.data!
                .where((temperature) => temperature.timestamp.second % 10 == 0)
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



            return Column(
              children: [
                Text(
                  'Température',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 300,
                  width: 350,
                  child: DChartLineN(
                    groupList: numericGroupList,
                    fillColor: (lineData, index, id) =>
                        Colors.deepPurple.withOpacity(0.5),
                    areaColor: (lineData, index, id) => Colors.deepPurple,
                    animationDuration: Duration(seconds: 1),
                    animate: true,
                  ),
                ),
                Text(
                  'Graphe Température par minute',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 200,
                  child: DChartPieO(
                    data: pieData,
                    animationDuration: Duration(seconds: 1),
                    animate: true,
                    customLabel: (pieData, index) {
                      final domain = pieData.domain;
                      final measure = pieData.measure.toString();
                      return '$domain: $measure';
                    },
                  ),
                ),
                Text(
                  'Graphe de Répartition des températures',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          }
      },
    );
  }
}

