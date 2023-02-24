import 'package:get/get_state_manager/get_state_manager.dart';

import '../../network/websocket.dart';

class HomeController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    websocket(
      {
        "type": "subscribe",
        "channels": [
          {
            "name": "ticker",
            "product_ids": [
              "BTC-USD",
            ]
          }
        ]
      },
    );
  }
}
