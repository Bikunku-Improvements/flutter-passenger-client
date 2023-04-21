import 'package:get_it/get_it.dart';
import 'package:passenger_client/homepage/data/map_repository.dart';
import 'package:passenger_client/homepage/domain/map_service.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  locator.registerSingleton<MapRepository>(MapRepository());
  locator.registerSingleton<MapService>(MapService(locator<MapRepository>()));
}
