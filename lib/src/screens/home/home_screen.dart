import 'package:flutter/material.dart';

import '../../components/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(left: 20.0),
                  child: const Text(
                    'Home',
                    style:
                        TextStyle(fontSize: 26.0, fontWeight: FontWeight.w500),
                  ),
                ),
                const Spacer(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(right: 5.0),
                        child: IconButton(
                          icon: const Icon(Icons.search, size: 32.0),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 15.0),
                        child: IconButton(
                          icon:
                              const Icon(Icons.add_alert_outlined, size: 32.0),
                          onPressed: () {},
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
              child: const Text(
                '\$2,000,000',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w400),
              ),
            ),
            const Text(
              '+\$3,607(15.7%) Today',
              style: TextStyle(
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
                          icon: const Icon(Icons.arrow_circle_down, size: 42.0),
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
                child: Column(
              children: const <Widget>[
                CoinItem(
                    'https://s2.coinmarketcap.com/static/img/coins/200x200/1.png'),
                CoinItem(
                    'https://s2.coinmarketcap.com/static/img/coins/200x200/1027.png'),
                CoinItem(
                    'https://s2.coinmarketcap.com/static/img/coins/200x200/52.png')
              ],
            )
                // ListView.builder(
                //     itemCount: 8,
                //     itemBuilder: (context, index) => const CoinItem('')),
                )
          ],
        ),
      ),
    );
  }
}
