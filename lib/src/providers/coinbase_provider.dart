import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../models/coinbase_request.dart';
import '../models/coinbase_response.dart';

/// Manages opening and closing the sockets for the
/// two different sockets: ETH socker and BTC socket
class CoinbaseProvider {
  late final WebSocketChannel _btcWebsocket;

  static const _btcProduct = "BTC-EUR";

  CoinbaseProvider()
      : _btcWebsocket = WebSocketChannel.connect(
          Uri.parse('wss://ws-feed.pro.coinbase.com'),
        );

  Stream<CoinbaseResponse> get bitcoinStream => _btcWebsocket.stream
      .map<CoinbaseResponse>(
          (value) => CoinbaseResponse.fromJson(jsonDecode(value)))
      .skipWhile((element) => element.productId != _btcProduct);

  void openBitcoin() {
    _btcWebsocket.sink.add(
      jsonEncode(
        CoinbaseRequest(
          'subscribe',
          [
            {
              "name": "ticker",
              "product_ids": [_btcProduct]
            }
          ],
        ).toJson(),
      ),
    );
  }

  void closeBitcoin() {
    _btcWebsocket.sink.close();
  }
}
