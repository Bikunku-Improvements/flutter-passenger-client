// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Bikun {
  final int id;
  final int number;
  final double lat;
  final double long;
  final bool isActive;
  final DateTime timestamp;

  Bikun({
    required this.id,
    required this.number,
    required this.lat,
    required this.long,
    required this.isActive,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'number': number,
      'lat': lat,
      'long': long,
      'isActive': isActive,
      'timestamp': timestamp,
    };
  }

  factory Bikun.fromMap(Map<String, dynamic> map) {
    return Bikun(
        id: map['id'] as int,
        number: map['number'] as int,
        lat: map['lat'].toDouble() as double,
        long: map['long'].toDouble() as double,
        isActive: map['isActive'] as bool,
        timestamp: DateTime.parse(map['Timestamp'].toString()));
  }

  String toJson() => json.encode(toMap());

  factory Bikun.fromJson(String source) =>
      Bikun.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => toMap().toString();
}
