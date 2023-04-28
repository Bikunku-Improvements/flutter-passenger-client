import 'package:get_it/get_it.dart';
import 'package:passenger_client/homepage/data/datasources/bikun_remote_data_source.dart';
import 'package:passenger_client/homepage/data/datasources/map_local_data_source.dart';
import 'package:passenger_client/homepage/data/repositories/bikun_repository_impl.dart';
import 'package:passenger_client/homepage/data/repositories/map_repository_impl.dart';
import 'package:passenger_client/homepage/domain/repositories/bikun_repository.dart';
import 'package:passenger_client/homepage/domain/repositories/map_repository.dart';
import 'package:passenger_client/homepage/domain/services/bikun_service.dart';
import 'package:passenger_client/homepage/domain/services/map_service.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  locator.registerSingleton<MapLocalDataSource>(MapLocalDataSourceImpl());
  locator.registerSingleton<MapRepository>(
      MapRepositoryImpl(locator<MapLocalDataSource>()));
  locator.registerSingleton<MapService>(MapService(locator<MapRepository>()));

  locator.registerSingleton<BikunRemoteDataSource>(BikunRemoteDataSourceImpl());
  locator.registerSingleton<BikunRepository>(
      BikunRepositoryImpl(locator<BikunRemoteDataSource>()));
  locator.registerSingleton<BikunService>(
      BikunService(locator<BikunRepository>()));
}
