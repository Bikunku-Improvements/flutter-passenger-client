import 'dart:convert';

import 'package:passenger_client/homepage/data/bikun.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:passenger_client/api/homepage.dart' as homepage_url;

class BikunApi {
  late WebSocketChannel _bikunkuWebSocketChannel;

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

  Future<void> closeBikunkuWebSocketChannel() async {
    _bikunkuWebSocketChannel.sink.close();
  }
}
