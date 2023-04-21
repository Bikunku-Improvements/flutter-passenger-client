import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:passenger_client/homepage/data/map_repository.dart';
import 'package:passenger_client/homepage/data/terminal_location.dart';

class MapService {
  final MapRepository _repository;

  MapService(this._repository);

  List<TerminalLocation> getTerminalLocations(String route) {
    return _repository.listTerminallocations(route);
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
}
