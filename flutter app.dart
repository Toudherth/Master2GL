import 'package:flutter/material.dart';
import 'package:projetflutter/bloc/location_bloc.dart';
import 'package:projetflutter/helper/database_helper.dart';
import 'package:projetflutter/service/temperature_service.dart';

class HeaderSection extends StatefulWidget {
  @override
  _HeaderSectionState createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  final LocationBloc locationBloc = LocationBloc();
  final ServiceTemperature serviceTemperature = ServiceTemperature();
  double minTemperature = 0.0;
  double maxTemperature = 0.0;

  @override
  void initState() {
    super.initState();
    locationBloc.determinePosition();
    loadMinMaxTemperatures();
    serviceTemperature.temperatureUpdates.listen((temp) {
      ServiceTemperature.insertTemperature(temp);
      setState(() {});
    });
  }

  @override
  void dispose() {
    locationBloc.dispose();
    serviceTemperature.dispose();
    super.dispose();
  }

  Future<void> loadMinMaxTemperatures() async {
    double minTemp = await ServiceTemperature.getMinTemperature();
    double maxTemp = await ServiceTemperature.getMaxTemperature();
    setState(() {
      minTemperature = minTemp;
      maxTemperature = maxTemp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 25,
        right: 25,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ... Autres widgets ...
          StreamBuilder<double>(
            stream: serviceTemperature.temperatureUpdates,
            builder: (context, snapshot) {
              String temperature = 'Chargement...';
              if (snapshot.connectionState == ConnectionState.waiting) {
                temperature = 'Chargement...';
              } else if (snapshot.hasError) {
                temperature = 'Erreur: ${snapshot.error}';
              } else if (snapshot.hasData) {
                temperature = '${snapshot.data!.toStringAsFixed(2)}°C';
              }
              return Text(
                temperature,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              );
            },
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Min | Max',
                    style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
                  ),
                  Text(
                    '${minTemperature.toStringAsFixed(1)}° | ${maxTemperature.toStringAsFixed(1)}°',
                    style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
              Image.asset(
                'assets/page-1/images/sun-Y1q.png',
                width: 100,
                height: 100,
              ),
            ],
          ),
          SizedBox(height: 150),


        ],
      ),

    );
  }
}






































import 'package:flutter/material.dart';
import 'package:projetflutter/bloc/location_bloc.dart';
import 'package:projetflutter/service/temperature_service.dart';

class HeaderSection extends StatefulWidget {
  @override
  _HeaderSectionState createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  final LocationBloc locationBloc = LocationBloc();
  final ServiceTemperature serviceTemperature = ServiceTemperature();

  @override
  void initState() {
    super.initState();
    locationBloc.determinePosition();
  }

  @override
  void dispose() {
    locationBloc.dispose();
    serviceTemperature.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 25,
        right: 25,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ... Autres widgets ...

          StreamBuilder<double>(
            stream: serviceTemperature.temperatureUpdates,
            builder: (context, snapshot) {
              String temperature = 'Chargement...';
              if (snapshot.connectionState == ConnectionState.waiting) {
                temperature = 'Chargement...';
              } else if (snapshot.hasError) {
                temperature = 'Erreur: ${snapshot.error}';
              } else if (snapshot.hasData) {
                temperature = '${snapshot.data!.toStringAsFixed(2)}°C';
              }
              return Text(
                temperature,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              );
            },
          ),

          // ... Reste du code ...
        ],
      ),
    );
  }
}

