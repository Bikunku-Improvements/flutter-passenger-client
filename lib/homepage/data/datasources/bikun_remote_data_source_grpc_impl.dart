import 'package:grpc/grpc.dart';
import 'package:passenger_client/grpc/pb/location.pbgrpc.dart';
import 'package:passenger_client/homepage/data/datasources/bikun_remote_data_source.dart';
import 'package:passenger_client/homepage/data/models/bikun.dart';

import 'package:passenger_client/api/grpc/base_url.dart' as base_url;

class BikunRemoteDataSourceGrpcImpl implements BikunRemoteDataSource {
  late ClientChannel _bikunkuGrpcChannel;

  @override
  Future<void> close() async {
    await _bikunkuGrpcChannel.shutdown();
  }

  @override
  Stream<List<Bikun>> getListAllBikunChannel() async* {
    _bikunkuGrpcChannel = ClientChannel(base_url.grpcBaseUrl,
        port: 80,
        options:
            const ChannelOptions(credentials: ChannelCredentials.insecure()));

    LocationClient stub = LocationClient(_bikunkuGrpcChannel);

    Map<int, Bikun> bikunMap = {};

    await for (var location
        in stub.subscribeLocation(SubscribeLocationRequest.fromJson("{}"))) {
      bikunMap[location.busId.toInt()] = Bikun(
          id: location.busId.toInt(),
          isActive: location.isActive,
          lat: location.lat,
          long: location.long,
          number: location.number.toInt(),
          timestamp: DateTime.parse(location.createdAt));

      yield* Stream.value(bikunMap.values.toList());
    }
  }
}
