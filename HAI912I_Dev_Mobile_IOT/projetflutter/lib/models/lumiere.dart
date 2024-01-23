class Luminosity {
  final int id;
  final double value;
  final DateTime timestamp;

  Luminosity({required this.id, required this.value, required this.timestamp});

  // Convertir une Map en un objet Luminosity
  factory Luminosity.fromMap(Map<String, dynamic> map) {
    return Luminosity(
      id: map['id'],
      value: map['value'],
      timestamp: DateTime.parse(map['timestamp']),
    );
  }

  // Convertir un objet Luminosity en Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'value': value,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
