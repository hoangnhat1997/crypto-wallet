import 'package:crypto_wallet/src/controllers/main/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'controllers/controllers.dart';
import 'screens/screens.dart';

class CryptoWalletApp extends StatelessWidget {
  const CryptoWalletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      theme: ThemeData(),
      initialRoute: '/',
      initialBinding: BindingsBuilder.put(() => AppController()),
      getPages: <GetPage>[
        GetPage(
          name: '/',
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: '/main',
          page: () => const MainScreen(),
          binding: BindingsBuilder(
            () {
              Get.put(MainController());
              Get.put(HomeController());
            },
          ),
        ),
        GetPage(
          name: '/home',
          page: () => const HomeScreen(),
          binding: BindingsBuilder(
            () {
              Get.put(HomeController());
            },
          ),
        )
      ],
    );
  }
}
