import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:passenger_client/homepage/blocs/map_state.dart';
import 'package:passenger_client/homepage/domain/map_service.dart';
import 'package:path_provider/path_provider.dart';

const routeMapToIconPath = {
  'blue': 'assets/icons/blue-terminal.png',
  'red': 'assets/icons/red-terminal.png',
  'mix': 'assets/icons/mix-terminal.png'
};

class MapCubit extends Cubit<MapState> {
  final MapService _mapService;

  MapCubit(this._mapService) : super(const MapState());

  // ----- LOGIC FOR INITIALIZING LOCATION MARKERS -----
  void initTerminalLocationMarkers() async {
    final response = _mapService.getTerminalLocations("mix");

    Set<Marker> terminalLocationMarkers =
        (await Future.wait(response.map((terminalLocation) async {
      BitmapDescriptor markerIcon = await _getMarkerIcon(
          routeMapToIconPath[terminalLocation.route]!, terminalLocation.name);
      return Marker(
          markerId: MarkerId(
              '${terminalLocation.name}-${terminalLocation.route}${terminalLocation.multiplier != null ? "-${terminalLocation.multiplier}" : ""}'),
          position: terminalLocation.latLng,
          icon: markerIcon);
    })))
            .toSet();

    emit(state.copyWith(terminalLocationMarkers: terminalLocationMarkers));
  }

  Future<BitmapDescriptor> _createCustomMarkerBitmapWithNameAndImage(
      String imagePath, String name) async {
    const imageSize = Size(83, 103);
    TextSpan span = TextSpan(
        style: const TextStyle(
          color: Colors.black,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        text: name);

    TextPainter tp = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    tp.layout();

    ui.PictureRecorder recorder = ui.PictureRecorder();
    Canvas canvas = Canvas(recorder);

    bool isTextWiderThanImage = tp.size.width > imageSize.width;
    // add text to align with canvas
    tp.paint(
        canvas,
        Offset(isTextWiderThanImage ? 0 : (imageSize.width - tp.size.width) / 2,
            0));

    // setup the oval to put the image in
    Rect oval = Rect.fromLTWH(
        isTextWiderThanImage ? (tp.size.width - imageSize.width) / 2 : 0,
        50,
        imageSize.width,
        imageSize.height);

    // add path to oval image
    canvas.clipPath(Path()..addOval(oval));

    ui.Image image = await _getImageFromPath(imagePath);
    paintImage(canvas: canvas, image: image, rect: oval, fit: BoxFit.fitWidth);

    ui.Picture p = recorder.endRecording();
    ByteData pngBytes = (await (await p.toImage(
            max(oval.size.width.toInt(), tp.size.width.toInt()),
            oval.size.width.toInt() + tp.size.width.toInt() + 50))
        .toByteData(format: ui.ImageByteFormat.png))!;

    Uint8List data = Uint8List.view(pngBytes.buffer);

    return BitmapDescriptor.fromBytes(data);
  }

  Future<Uint8List> _getBytesFromAsset(
    String path,
  ) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  Future<ui.Image> _getImageFromPath(String imagePath) async {
    Uint8List imageBytes = await _getBytesFromAsset(imagePath);

    final Completer<ui.Image> completer = Completer();

    ui.decodeImageFromList(imageBytes, (ui.Image img) {
      return completer.complete(img);
    });

    return completer.future;
  }

  Future<BitmapDescriptor> _getMarkerIcon(String? image, String name) async {
    if (image != null) {
      return await _createCustomMarkerBitmapWithNameAndImage(image, name);
    } else {
      return BitmapDescriptor.defaultMarker;
    }
  }
  // ----- END FOR LOGIC FOR INITIALIZING LOCATION MARKERS -----

  // ----- LOGIC FOR INITIALIZING POLYLINES -----
  void initRoutingPolylines(String routeType) async {
    Map<String, Color> mapRoutingTypeToColor = {
      'red': const Color.fromARGB(255, 242, 88, 88),
      'blue': const Color.fromARGB(255, 113, 168, 250),
      'blue_mix_inner': const Color.fromARGB(255, 113, 168, 250),
      'blue_mix_outer': const Color.fromARGB(255, 113, 168, 250)
    };

    PolylinePoints polylinePoints = PolylinePoints();
    Set<Polyline> polylines = {};

    // TODO: Put this in secret env
    String googleMapsAPIKey = "AIzaSyDwsrdg0JBptnRpWs8O465B1jVCsHGtZF8";

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

    emit(state.copyWith(polylines: polylines));
  }
  // ----- END FOR LOGIC FOR INITIALIZING POLYLINES -----
}
