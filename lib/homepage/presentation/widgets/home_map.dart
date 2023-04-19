import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:passenger_client/homepage/blocs/map_state.dart';
import 'package:passenger_client/homepage/presentation/widgets/home_map_marker.dart';

import '../../blocs/map_cubit.dart';

class HomeMap extends StatefulWidget {
  const HomeMap({super.key});

  @override
  State<HomeMap> createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {
  late GoogleMapController mapController;
  late Map<String, BitmapDescriptor> terminalIcons;

  late MapCubit _mapCubit;

  // MS: Koordinat Stasiun UI
  final LatLng _center = const LatLng(-6.361046716889507, 106.8317240044786);

  @override
  void initState() {
    _mapCubit = BlocProvider.of<MapCubit>(context);
    _mapCubit.initTerminalLocation();
    addCustomTerminalIcons();
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    changeMapMode(mapController);
  }

  void addCustomTerminalIcons() async {
    Map<String, BitmapDescriptor> newTerminalIcons = {
      'blue': await BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(size: Size(50, 50)),
          'assets/icons/blue-terminal.png'),
      'red': await BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(size: Size(50, 50)),
          'assets/icons/red-terminal.png'),
      'mix': await BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(size: Size(50, 50)),
          'assets/icons/mix-terminal.png'),
    };
    setState(() {
      terminalIcons = newTerminalIcons;
    });
  }

//this is the function to load custom map style json
  void changeMapMode(GoogleMapController mapController) {
    getJsonFile("assets/json/map_style.json")
        .then((value) => setMapStyle(value, mapController));
  }

  //helper function
  void setMapStyle(String mapStyle, GoogleMapController mapController) {
    mapController.setMapStyle(mapStyle);
  }

  //helper function
  Future<String> getJsonFile(String path) async {
    ByteData byte = await rootBundle.load(path);
    var list = byte.buffer.asUint8List(byte.offsetInBytes, byte.lengthInBytes);
    return utf8.decode(list);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        Set<Marker> terminalLocationMarkers = state.terminalLocationList
            .map((terminalLocation) => homeMapMarker(
                terminalLocation.latLng,
                "${terminalLocation.name}-${terminalLocation.route}",
                terminalIcons[terminalLocation.route]!))
            .toSet();
        return GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(target: _center, zoom: 17),
          markers: terminalLocationMarkers,
          zoomControlsEnabled: false,
        );
      },
    );
  }
}
