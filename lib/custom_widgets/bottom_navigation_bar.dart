import 'package:flutter/material.dart';
import '../controllers/home_controller.dart';

class UBottomNavigationBar extends StatelessWidget {
  const UBottomNavigationBar({super.key, required this.controller});

  final HomeScreenController controller;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(

        onTap: controller.selectPage,
        currentIndex: controller.selectedPageIndex.value,

        /// Pages List
        items: [

          /// Page 01 ToDos
          BottomNavigationBarItem(label: 'ToDos', icon: Icon(Icons.schedule)),

          /// Page 02 Products
          BottomNavigationBarItem(label: 'Products', icon: Icon(Icons.add_shopping_cart)),

          /// Page 03 Settings
          BottomNavigationBarItem(label: 'Settings', icon: Icon(Icons.settings))

        ]);
  }
}
