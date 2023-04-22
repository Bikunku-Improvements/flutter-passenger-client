import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:passenger_client/homepage/data/map_api.dart';
import 'package:passenger_client/homepage/data/terminal_location.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MapRepository {
  final MapApi _mapApi;

  late WebSocketChannel listAllBikunChannel;

  MapRepository(this._mapApi);

  List<TerminalLocation> listTerminallocations(String route) {
    return _mapApi.listTerminalLocations(route);
  }

  List<LatLng> listRoutingsFromRouteType(String routeType) {
    return _mapApi.listRouting(routeType);
  }
}
