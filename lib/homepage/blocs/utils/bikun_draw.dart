import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:passenger_client/common/colors/colors.dart';

// ----- LOGIC FOR INITIALIZING BIKUN MARKERS -----
Future<BitmapDescriptor> _createCustomMarkerBitmapWithText(
    String imagePath, String text, Color textBgColor) async {
  const imageSize = Size(107, 99);

  ui.PictureRecorder recorder = ui.PictureRecorder();
  Canvas canvas = Canvas(recorder);

  Rect imageRect = Rect.fromLTWH(0, 0, imageSize.width, imageSize.height);

  canvas.clipPath(Path()..addRect(imageRect));

  ui.Image image = await _getImageFromPath(imagePath);
  paintImage(
      canvas: canvas, image: image, rect: imageRect, fit: BoxFit.fitWidth);

  TextSpan span = TextSpan(
      style: const TextStyle(
          color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600),
      text: text);

  TextPainter tp = TextPainter(
    text: span,
    textAlign: TextAlign.center,
    textDirection: TextDirection.ltr,
  );

  tp.layout();

  Paint textBgBoxPaint = Paint()..color = AppColors.primaryBlue;
  Rect textRect = const Rect.fromLTWH(67, 0, 40, 40);

  canvas.drawRRect(RRect.fromRectAndRadius(textRect, const Radius.circular(20)),
      textBgBoxPaint);

  tp.paint(canvas, const Offset(77, 3));

  ui.Picture p = recorder.endRecording();
  ByteData pngBytes = (await (await p.toImage(107, 93))
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

Future<BitmapDescriptor> getMarkerIcon(
    String image, String text, Color textBgColor) async {
  return await _createCustomMarkerBitmapWithText(image, text, textBgColor);
}
  // ----- END FOR LOGIC FOR INITIALIZING BIKUN MARKERS -----
