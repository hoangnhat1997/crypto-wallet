import 'dart:convert';
import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:crypto_wallet/src/models/coinbase_item.dart';

class HomeController extends GetxController {
  final RxMap<String, CoinbaseItem> results = RxMap<String, CoinbaseItem>();

  @override
  void onReady() async {
    super.onReady();
    final channel = WebSocketChannel.connect(
      Uri.parse('wss://ws-feed.pro.coinbase.com'),
    );

    channel.sink.add(
      jsonEncode(
        <String, dynamic>{
          'type': 'subscribe',
          'channels': [
            {
              'name': 'ticker',
              'product_ids': [
                'BTC-USD',
              ],
            },
          ],
        },
      ),
    );

    channel.stream.listen(
      (dynamic raw) {
        final dynamic json = jsonDecode(raw);

        if (json['type'] != 'ticker') {
          return;
        }

        final CoinbaseItem coinbase = CoinbaseItem(
          productId: json['product_id'],
          price: double.parse(json['price']),
        );

        results[coinbase.productId] = coinbase;
      },
      onError: (error) {
        print(error);
      },
    );
  }
}
