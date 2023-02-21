import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class CoinItem extends StatelessWidget {
  final String imgCoin;
  const CoinItem(this.imgCoin, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      height: 60,
      child: Row(
        children: <Widget>[
          Container(
            height: 50,
            width: 50,
            child: ExtendedImage.network(imgCoin),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text('Bitcoin'),
                Text('BTC'),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 10.0),
              alignment: Alignment.centerRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[Text('\$23.256'), Text('+5.97%')],
              ),
            ),
          )
        ],
      ),
    );
    ;
  }
}
