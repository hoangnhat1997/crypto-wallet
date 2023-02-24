import 'dart:convert';

import 'package:crypto_wallet/src/models/coinbase_response.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void websocket(data) async {
  final wsUrl = Uri.parse('wss://ws-feed.pro.coinbase.com');
  final channel = WebSocketChannel.connect(wsUrl);

  channel.sink.add(
    jsonEncode(data),
  );

  /// Listen for all incoming data
  channel.stream.listen(
    (response) {
      final jsonData = CoinbaseResponse.fromJson(response);

      print(jsonData);
    },
    onError: (error) => print(error),
  );
}
