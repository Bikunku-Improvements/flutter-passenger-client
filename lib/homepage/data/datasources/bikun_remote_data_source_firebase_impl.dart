// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:passenger_client/homepage/data/datasources/bikun_remote_data_source.dart';
import 'package:passenger_client/homepage/data/models/bikun.dart';
import 'package:passenger_client/homepage/locator.dart';

// TODO: where tf do i put this
class Bus {
  final int number;
  final bool isActive;

  Bus({
    required this.number,
    required this.isActive,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'number': number,
      'isActive': isActive,
    };
  }

  factory Bus.fromMap(Map<String, dynamic> map) {
    return Bus(
      number: map['number'] as int,
      isActive: map['is_active'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Bus.fromJson(String source) =>
      Bus.fromMap(json.decode(source) as Map<String, dynamic>);
}

class BusLocation {
  final int busId;
  final double latitude;
  final double longitude;
  final DateTime timestamp;

  BusLocation({
    required this.busId,
    required this.latitude,
    required this.longitude,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'busId': busId,
      'latitude': latitude,
      'longitude': longitude,
      'timestamp': timestamp.millisecondsSinceEpoch,
    };
  }

  factory BusLocation.fromMap(Map<String, dynamic> map) {
    return BusLocation(
      busId: map['bus_id'] as int,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      timestamp:
          DateTime.parse((map['timestamp'] as Timestamp).toDate().toString()),
    );
  }

  String toJson() => json.encode(toMap());

  factory BusLocation.fromJson(String source) =>
      BusLocation.fromMap(json.decode(source) as Map<String, dynamic>);
}

class BikunRemoteDataSourceFirebaseImpl implements BikunRemoteDataSource {
  @override
  Future<void> close() async {
    // do nothing, just need to cancel the subscription
  }

  @override
  Stream<List<Bikun>> getListAllBikunChannel() async* {
    var db = locator<FirebaseFirestore>();

    // TODO: Rework this, might be missing something because all of this below doesn't execute --"

    var collectionBusRef = db.collection('buses');
    await for (var response in collectionBusRef.snapshots()) {
      Map<int, Bus> busMap = {};

      for (var doc in response.docs) {
        Bus bus = Bus.fromMap(doc.data());
        busMap[int.parse(doc.id)] = bus;
      }

      List<Bikun> bikunList = [];

      var collectionLocationRef = db
          .collection("bus_locations")
          .orderBy("timestamp", descending: true)
          .limit(1);
      await for (var response in collectionLocationRef.snapshots()) {
        for (var doc in response.docs) {
          BusLocation location = BusLocation.fromMap(doc.data());
          Bus? bus = busMap[location.busId];
          if (bus != null) {
            bikunList.add(Bikun(
                id: location.busId,
                isActive: bus.isActive,
                lat: location.latitude,
                long: location.latitude,
                number: bus.number,
                timestamp: location.timestamp));
          }
        }

        print("bikunList: $bikunList");

        yield* Stream.value(bikunList);
      }
    }
  }
}
