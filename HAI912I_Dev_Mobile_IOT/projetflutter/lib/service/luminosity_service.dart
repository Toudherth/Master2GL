import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class LuminosityService {
  final StreamController<double> _luminosityController = StreamController.broadcast();

  Stream<double> get luminosityUpdates => _luminosityController.stream;

  LuminosityService() {
    startFetchingLuminosity();
  }

  void startFetchingLuminosity() {
    Timer.periodic(Duration(seconds: 5), (timer) async {
      try {
        print("Chargement... ");
        int luminosityValue = await _fetchLuminosity();
        print("Value lumiere :  "+luminosityValue.toString());
        _luminosityController.add(luminosityValue.toDouble());
      } catch (e) {
        print("Erreur lors de la récupération de la luminosité: $e");
      }
    });
  }


  Future<int> _fetchLuminosity() async {
    final response = await http.get(Uri.parse('http://192.168.43.10/light'));
    final Map<String, dynamic> body = json.decode(response.body);
    int luminosityValue = (body['value'] as num).toInt();
    return luminosityValue;
  }


  // modifier le sueil
  Future<void> setThreshold(double threshold) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.43.10/nightModeThreshold'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },

        body: jsonEncode(<String, dynamic>{
          'threshold': threshold,
        }),
      );
      print("response "+ response.toString());

      if (response.statusCode == 200) {
        print("Seuil défini avec succès.");
      } else {
        print("Erreur lors de la définition du seuil: ${response.body}");
      }
    } catch (e) {
      print("Erreur lors de la définition du seuil: $e");
    }
  }


  // Controle de LED
  Future<void> controlLED(int cyan, int magenta, int yellow) async {
    // Construire l'URI avec les paramètres de requête
    final uri = Uri.parse('http://192.168.43.10/led')
        .replace(queryParameters: {
      'magenta': magenta.toString(),
      'cyan': cyan.toString(),
      'yellow': yellow.toString(),
    });

    try {
      print('URL de la requête: $uri');
      // Envoyer la requête POST
      final response = await http.post(uri);

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


    } catch (e) {
      print("Erreur lors du contrôle de la LED: $e");
    }
  }






/*void dispose() {
    _luminosityController.close();
  }*/
}
