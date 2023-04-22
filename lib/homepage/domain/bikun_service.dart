import 'package:passenger_client/homepage/data/bikun.dart';
import 'package:passenger_client/homepage/data/bikun_repository.dart';

class BikunService {
  final BikunRepository _repository;

  BikunService(this._repository);

  Stream<List<Bikun>> getAllBikun() {
    return _repository.getAllBikun();
  }

  Future<void> closeBikunkuStream() {
    return _repository.closeBikunkuStream();
  }
}
