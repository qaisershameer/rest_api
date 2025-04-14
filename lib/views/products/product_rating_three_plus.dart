import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rest_api/controllers/product_controller.dart';
import 'package:rest_api/custom_widgets/product_list_view.dart';

class ProductRatingThreePlus extends StatelessWidget {
  ProductRatingThreePlus({super.key});
  final controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///-----[AppBar]-----
      appBar: AppBar(
        title: Text('Products Rating 3.0 Plus',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue.shade800,
        centerTitle: true,
      ),

      ///-----[Body]-----
      body: controller.productRatingThreePlus.isEmpty

      /// Show Indicator if allTodo is Empty
          ? Center(child: CircularProgressIndicator())

      /// Show ToDos Data Obx widget using Controller
          : ProductListView(title: 'All Products', products: controller.productRatingThreePlus.toList()),
    );
  }
}
