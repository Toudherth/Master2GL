import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:projetflutter/models/lumiere.dart';
import 'package:projetflutter/service/luminosity_service.dart';

class StaticLumenusite extends StatefulWidget {
  @override
  _StaticLumenusiteState createState() => _StaticLumenusiteState();
}

class _StaticLumenusiteState extends State<StaticLumenusite> {
  final LuminosityService _luminosityService = LuminosityService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Luminosity>>(
      future: _luminosityService.getLuminosityData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erreur de chargement des données'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('Pas de données disponibles'));
        } else {
          List<NumericData> chartData = snapshot.data!
              .map((luminosity) => NumericData(
            domain: luminosity.timestamp.second.toDouble(),
            measure: luminosity.value,
          ))
              .toList();

          Map<String, int> lumiereRanges = {
            '500-1000': 0,
            '1000-4000': 0,
          };

          for (var luminosity in snapshot.data!) {
            if (luminosity.value >= 500 && luminosity.value < 1000) {
              lumiereRanges['500-1000'] = (lumiereRanges['500-1000'] ?? 0) + 1;
            } else if (luminosity.value >= 1000 && luminosity.value < 4000) {
              lumiereRanges['1000-4000'] = (lumiereRanges['1000-4000'] ?? 0) + 1;
            }
          }

          List<OrdinalData> pieData = lumiereRanges.entries.map((entry) {
            Color color;
            switch (entry.key) {
              case '500-1000':
                color = Color(0xFF241B10);
                break;
              case '1000-4000':
                color = Colors.amberAccent;
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
                'Luminosité',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 200,
                child: DChartPieO(
                  data: pieData,
                  animationDuration: Duration(seconds: 1),
                  animate: true,
                ),
              ),
              Text(
                'Mode : Sombre / Clair',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          );
        }
      },
    );
  }
}
