import 'package:http/http.dart' as http;
import 'dart:convert';

// faut implementer la logique de recuperation de données
// et la logique d'ajoute de données ala dbb

// ajouter la logique le seuil et reglage de LED a l'application

class RegistrationService {

  // get temperature
  void getTemperature() async{

    print("temperature called");
    const url = "";
    final uri = Uri.parse(url);

  }

  Future<void> fetchTemperature() async {
    final response = await http.get(Uri.parse('https://randomuser.me/api/?results=5'));

    if (response.statusCode == 200) {
      // Si le serveur retourne une réponse OK, parsez le JSON
      final data = jsonDecode(response.body);
      print(data);
      setState((){
        
      })

    } else {
      // Si le serveur ne retourne pas une réponse OK, affichez une erreur

    }
  }

}