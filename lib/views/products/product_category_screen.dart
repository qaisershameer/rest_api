import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rest_api/controllers/product_controller.dart';
import 'package:rest_api/models/product_model.dart';
import 'package:rest_api/views/products/product_category_wise_screen.dart';
import '../../custom_widgets/category_grid_item.dart';

class ProductCategoryScreen extends StatefulWidget {
  const ProductCategoryScreen({super.key, required this.allProduct});

  final RxList<Product> allProduct;

  @override
  State<ProductCategoryScreen> createState() => _ProductCategoryScreenState();
}

class _ProductCategoryScreenState extends State<ProductCategoryScreen>
    with SingleTickerProviderStateMixin {
  final controller = Get.find<ProductController>();
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// Animation Builder for Categories on Screen Load
    return Scaffold(
      appBar: AppBar(
          title: Text('Categories'),
          backgroundColor: Colors.blue.shade500),
      body: AnimatedBuilder(
        animation: _animationController,
        child: GridView(
          padding: EdgeInsets.all(24.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),

          /// Category List Display via loop and generate Category Wise Filtered Products List
          children: [
            for (var category in controller.availableCategories)
              CategoryGridItem(
                category: category,
                onSelectCategory: () {
                  // print('User tapped!');

                  final filteredProduct = controller.allProducts
                      .where((product) => product.category.contains(category.id))
                      .toList();

                  /// Navigate to Meal Screen with these above Selected Category Wise filter Products
                  Get.to(() => ProductCategoryWiseScreen(products: filteredProduct));
                },
              ),
          ],
        ),

        /// Animation Effect define here.
        builder: (context, child) => SlideTransition(
            position: Tween(
              begin: Offset(0, 0.3),
              end: Offset(0, 0),
            ).animate(CurvedAnimation(
                parent: _animationController, curve: Curves.easeInOut)),
            child: child),
      ),
    );
  }
}
