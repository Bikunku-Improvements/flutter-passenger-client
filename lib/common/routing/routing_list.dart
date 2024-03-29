import 'package:google_maps_flutter/google_maps_flutter.dart';

List<LatLng> routingRedOnly = [
  const LatLng(-6.348373127525387, 106.8297679527903),
  const LatLng(-6.366114158411598, 106.82167086626085),
  const LatLng(-6.348373127525387, 106.8297679527903),
];

List<LatLng> routingBlueOnly = [
  const LatLng(-6.348373127525387, 106.8297679527903),
  const LatLng(-6.366780044175628, 106.82385382123188),
  const LatLng(-6.370075618390656, 106.8308615746626),
  const LatLng(-6.348373127525387, 106.8297679527903),
];

List<LatLng> routingBlueMixInnerRingRoad = [
  const LatLng(-6.363249883988263, 106.83174734707103),
  const LatLng(-6.348373127525387, 106.8297679527903),
  const LatLng(-6.363249883988263, 106.83174734707103),
];

List<LatLng> routingBlueMixOuterRingRoad = [
  const LatLng(-6.362850786328479, 106.83116675399012),
  const LatLng(-6.366780044175628, 106.82385382123188),
  const LatLng(-6.370075618390656, 106.8308615746626),
  const LatLng(-6.362850786328479, 106.83116675399012),
];

Map<String, List<LatLng>> mapRoutingTypeToList = {
  'red': routingRedOnly,
  'blue': routingBlueOnly,
  'blue_mix_outer': routingBlueMixOuterRingRoad,
  'blue_mix_inner': routingBlueMixInnerRingRoad
};
