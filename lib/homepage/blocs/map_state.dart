import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapState extends Equatable {
  final Map<String, Marker> markers;
  final Set<Polyline> polylines;

  const MapState({
    this.markers = const {},
    this.polylines = const {},
  });

  MapState copyWith({
    Map<String, Marker>? markers,
    Set<Polyline>? polylines,
  }) =>
      MapState(
          markers: markers ?? this.markers,
          polylines: polylines ?? this.polylines);

  @override
  List<Object?> get props => [markers, polylines];
}
