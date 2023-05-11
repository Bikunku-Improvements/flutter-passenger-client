import 'package:passenger_client/homepage/data/models/bikun.dart';

abstract class BikunRemoteDataSource {
  Stream<List<Bikun>> getListAllBikunChannel();
  Future<void> close();
}
