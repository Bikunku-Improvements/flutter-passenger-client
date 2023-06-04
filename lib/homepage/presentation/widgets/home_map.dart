import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:passenger_client/homepage/blocs/map_state.dart';

import '../../blocs/map_cubit.dart';

class HomeMap extends StatefulWidget {
  const HomeMap({super.key});

  @override
  State<HomeMap> createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {
  late GoogleMapController mapController;
  late MapCubit _mapCubit;

  final String routeType = "mix";

  // MS: Koordinat Stasiun UI
  final LatLng _center = const LatLng(-6.361046716889507, 106.8317240044786);

  @override
  void initState() {
    _mapCubit = BlocProvider.of<MapCubit>(context);
    _mapCubit.initTerminalLocationMarkers();
    _mapCubit.initRoutingPolylines(routeType);
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    changeMapMode(mapController);
  }

  // ----- LOGIC FOR GMAPS STYLE JSON  -----
  void changeMapMode(GoogleMapController mapController) {
    getJsonFile("assets/json/map_style.json")
        .then((value) => setMapStyle(value, mapController));
  }

  // helper function
  void setMapStyle(String mapStyle, GoogleMapController mapController) {
    mapController.setMapStyle(mapStyle);
  }

  // helper function
  Future<String> getJsonFile(String path) async {
    ByteData byte = await rootBundle.load(path);
    var list = byte.buffer.asUint8List(byte.offsetInBytes, byte.lengthInBytes);
    return utf8.decode(list);
  }
  // ----- END FOR LOGIC FOR GMAPS STYLE JSON  -----

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (mapContext, mapState) {
        return GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(target: _center, zoom: 17),
          markers: mapState.markers.values.toSet(),
          zoomControlsEnabled: false,
          polylines: mapState.polylines,
          myLocationEnabled: false,
          myLocationButtonEnabled: false,
        );
      },
    );
  }
}
