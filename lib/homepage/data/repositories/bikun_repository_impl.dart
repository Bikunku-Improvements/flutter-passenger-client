import 'package:passenger_client/homepage/data/datasources/bikun_remote_data_source.dart';
import 'package:passenger_client/homepage/data/models/bikun.dart';
import 'package:passenger_client/homepage/domain/repositories/bikun_repository.dart';

class BikunRepositoryImpl implements BikunRepository {
  final BikunRemoteDataSource _bikunRemoteDataSource;

  BikunRepositoryImpl(this._bikunRemoteDataSource);

  @override
  Future<void> closeBikunkuStream() async {
    _bikunRemoteDataSource.close();
  }

  @override
  Stream<Bikun> getNewBikun() {
    return _bikunRemoteDataSource.getNewBikunChannel();
  }
}
