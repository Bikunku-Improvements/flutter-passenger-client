import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapRemoteDataSource {
  Future<PolylineResult> getRouteBetweenCoordinates(LatLng source, LatLng dest);
}

class MapRemoteDataSourceImpl implements MapRemoteDataSource {
  final String _googleMapsAPIKey = "AIzaSyDwsrdg0JBptnRpWs8O465B1jVCsHGtZF8";

  final PolylinePoints _polylinePoints;

  MapRemoteDataSourceImpl(this._polylinePoints);

  @override
  Future<PolylineResult> getRouteBetweenCoordinates(
      LatLng src, LatLng dest) async {
    return await _polylinePoints.getRouteBetweenCoordinates(
        _googleMapsAPIKey,
        PointLatLng(src.latitude, src.longitude),
        PointLatLng(dest.latitude, dest.longitude));
  }
}
