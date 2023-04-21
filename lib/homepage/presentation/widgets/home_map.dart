import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:passenger_client/common/routing/routing_list.dart';
import 'package:passenger_client/homepage/blocs/map_state.dart';
import 'package:path_provider/path_provider.dart';

import '../../blocs/map_cubit.dart';

class HomeMap extends StatefulWidget {
  const HomeMap({super.key});

  @override
  State<HomeMap> createState() => _HomeMapState();
}

const Map<String, List<String>> mapRouteTypeToRoutingType = {
  'mix': [
    'red',
    'blue_mix_inner',
    'blue_mix_outer',
  ],
  'red': ['red'],
  'blue': ['blue']
};

Map<String, List<LatLng>> mapRoutingTypeToList = {
  'red': routingRedOnly,
  'blue': routingBlueOnly,
  'blue_mix_outer': routingBlueMixOuterRingRoad,
  'blue_mix_inner': routingBlueMixInnerRingRoad
};

Map<String, Color> mapRoutingTypeToColor = {
  'red': const Color.fromARGB(255, 242, 88, 88),
  'blue': const Color.fromARGB(255, 113, 168, 250),
  'blue_mix_inner': const Color.fromARGB(255, 113, 168, 250),
  'blue_mix_outer': const Color.fromARGB(255, 113, 168, 250)
};

class _HomeMapState extends State<HomeMap> {
  late GoogleMapController mapController;
  late MapCubit _mapCubit;

  Set<Polyline> _polylines = {};
  final String routeType = "mix";
  PolylinePoints polylinePoints = PolylinePoints();
  // TODO: Put this in secret env
  String googleMapsAPIKey = "AIzaSyDwsrdg0JBptnRpWs8O465B1jVCsHGtZF8";

  // MS: Koordinat Stasiun UI
  final LatLng _center = const LatLng(-6.361046716889507, 106.8317240044786);

  @override
  void initState() {
    _mapCubit = BlocProvider.of<MapCubit>(context);
    _mapCubit.initTerminalLocationMarkers();
    setPolylines();
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

  // ----- LOGIC FOR POLYLINES DRAWING -----
  void setPolylines() async {
    List<String> routingTypes = mapRouteTypeToRoutingType[routeType]!;
    List<List<LatLng>> routingListOfList = routingTypes
        .map((routingType) => mapRoutingTypeToList[routingType]!)
        .toList();

    Set<Polyline> polylines = {};

    for (var i = 0; i < routingListOfList.length; i++) {
      String routingType = routingTypes[i];
      List<LatLng> routingList = routingListOfList[i];
      List<LatLng> polylineCoordinates = [];
      for (var j = 0; j < routingList.length - 1; j++) {
        LatLng src = routingList[j];
        LatLng dest = routingList[j + 1];
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
      polylines.add(Polyline(
          polylineId: PolylineId(routingType),
          color: mapRoutingTypeToColor[routingType]!,
          width: 4,
          patterns: routingType == "blue_mix_inner" && routeType == 'mix'
              ? [
                  PatternItem.dash(15),
                  PatternItem.gap(30),
                ]
              : [],
          points: polylineCoordinates));
    }

    setState(() {
      _polylines = polylines;
    });
  }
  // ----- END FOR LOGIC FOR POLYLINES DRAWING -----

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        return GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(target: _center, zoom: 18),
          markers: state.terminalLocationMarkers,
          zoomControlsEnabled: false,
          polylines: _polylines,
        );
      },
    );
  }
}
