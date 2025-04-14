import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/const/const.dart';
import 'package:rest_api/models/product_model.dart';
import 'package:rest_api/models/category_model.dart';
import 'package:rest_api/custom_widgets/show_snack_bar.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  /// Variables

  List<dynamic> data = [];

  RxList<Product> allProducts = <Product>[].obs;    // For getCategories List Method 01 variable declare as
  // var allProducts = <Product>[].obs;       // For getCategories List Method 02 variable declare as

  RxList<Product> productPriceTenMinus = <Product>[].obs;
  RxList<Product> productRatingThreePlus = <Product>[].obs;
  RxList<Product> productReviewCountHundredPlus = <Product>[].obs;
  // RxList<String> categories = <String>[].obs;

  /// available Categories
  RxList<Category> availableCategories = <Category>[
    Category(
        id: 'men\'s clothing',
        title: 'Men\'s clothing',
        color: Colors.deepPurple,
        image: "assets/brands/0.jpg"),
    Category(
        id: 'Mens Cotton Jacket',
        title: 'Mens Cotton Jacket',
        color: Colors.deepOrange,
        image: "assets/brands/1.jpg"),
    Category(
        id: 'jewelery',
        title: 'Jewelery',
        color: Colors.brown,
        image: "assets/brands/2.jpg"),
    Category(
        id: 'Electronics',
        title: 'electronics',
        color: Colors.yellowAccent,
        image: "assets/brands/3.jpg"),
    Category(
        id: 'women\'s clothing',
        title: 'Women\'s clothing',
        color: Colors.cyan,
        image: "assets/brands/4.jpg"),
    Category(
        id: 'c6',
        title: 'Dari Mooch',
        color: Colors.lime,
        image: "assets/brands/5.jpg"),
    Category(
        id: 'c7',
        title: 'Havelet Packard',
        color: Colors.indigo,
        image: "assets/brands/6.jpg"),
    Category(
        id: 'c8',
        title: 'Go Green',
        color: Colors.lightGreenAccent,
        image: "assets/brands/7.jpg"),
    Category(
        id: 'c9',
        title: 'Junaid Jamshaid',
        color: Colors.pinkAccent,
        image: "assets/brands/8.jpg"),
    Category(
        id: 'c10',
        title: 'NDURE FUTUREY',
        color: Colors.tealAccent,
        image: "assets/brands/9.jpg"),
  ].obs;


  /// todos initialized
  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  /// Functions /// Screen Logics
  Future<void> fetchProducts() async {
    try {
      /// URL
      Uri url = UConst.productsUrl;

      /// get response from URL
      final response = await http.get(url);

      /// +ve response Output Checking
      if (response.statusCode == 200) {

        // +ve response successful action
        data = jsonDecode(response.body);

        /// all Products value assign from fetched data
        allProducts.value = data.map((json) => Product.fromJson(json)).toList();

        // productsPriceTenPus value assign from allProducts with filter price > 10
        productPriceTenMinus.value = allProducts.where((filter) => filter.price < 10.00).toList();

        // productRatingThreePlus value assign from allProducts with filter rating.rate > 03
        productRatingThreePlus.value = allProducts.where((filter) => filter.rating.rate > 3.00).toList();

        // productReviewCountHundredPlus value assign from allProducts with filter rating.count > 100
        productReviewCountHundredPlus.value = allProducts.where((filter) => filter.rating.count > 100).toList();

        /// Extract getCategories using Set from Json Response Data
        // Set<String> getCategories = data.map((product) => product['category'] as String).toSet();  // Method 01
        // Set<String> getCategories = allProducts.map((product) => product.category).toSet();           // Method 02

        // Assign getCategories to categories list
        // categories.value = getCategories.toList();

        /// +ve response success Snackbar
        USnackBars.warningSnackBar(title: 'All Products Data successfully loaded: ${response.statusCode}');

      } else {

        /// -ve response error Snackbar
        USnackBars.errorSnackBar(title: 'Something went wrong: ${response.statusCode}');

      }
    } catch (e) {

      /// URL Error Snackbar
      USnackBars.errorSnackBar(title: 'Error $e');
    }
  }
}
