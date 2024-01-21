

class Temperature {
  final int id;
  final double value;
  final DateTime timestamp;

  Temperature({required this.id, required this.value, required this.timestamp});

  // Convertir une Map en un objet Temperature
  factory Temperature.fromMap(Map<String, dynamic> map) {
    return Temperature(
      id: map['id'],
      value: map['value'],
      timestamp: DateTime.parse(map['timestamp']),
    );
  }
}