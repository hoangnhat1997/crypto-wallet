import 'package:web_socket_channel/web_socket_channel.dart';

/// Manages opening and closing the sockets for the
/// two different sockets: ETH socker and BTC socket
class CoinbaseProvider {
  contructor(WebSocketChannel channel) {
    this.channel = channel;
  }

  var channel = WebSocketChannel.connect(
    Uri.parse('wss://ws-feed.exchange.coinbase.com'),
  );
}
