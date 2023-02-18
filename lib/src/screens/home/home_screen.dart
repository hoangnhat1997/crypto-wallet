import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

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
                  margin: const EdgeInsets.only(left: 10.0),
                  child: const Text(
                    'Home',
                    style:
                        TextStyle(fontSize: 26.0, fontWeight: FontWeight.w500),
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.search,
                  size: 32.0,
                ),
                const Icon(
                  Icons.add_alert_outlined,
                  size: 32.0,
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            const Text(
              'Total',
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w400),
            ),
            const Text(
              '\$2,000,000',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w400),
            ),
            const Text(
              '+\$3,607(15.7%) Today',
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
