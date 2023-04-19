import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';

const double width = 32.22;
const double height = 41;

Marker homeMapRedMarker(LatLng point, String name) {
  return Marker(
      point: point,
      width: 70,
      height: 70,
      builder: (_) => Column(
            children: [
              Text(name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              SvgPicture.asset('assets/icons/red-terminal.svg',
                  width: 50, height: 50),
            ],
          ));
}

Marker homeMapBlueMarker(LatLng point, String name) {
  return Marker(
      point: point,
      width: 70,
      height: 70,
      builder: (_) => Column(
            children: [
              Text(name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              SvgPicture.asset('assets/icons/blue-terminal.svg',
                  width: 50, height: 50),
            ],
          ));
}

Marker homeMapMixMarker(LatLng point, String name) {
  return Marker(
      point: point,
      width: 70,
      height: 70,
      builder: (_) => Column(
            children: [
              Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SvgPicture.asset('assets/icons/mix-terminal.svg',
                  width: 50, height: 50),
            ],
          ));
}
