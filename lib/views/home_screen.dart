import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rest_api/views/products/product_home_screen.dart';
import 'package:rest_api/views/todos/todos_home_screen.dart';

import '../controllers/home_controller.dart';
import '../custom_widgets/bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        Widget activeScreen =
            ToDosHomeScreen();
        var activePageTitle = 'API Fetch ToDos';

        if (controller.selectedPageIndex.value == 1) {
          activeScreen = ProductHomeScreen();
          activePageTitle = "API Fetch Products";
        } else if (controller.selectedPageIndex.value == 2) {
          // activeScreen = CounterScreen();
          // activePageTitle = "Settings";
        }
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              activePageTitle,
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Colors.blue.shade800,
          ),
          body: activeScreen,
          bottomNavigationBar: UBottomNavigationBar(controller: controller),
        );
      },
    );
  }
}
