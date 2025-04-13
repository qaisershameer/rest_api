import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  /// Variables
  var selectedPageIndex = 0.obs;

  /// Functions
  void selectPage(int index) {
    selectedPageIndex.value = index;
  }
}
