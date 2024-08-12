import 'dart:math';

import 'package:crypto_wallet/src/controllers/controllers.dart';
import 'package:crypto_wallet/src/models/coinbase_item.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  int get total => Random().nextInt(5902);
  String get range => (Random().nextDouble() * 10).toStringAsFixed(2);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 20.0),
                    child: const Text(
                      'Home',
                      style: TextStyle(
                          fontSize: 26.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                  // const Spacer(),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(right: 5.0),
                          child: IconButton(
                            icon: const Icon(Icons.search, size: 25.0),
                            onPressed: () {},
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 5.0),
                          child: IconButton(
                            icon: const Icon(Icons.add_alert_outlined,
                                size: 25.0),
                            onPressed: () {},
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 5.0),
                          child: IconButton(
                            icon: const Icon(Icons.add_circle_outline,
                                size: 25.0),
                            onPressed: () {
                              controller.connectSolona();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 7.0),
                child: const Text(
                  'Total',
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 7.0),
                child: Text(
                  '\$ ${2000000 + total}',
                  style: const TextStyle(
                      fontSize: 30.0, fontWeight: FontWeight.w400),
                ),
              ),
              Text(
                '+\$ $total ($range%) ',
                style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.green),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                ),
                margin: const EdgeInsets.only(
                  top: 5.0,
                  bottom: 15.0,
                  left: 15.0,
                  right: 15.0,
                ),
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(bottom: 5.0),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(Icons.arrow_circle_up, size: 42.0),
                            onPressed: () {},
                          ),
                        ),
                        const Text('Send')
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(bottom: 5.0),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon:
                                const Icon(Icons.arrow_circle_down, size: 42.0),
                            onPressed: () {},
                          ),
                        ),
                        const Text('Deposit')
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(bottom: 5.0),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(Icons.sell_outlined, size: 42.0),
                            onPressed: () {},
                          ),
                        ),
                        const Text('Buy')
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(bottom: 5.0),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(Icons.swap_horiz, size: 42.0),
                            onPressed: () {},
                          ),
                        ),
                        //const Icon(Icons.swap_horiz, size: 42.0),
                        const Text('Swap'),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Scaffold(
                  body: ListView.builder(
                    itemCount: controller.results.length,
                    itemBuilder: (BuildContext context, int index) {
                      final CoinbaseItem coinbase =
                          controller.results.values.toList()[index];
                      return SizedBox(
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              height: 50,
                              width: 60,
                              child: ExtendedImage.network(
                                'https://s2.coinmarketcap.com/static/img/coins/200x200/1.png',
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Text('Bitcoin'),
                                  Text(
                                    coinbase.productId.toString(),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(right: 10.0),
                                alignment: Alignment.centerRight,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      ' \$ ${coinbase.price}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                    Text(
                                      '$range %',
                                      style: const TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        // child: Row(
                        //   children: <Widget>[
                        //     Text(
                        //       coinbase.productId.toString(),
                        //     ),
                        //     const SizedBox(
                        //       width: 16.0,
                        //     ),
                        //     Text(
                        //       coinbase.price.toString(),
                        //     ),
                        //   ],
                        // ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
