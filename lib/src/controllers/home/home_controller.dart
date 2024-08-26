import 'dart:convert';
import 'package:crypto_wallet/src/providers/coinbase_provider.dart';
import 'package:get/get.dart';

import 'package:crypto_wallet/src/models/coinbase_item.dart';
import 'package:solana/solana.dart';

class HomeController extends GetxController {
  final RxMap<String, CoinbaseItem> results = RxMap<String, CoinbaseItem>();
  final _balance = 0.0.obs;
  final _wallet = Wallet;

  final SolanaClient _solanaClient = SolanaClient(
    rpcUrl: Uri.parse('https://api.testnet.solana.com'),
    websocketUrl: Uri.parse('wss://api.testnet.solana.com'),
  );
  @override
  void onReady() async {
    super.onReady();
    final channel = CoinbaseProvider().channel;

    // final channel = WebSocketChannel.connect(
    //   Uri.parse('wss://ws-feed.exchange.coinbase.com'),
    // );

    channel.sink.add(
      jsonEncode(
        <String, dynamic>{
          'type': 'subscribe',
          'channels': [
            {
              'name': 'ticker',
              'product_ids': [
                "ADA-USD",
                'XRP-USD',
                'SOL-USD',
                "ETH-USD",
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

  Type get wallet => _wallet;
  double get balance => _balance.value;

  void createWallet() {
    final wallet = Wallet.generate();
    _wallet.value = wallet;
    updateBalance();
  }

  Future<void> updateBalance() async {
    final balance = await _solanaClient.rpcClient.getBalance(wallet.address);
    _balance.value = balance / lamportsPerSol;
  }

  Future<void> sendSol(String toAddress, double amount) async {
    await _solanaClient.rpcClient
        .requestAirdrop(wallet.address, lamportsPerSol * amount);
    await _solanaClient.rpcClient.transfer(
      sender: wallet,
      recipient: toAddress,
      amount: lamportsPerSol * amount,
    );
    updateBalance();
  }

  void connectSolona() {
    SolanaClient(
      rpcUrl: Uri.parse('https://api.testnet.solana.com'),
      websocketUrl: Uri.parse('wss://api.testnet.solana.com'),
    );
  }
}
