import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapState extends Equatable {
  final Set<Marker> terminalLocationMarkers;
  final Set<Polyline> polylines;

  const MapState({
    this.terminalLocationMarkers = const {},
    this.polylines = const {},
  });

  MapState copyWith({
    Set<Marker>? terminalLocationMarkers,
    Set<Polyline>? polylines,
  }) =>
      MapState(
          terminalLocationMarkers:
              terminalLocationMarkers ?? this.terminalLocationMarkers,
          polylines: polylines ?? this.polylines);

  @override
  List<Object?> get props => [terminalLocationMarkers, polylines];
}
