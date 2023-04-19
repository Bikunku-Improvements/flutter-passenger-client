import 'package:google_maps_flutter/google_maps_flutter.dart';

class TerminalLocation {
  final String name;
  final LatLng latLng;
  final String route;

  TerminalLocation(this.name, this.latLng, this.route);
}
