import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ----- LOGIC FOR DRAWING LOCATION MARKERS -----
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
      Offset(
          isTextWiderThanImage ? 0 : (imageSize.width - tp.size.width) / 2, 0));

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

Future<BitmapDescriptor> getMarkerIcon(String? image, String name) async {
  if (image != null) {
    return await _createCustomMarkerBitmapWithNameAndImage(image, name);
  } else {
    return BitmapDescriptor.defaultMarker;
  }
}
// ----- END FOR LOGIC FOR DRAWING LOCATION MARKERS -----

