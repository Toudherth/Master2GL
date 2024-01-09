class TemperatureData {
  final int id;
  final double temperature;
  final double minTemperature;
  final double maxTemperature;
  final DateTime date;

  TemperatureData({
    required this.id,
    required this.temperature,
    required this.minTemperature,
    required this.maxTemperature,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'temperature': temperature,
      'minTemperature': minTemperature,
      'maxTemperature': maxTemperature,
      'date': date.toIso8601String(),
    };
  }

  static TemperatureData fromMap(Map<String, dynamic> map) {
    return TemperatureData(
      id: map['id'],
      temperature: map['temperature'],
      minTemperature: map['minTemperature'],
      maxTemperature: map['maxTemperature'],
      date: DateTime.parse(map['date']),
    );
  }
}
