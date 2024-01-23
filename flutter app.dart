import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:projetflutter/models/Temperature.dart';
import 'package:projetflutter/service/temperature_service.dart';


class StatistiqueScreen extends StatefulWidget {
  @override
  _StatistiqueScreenState createState() => _StatistiqueScreenState();
}

class _StatistiqueScreenState extends State<StatistiqueScreen> {
  ServiceTemperature serviceTemperature = ServiceTemperature(); // Create an instance

  late Future<List<Map<String, dynamic>>> temperatureData;

  List<Map<String, dynamic>> temData =[
    {'year': 2021, 'percent':8},
    {'year': 2022, 'percent':20},
    {'year': 2023, 'percent':40},
    {'year': 2024, 'percent':50},
    {'year': 2025, 'percent':70},
  ];
  
  late Future<List<Temperature>> temperatureDataFuture;

  @override
  void initState() {
    super.initState();
    temperatureDataFuture = serviceTemperature.fetchTemperatures(); // Use the instance to call the method
  }





  @override
  Widget build(BuildContext context) {

    List<NumericData> numericDataList = temData.map((data) {
      return NumericData(
          domain: data['year']-2020.toDouble(),
          measure: data['percent'].toDouble());
    }).toList();



    final numericGroupList = [
      NumericGroup(
        id: 'Line',
        data: numericDataList,
      ),

    ];


    return Scaffold(
        appBar: AppBar(title: Text("Statistique")),


        body: ListView(
          padding: EdgeInsets.all(16),

          children: [
            AspectRatio(

              aspectRatio: 16 / 9,

              child: DChartLineN(

                groupList: numericGroupList,

              ),

            ),
          ],
        ),
      );


  }
}


