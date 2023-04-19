import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:passenger_client/homepage/blocs/map_cubit.dart';
import 'package:passenger_client/homepage/blocs/map_state.dart';
import 'package:passenger_client/homepage/presentation/widgets/home_map.dart';
import 'package:passenger_client/homepage/presentation/widgets/home_map_marker.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late MapCubit _mapCubit;

  @override
  void initState() {
    _mapCubit = BlocProvider.of<MapCubit>(context);
    _mapCubit.initTerminalLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        List<Marker> terminalMarkers =
            state.terminalLocationList.map((terminalLocation) {
          if (terminalLocation.route == 'red') {
            return homeMapRedMarker(
                terminalLocation.latLng, terminalLocation.name);
          } else if (terminalLocation.route == 'blue') {
            return homeMapBlueMarker(
                terminalLocation.latLng, terminalLocation.name);
          } else {
            return homeMapMixMarker(
                terminalLocation.latLng, terminalLocation.name);
          }
        }).toList();
        return HomeMap(
          listTerminalMarkers: terminalMarkers,
        );
      },
    );
  }
}
