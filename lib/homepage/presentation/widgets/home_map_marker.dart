import 'package:google_maps_flutter/google_maps_flutter.dart';

Marker homeMapMarker(
    LatLng position, String markerIdValue, BitmapDescriptor icon) {
  return Marker(
      markerId: MarkerId(markerIdValue), position: position, icon: icon);
}
