import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BikunState extends Equatable {
  final Set<Marker> bikunMarkers;

  const BikunState({this.bikunMarkers = const {}});

  BikunState copyWith({
    Set<Marker>? bikunMarkers,
  }) =>
      BikunState(bikunMarkers: bikunMarkers ?? this.bikunMarkers);

  @override
  List<Object?> get props => [bikunMarkers];
}
