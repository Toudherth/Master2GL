import 'package:flutter/material.dart';
import 'package:projetflutter/bloc/location_bloc.dart';
import 'package:projetflutter/models/locationstate.dart';




class HeaderSection extends StatefulWidget {
  @override
  _HeaderSectionState createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  final LocationBloc locationBloc = LocationBloc();

  @override
  void initState() {
    super.initState();
    locationBloc.determinePosition();
  }

  @override
  void dispose() {
    locationBloc.dispose();
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
          SizedBox(height: 50),
          StreamBuilder<String>(
            stream: locationBloc.locationStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('Chargement de la localisation...',
                    style: Theme.of(context).textTheme.headline3?.copyWith(color: Colors.white));
              } else if (snapshot.hasError) {
                return Text('Erreur de localisation: ${snapshot.error}',
                    style: Theme.of(context).textTheme.headline3?.copyWith(color: Colors.white));
              } else if (snapshot.hasData) {
                return Text(snapshot.data ?? 'Localisation non disponible',
                    style: Theme.of(context).textTheme.headline3?.copyWith(color: Colors.white));
              } else {
                return Text('Localisation non disponible',
                    style: Theme.of(context).textTheme.headline3?.copyWith(color: Colors.white));
              }
            },
          ),
          // Reste du code...

          SizedBox(height: 30),

              // ajouter une uri de temperature
              Text(
                '30°',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white, fontSize: 40),
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
                        '12° | 24°',
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
