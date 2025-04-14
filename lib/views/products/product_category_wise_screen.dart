import 'package:flutter/material.dart';
import 'package:rest_api/models/product_model.dart';
import '../../custom_widgets/product_list_view.dart';

class ProductCategoryWiseScreen extends StatelessWidget {
  const ProductCategoryWiseScreen({super.key, this.title, required this.products});
  final String? title;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///-----[AppBar]-----
      appBar: AppBar(
        title: Text('Category Wise All Products',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal.shade800,
        centerTitle: true,
      ),

      ///-----[Body]-----
      body: products.isEmpty

      /// Show Indicator if all Products is Empty
          ? Center(child: CircularProgressIndicator())

      /// Show Products Data Obx widget using Controller
          : ProductListView(title: 'All Products', products: products.toList()),
    );
  }
}
