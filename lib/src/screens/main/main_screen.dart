import 'package:crypto_wallet/src/controllers/main/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Builder(
          builder: (BuildContext context) {
            switch (controller.currentIndex.value) {
              case 0:
                return const HomeScreen();
              case 1:
                return const HomeScreen();
              case 2:
                return const HomeScreen();
              case 3:
                return const HomeScreen();
              default:
                return const HomeScreen();
            }
          },
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey,
                width: 0.8,
              ),
            ),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 0.0,
            backgroundColor: Colors.white,
            unselectedFontSize: 12.0,
            selectedFontSize: 12.0,
            currentIndex: controller.currentIndex.value,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Wallet',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'Transaction',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.display_settings_rounded),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            onTap: (int index) {
              controller.currentIndex.value = index;
            },
          ),
        ),
      ),
    );
  }
}
