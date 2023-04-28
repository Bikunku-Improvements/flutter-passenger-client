import 'package:google_maps_flutter/google_maps_flutter.dart';

class TerminalLocation {
  final String name;
  final LatLng latLng;
  final String route;
  final int? multiplier;

  TerminalLocation(this.name, this.latLng, this.route, [this.multiplier]);

  @override
  String toString() {
    return 'TerminalLocation(name: $name, latLng: $latLng, route: $route, multiplier: $multiplier)';
  }
}
