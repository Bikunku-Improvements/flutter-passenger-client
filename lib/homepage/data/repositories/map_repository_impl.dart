import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:passenger_client/homepage/data/datasources/map_remote_data_source.dart';

import 'package:passenger_client/homepage/data/datasources/map_local_data_source.dart';
import 'package:passenger_client/homepage/data/models/terminal_location.dart';
import 'package:passenger_client/homepage/domain/repositories/map_repository.dart';

class MapRepositoryImpl implements MapRepository {
  final MapLocalDataSource _mapLocalDataSource;
  final MapRemoteDataSource _mapRemoteDataSource;

  MapRepositoryImpl(this._mapLocalDataSource, this._mapRemoteDataSource);

  @override
  List<LatLng> listRoutingsFromRouteType(String routeType) {
    return _mapLocalDataSource.listRouting(routeType);
  }

  @override
  List<TerminalLocation> listTerminalLocations(String route) {
    return _mapLocalDataSource.listTerminalLocations(route);
  }

  @override
  Future<PolylineResult> getRouteBetweenCoordinates(
      LatLng src, LatLng dest) async {
    return await _mapRemoteDataSource.getRouteBetweenCoordinates(src, dest);
  }
}
