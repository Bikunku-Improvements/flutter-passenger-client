import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get_it/get_it.dart';
import 'package:passenger_client/homepage/data/datasources/bikun_remote_data_source.dart';
import 'package:passenger_client/homepage/data/datasources/bikun_remote_data_source_firebase_impl.dart';
import 'package:passenger_client/homepage/data/datasources/bikun_remote_data_source_grpc_impl.dart';
import 'package:passenger_client/homepage/data/datasources/bikun_remote_data_source_websocket_impl.dart';
import 'package:passenger_client/homepage/data/datasources/map_local_data_source.dart';
import 'package:passenger_client/homepage/data/datasources/map_remote_data_source.dart';
import 'package:passenger_client/homepage/data/repositories/bikun_repository_impl.dart';
import 'package:passenger_client/homepage/data/repositories/map_repository_impl.dart';
import 'package:passenger_client/homepage/domain/repositories/bikun_repository.dart';
import 'package:passenger_client/homepage/domain/repositories/map_repository.dart';
import 'package:passenger_client/homepage/domain/services/bikun_service.dart';
import 'package:passenger_client/homepage/domain/services/map_service.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  locator.registerSingleton<MapLocalDataSource>(MapLocalDataSourceImpl());
  locator.registerSingleton<MapRemoteDataSource>(
      MapRemoteDataSourceImpl(PolylinePoints()));
  locator.registerSingleton<MapRepository>(MapRepositoryImpl(
      locator<MapLocalDataSource>(), locator<MapRemoteDataSource>()));
  locator.registerSingleton<MapService>(MapService(locator<MapRepository>()));

  // MS: Change this if the tracking is changed
  locator.registerSingleton<BikunRemoteDataSource>(
      BikunRemoteDataSourceGrpcImpl());

  locator.registerSingleton<BikunRepository>(
      BikunRepositoryImpl(locator<BikunRemoteDataSource>()));
  locator.registerSingleton<BikunService>(
      BikunService(locator<BikunRepository>()));

  locator.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
}
