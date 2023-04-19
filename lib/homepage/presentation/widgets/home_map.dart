import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:passenger_client/homepage/data/terminal_location.dart';

class HomeMap extends StatelessWidget {
  final List<Marker> listTerminalMarkers;

  const HomeMap({super.key, this.listTerminalMarkers = const []});

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        // MS: Koordinat Stasiun UI
        center: LatLng(-6.361046716889507, 106.8317240044786),
        zoom: 17,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        MarkerLayer(
          markers: [...listTerminalMarkers],
        )
      ],
    );
  }
}
