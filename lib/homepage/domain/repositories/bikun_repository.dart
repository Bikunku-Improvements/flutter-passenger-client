import 'package:passenger_client/homepage/data/models/bikun.dart';

abstract class BikunRepository {
  Stream<List<Bikun>> getAllBikun();
  Future<void> closeBikunkuStream();
}
