import 'package:passenger_client/homepage/data/map_api.dart';
import 'package:passenger_client/homepage/data/terminal_api.dart';
import 'package:passenger_client/homepage/data/terminal_location.dart';

class MapRepository {
  MapRepository();

  List<TerminalLocation> listTerminallocations(String route) {
    return MapApi.listTerminalLocations(route);
  }
}
