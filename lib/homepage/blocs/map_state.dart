import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapState extends Equatable {
  final Set<Marker> terminalLocationMarkers;

  const MapState({
    this.terminalLocationMarkers = const {},
  });

  MapState copyWith({
    Set<Marker>? terminalLocationMarkers,
  }) =>
      MapState(
          terminalLocationMarkers:
              terminalLocationMarkers ?? this.terminalLocationMarkers);

  @override
  List<Object?> get props => [
        terminalLocationMarkers,
      ];
}
