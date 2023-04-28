import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:passenger_client/homepage/data/datasources/map_local_data_source.dart';
import 'package:passenger_client/homepage/data/models/terminal_location.dart';
import 'package:passenger_client/homepage/domain/repositories/map_repository.dart';

class MapRepositoryImpl implements MapRepository {
  final MapLocalDataSource _mapLocalDataSource;

  late WebSocketChannel listAllBikunChannel;

  MapRepositoryImpl(this._mapLocalDataSource);

  @override
  List<LatLng> listRoutingsFromRouteType(String routeType) {
    return _mapLocalDataSource.listRouting(routeType);
  }

  @override
  List<TerminalLocation> listTerminalLocations(String route) {
    return _mapLocalDataSource.listTerminalLocations(route);
  }
}
