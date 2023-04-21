import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:passenger_client/homepage/data/map_api.dart';
import 'package:passenger_client/homepage/data/terminal_api.dart';
import 'package:passenger_client/homepage/data/terminal_location.dart';

class MapRepository {
  MapRepository();

  List<TerminalLocation> listTerminallocations(String route) {
    return MapApi.listTerminalLocations(route);
  }

  List<LatLng> listRoutingsFromRouteType(String routeType) {
    return MapApi.listRouting(routeType);
  }
}
