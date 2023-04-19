import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:passenger_client/common/routing/routing_list.dart';
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

  final Set<Polyline> _polylines = {};
  final String routeType = "mix";
  PolylinePoints polylinePoints = PolylinePoints();
  // TODO: Put this in secret env
  String googleMapsAPIKey = "AIzaSyDwsrdg0JBptnRpWs8O465B1jVCsHGtZF8";

  // MS: Koordinat Stasiun UI
  final LatLng _center = const LatLng(-6.361046716889507, 106.8317240044786);

  @override
  void initState() {
    _mapCubit = BlocProvider.of<MapCubit>(context);
    _mapCubit.initTerminalLocation();
    addCustomTerminalIcons();
    setPolylines();
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    changeMapMode(mapController);
  }

  // ----- LOGIC FOR MARKER ICONS -----
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
  // ----- END FOR LOGIC FOR MARKER ICONS -----

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

  // ----- LOGIC FOR POLYLINES DRAWING -----
  void setPolylines() async {
    List<LatLng> polylineCoordinates = [];
    for (var i = 0; i < routingRedOnly.length - 1; i++) {
      LatLng src = routingRedOnly[i];
      LatLng dest = routingRedOnly[i + 1];
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
          googleMapsAPIKey,
          PointLatLng(src.latitude, src.longitude),
          PointLatLng(dest.latitude, dest.longitude));
      if (result.points.isNotEmpty) {
        for (var point in result.points) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        }
      }
    }
    setState(() {
      Polyline polyline = Polyline(
          polylineId: const PolylineId("red"),
          color: const Color.fromARGB(255, 242, 88, 88),
          width: 4,
          points: polylineCoordinates);
      _polylines.add(polyline);
    });
  }
  // ----- END FOR LOGIC FOR POLYLINES DRAWING -----

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
          polylines: _polylines,
        );
      },
    );
  }
}
