import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rest_api/controllers/product_controller.dart';
import 'package:rest_api/custom_widgets/product_list_view.dart';

class ProductReviewHundredPlus extends StatelessWidget {
  ProductReviewHundredPlus({super.key});
  final controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///-----[AppBar]-----
      appBar: AppBar(
        title: Text('Products Review Count 100 Plus',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue.shade800,
        centerTitle: true,
      ),

      ///-----[Body]-----
      body: controller.productReviewCountHundredPlus.isEmpty

      /// Show Indicator if allTodo is Empty
          ? Center(child: CircularProgressIndicator())

      /// Show ToDos Data Obx widget using Controller
          : ProductListView(title: 'All Products', products: controller.productReviewCountHundredPlus.toList()),
    );
  }
}
