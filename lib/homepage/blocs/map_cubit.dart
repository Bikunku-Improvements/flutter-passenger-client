import 'package:bloc/bloc.dart';
import 'package:passenger_client/homepage/blocs/map_state.dart';
import 'package:passenger_client/homepage/domain/map_service.dart';

class MapCubit extends Cubit<MapState> {
  final MapService _mapService;

  MapCubit(this._mapService) : super(const MapState());

  void initTerminalLocation() {
    final response = _mapService.getTerminalLocations("mix");
    emit(state.copyWith(terminalLocationList: response));
  }
}
