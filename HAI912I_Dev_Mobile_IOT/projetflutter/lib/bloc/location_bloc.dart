import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationBloc {
  final _locationController = StreamController<String>();

  Stream<String> get locationStream => _locationController.stream;

  void dispose() {
    _locationController.close();
  }

  void determinePosition() async {
    // Votre logique pour obtenir la localisation et le géocodage inverse
    try {
      Position position = await Geolocator.getCurrentPosition();
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        _locationController.sink.add("${place.locality}, ${place.country}");
      }
    } catch (e) {
      _locationController.sink.addError('Erreur de localisation: $e');
    }
  }
}
