import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:passenger_client/homepage/blocs/map_state.dart';
import 'package:passenger_client/homepage/domain/services/map_service.dart';

import 'package:passenger_client/homepage/blocs/utils/terminal_draw.dart'
    as terminal_marker_draw;
import 'package:passenger_client/homepage/blocs/utils/bikun_draw.dart'
    as bikun_draw;

import '../../common/colors/colors.dart';
import '../domain/services/bikun_service.dart';

const routeMapToIconPath = {
  'blue': 'assets/icons/blue-terminal.png',
  'red': 'assets/icons/red-terminal.png',
  'mix': 'assets/icons/mix-terminal.png'
};

class MapCubit extends Cubit<MapState> {
  final MapService _mapService;
  final BikunService _bikunService;

  late final StreamSubscription _streamSubscription;

  MapCubit(this._mapService, this._bikunService) : super(const MapState()) {
    _streamSubscription = _bikunService.getAllBikun().listen((bikun) async {
      final markerIdString = "bikun-with-${bikun.id}";
      final markers = Map<String, Marker>.from(state.markers);
      final oldMarker = markers[markerIdString];

      BitmapDescriptor markerIcon;

      if (oldMarker == null) {
        markerIcon = await bikun_draw.getMarkerIcon(
            bikun.isActive
                ? "assets/icons/bikun-active.png"
                : "assets/icons/bikun-inactive.png",
            bikun.isActive ? bikun.number.toString() : "x",
            bikun.isActive ? AppColors.primaryBlue : AppColors.primaryRed);
      } else {
        markerIcon = oldMarker.icon;
      }

      final newBikunMarker = Marker(
          markerId: MarkerId(markerIdString),
          position: LatLng(bikun.lat, bikun.long),
          icon: markerIcon);

      markers[markerIdString] = newBikunMarker;
      emit(state.copyWith(markers: markers));
    });
  }

  // ----- LOGIC FOR INITIALIZING TERMINAL LOCATION MARKERS -----
  void initTerminalLocationMarkers() async {
    final response = _mapService.getTerminalLocations("mix");

    final markers = Map<String, Marker>.from(state.markers);

    for (var terminalLocation in response) {
      BitmapDescriptor markerIcon = await terminal_marker_draw.getMarkerIcon(
          routeMapToIconPath[terminalLocation.route]!, terminalLocation.name);
      final markerIdString =
          '${terminalLocation.name}-${terminalLocation.route}${terminalLocation.multiplier != null ? "-${terminalLocation.multiplier}" : ""}';
      final newMarker = Marker(
          markerId: MarkerId(markerIdString),
          position: terminalLocation.latLng,
          icon: markerIcon);

      markers[markerIdString] = newMarker;
    }

    emit(state.copyWith(markers: markers));
  }
  // ----- END FOR LOGIC FOR INITIALIZING TERMINAL LOCATION MARKERS -----

  // ----- LOGIC FOR INITIALIZING POLYLINES -----
  void initRoutingPolylines(String routeType) async {
    Map<String, Color> mapRoutingTypeToColor = {
      'red': const Color.fromARGB(255, 242, 88, 88),
      'blue': const Color.fromARGB(255, 113, 168, 250),
      'blue_mix_inner': const Color.fromARGB(255, 113, 168, 250),
      'blue_mix_outer': const Color.fromARGB(255, 113, 168, 250)
    };

    Set<Polyline> polylines = {};

    List<String> routingTypes =
        _mapService.listRoutingTypesFromRouteType(routeType);
    List<List<LatLng>> routingList =
        _mapService.listRoutingsFromRouteType(routeType);

    for (var i = 0; i < routingList.length; i++) {
      String routingType = routingTypes[i];
      List<LatLng> routing = routingList[i];
      List<LatLng> polylineCoordinates = [];
      for (var j = 0; j < routing.length - 1; j++) {
        LatLng src = routing[j];
        LatLng dest = routing[j + 1];

        PolylineResult result =
            await _mapService.getRouteBetweenCoordinates(src, dest);

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

    emit(state.copyWith(polylines: polylines));
  }
  // ----- END FOR LOGIC FOR INITIALIZING POLYLINES -----

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    _bikunService.closeBikunkuStream();
    return super.close();
  }
}
