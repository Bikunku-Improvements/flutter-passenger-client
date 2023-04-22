// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:passenger_client/homepage/data/bikun_api.dart';

import 'bikun.dart';

class BikunRepository {
  final BikunApi _bikunApi;

  BikunRepository(
    this._bikunApi,
  );

  Stream<List<Bikun>> getAllBikun() {
    return _bikunApi.getListAllBikunChannel();
  }

  Future<void> closeBikunkuStream() async {
    _bikunApi.closeBikunkuWebSocketChannel();
  }
}
