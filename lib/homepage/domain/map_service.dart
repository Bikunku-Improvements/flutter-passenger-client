import 'package:passenger_client/homepage/data/map_repository.dart';
import 'package:passenger_client/homepage/data/terminal_location.dart';

class MapService {
  final MapRepository _repository;

  MapService(this._repository);

  List<TerminalLocation> getTerminalLocations(String route) {
    return _repository.listTerminallocations(route);
  }
}
