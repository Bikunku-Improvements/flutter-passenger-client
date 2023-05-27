import 'package:passenger_client/homepage/data/models/bikun.dart';

abstract class BikunRepository {
  Stream<Bikun> getNewBikun();
  Future<void> closeBikunkuStream();
}
