import 'package:get/get.dart';

class AppController extends GetxController {
  @override
  void onReady() async {
    super.onReady();

    await 2.delay();
    Get.offNamed('/main');
  }
}
