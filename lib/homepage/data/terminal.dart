// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Terminal {
  final int id;
  final int distance;
  final String name;
  final String next;
  final String route;

  Terminal(this.id, this.distance, this.name, this.next, this.route);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'distance': distance,
      'name': name,
      'next': next,
      'route': route,
    };
  }

  factory Terminal.fromMap(Map<String, dynamic> map) {
    return Terminal(
      map['id'] as int,
      map['distance'] as int,
      map['name'] as String,
      map['next'] as String,
      map['route'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Terminal.fromJson(String source) =>
      Terminal.fromMap(json.decode(source) as Map<String, dynamic>);
}
