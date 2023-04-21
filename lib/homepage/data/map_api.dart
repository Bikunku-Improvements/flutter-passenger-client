import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:passenger_client/common/terminals/terminal_list.dart';
import 'package:passenger_client/homepage/data/terminal_location.dart';

import '../../common/routing/routing_list.dart';

class MapApi {
  static List<TerminalLocation> listTerminalLocations(String route) {
    if (route == 'red') {
      return terminalRed;
    } else if (route == 'blue') {
      return terminalBlue;
    } else {
      return terminalRed + terminalBlue + terminalMix;
    }
  }

  static List<LatLng> listRouting(String routingType) {
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
}
