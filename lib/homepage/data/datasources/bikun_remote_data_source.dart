import 'package:passenger_client/homepage/data/models/bikun.dart';

abstract class BikunRemoteDataSource {
  Stream<Bikun> getNewBikunChannel();
  Future<void> close();
}
