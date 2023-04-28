import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:passenger_client/common/routing/routing_list.dart';
import 'package:passenger_client/common/terminals/terminal_list.dart';
import 'package:passenger_client/homepage/data/models/terminal_location.dart';

abstract class MapLocalDataSource {
  List<TerminalLocation> listTerminalLocations(String route);
  List<LatLng> listRouting(String routingType);
}

class MapLocalDataSourceImpl implements MapLocalDataSource {
  @override
  List<LatLng> listRouting(String routingType) {
    if (routingType == 'red') {
      return routingRedOnly;
    } else if (routingType == 'blue') {
      return routingBlueOnly;
    } else if (routingType == 'blue_mix_outer') {
      return routingBlueMixOuterRingRoad;
    } else {
      return routingBlueMixInnerRingRoad;
    }
  }

  @override
  List<TerminalLocation> listTerminalLocations(String route) {
    if (route == 'red') {
      return terminalRed;
    } else if (route == 'blue') {
      return terminalBlue;
    } else {
      return terminalRed + terminalBlue + terminalMix;
    }
  }
}
