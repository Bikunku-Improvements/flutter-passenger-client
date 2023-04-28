import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:passenger_client/homepage/data/models/terminal_location.dart';

abstract class MapRepository {
  List<TerminalLocation> listTerminalLocations(String route);
  List<LatLng> listRoutingsFromRouteType(String routeType);
}
