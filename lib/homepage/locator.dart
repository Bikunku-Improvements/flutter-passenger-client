import 'package:get_it/get_it.dart';
import 'package:passenger_client/homepage/data/bikun_api.dart';
import 'package:passenger_client/homepage/data/bikun_repository.dart';
import 'package:passenger_client/homepage/data/map_api.dart';
import 'package:passenger_client/homepage/data/map_repository.dart';
import 'package:passenger_client/homepage/domain/bikun_service.dart';
import 'package:passenger_client/homepage/domain/map_service.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  locator.registerSingleton<MapApi>(MapApi());
  locator.registerSingleton<MapRepository>(MapRepository(locator<MapApi>()));
  locator.registerSingleton<MapService>(MapService(locator<MapRepository>()));

  locator.registerSingleton<BikunApi>(BikunApi());
  locator
      .registerSingleton<BikunRepository>(BikunRepository(locator<BikunApi>()));
  locator.registerSingleton<BikunService>(
      BikunService(locator<BikunRepository>()));
}
