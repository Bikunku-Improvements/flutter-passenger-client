import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:passenger_client/homepage/data/models/terminal_location.dart';
import 'package:passenger_client/homepage/domain/repositories/map_repository.dart';

class MapService {
  final MapRepository _repository;

  MapService(this._repository);

  List<TerminalLocation> getTerminalLocations(String route) {
    return _repository.listTerminalLocations(route);
  }

  List<String> listRoutingTypesFromRouteType(String routeType) {
    if (routeType == 'red') {
      return ['red'];
    } else if (routeType == 'blue') {
      return ['blue'];
    } else {
      return ['red', 'blue_mix_inner', 'blue_mix_outer'];
    }
  }

  List<List<LatLng>> listRoutingsFromRouteType(String routeType) {
    List<String> routingTypes = listRoutingTypesFromRouteType(routeType);
    return routingTypes
        .map(
            (routingType) => _repository.listRoutingsFromRouteType(routingType))
        .toList();
  }

  Future<PolylineResult> getRouteBetweenCoordinates(
      LatLng src, LatLng dest) async {
    return await _repository.getRouteBetweenCoordinates(src, dest);
  }
}
