import 'dart:convert';

import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:passenger_client/api/homepage.dart' as homepage_url;

import '../models/bikun.dart';
import 'bikun_remote_data_source.dart';

class BikunRemoteDataSourceWebSocketImpl implements BikunRemoteDataSource {
  late WebSocketChannel _bikunkuWebSocketChannel;

  @override
  Future<void> close() async {
    _bikunkuWebSocketChannel.sink.close();
  }

  @override
  Stream<List<Bikun>> getListAllBikunChannel() async* {
    _bikunkuWebSocketChannel =
        WebSocketChannel.connect(Uri.parse(homepage_url.getCurrentBikunku));
    await for (var response in _bikunkuWebSocketChannel.stream) {
      final decodedResponse = jsonDecode(response) as List;
      final bikunList =
          decodedResponse.map((bikun) => Bikun.fromMap(bikun)).toList();

      yield* Stream.value(bikunList);
    }
  }
}
