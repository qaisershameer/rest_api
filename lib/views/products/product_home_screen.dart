import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rest_api/controllers/product_controller.dart';
import 'package:rest_api/views/products/product_all_screen.dart';
import 'package:rest_api/views/products/product_category_screen.dart';
import 'package:rest_api/views/products/product_price_ten_minus.dart';
import 'package:rest_api/views/products/product_rating_three_plus.dart';
import 'package:rest_api/views/products/product_review_hundred_plus.dart';

import '../../custom_widgets/u_button_icon.dart';

class ProductHomeScreen extends StatelessWidget {
  ProductHomeScreen({super.key});
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade400,
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.yellow],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Gap
              SizedBox(height: 24.0),

              /// Navigate to All Products Screen
              UButtonIcon(
                  myOnPressed: () => Get.to(ProductAllScreen()),
                  buttonText: 'All Products List',
                  buttonIcon: Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  )),

              /// Line Divider 01
              Padding(
                padding: EdgeInsets.all(24.0),
                child:
                    Divider(color: Colors.deepPurple.shade200, thickness: 2.0),
              ),

              /// Gap
              SizedBox(height: 16.0),

              /// Navigate to Product Price 10 Plus Screen
              UButtonIcon(
                  myOnPressed: () => Get.to(ProductPriceTenMinus()),
                  buttonText: 'Product Price 10 Minus',
                  buttonIcon: Icon(
                    Icons.task_alt,
                    color: Colors.white,
                  )),

              /// Gap
              SizedBox(height: 16.0),

              /// Navigate to Product Rating 3.0 Plus Screen
              UButtonIcon(
                  myOnPressed: () => Get.to(ProductRatingThreePlus()),
                  buttonText: 'Products Rating 3.0 Plus',
                  buttonIcon: Icon(
                    Icons.rate_review,
                    color: Colors.white,
                  )),

              /// Line Divider 02
              Padding(
                padding: EdgeInsets.all(24.0),
                child: Divider(color: Colors.orange.shade200, thickness: 2.0),
              ),

              /// Navigate to Product Rating 3.0 Plus Screen
              UButtonIcon(
                  myOnPressed: () => Get.to(ProductReviewHundredPlus()),
                  buttonText: 'Products Review 100 Plus',
                  buttonIcon: Icon(
                    Icons.rate_review,
                    color: Colors.white,
                  )),

              /// Gap
              SizedBox(height: 16.0),

              /// Navigate to User Wise todos Screen
              UButtonIcon(
                  myOnPressed: () => Get.to(ProductCategoryScreen(
                        allProduct: controller.allProducts,
                      )),
                  buttonText: 'Products Categories',
                  buttonIcon: Icon(
                    Icons.category,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
