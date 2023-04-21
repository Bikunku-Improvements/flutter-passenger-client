import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  Future<File> _getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load(path);

    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.create(recursive: true);
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }

  Future<ui.Image> _getImageFromPath(String imagePath) async {
    File imageFile = await _getImageFileFromAssets(imagePath);

    Uint8List imageBytes = imageFile.readAsBytesSync();

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
}
