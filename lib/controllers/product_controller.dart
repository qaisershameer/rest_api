import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/const/const.dart';
import 'package:rest_api/models/product_model.dart';
import 'package:rest_api/custom_widgets/show_snack_bar.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  /// Variables

  List<dynamic> data = [];

  // RxList<Product> = <Product>[].obs;    // For getCategories List Method 01 variable declare as
  var allProducts = <Product>[].obs;       // For getCategories List Method 02 variable declare as

  RxList<Product> productPriceTenPlus = <Product>[].obs;
  RxList<Product> productRatingThreePlus = <Product>[].obs;
  RxList<Product> productReviewCountHundredPlus = <Product>[].obs;
  RxList<String> categories = <String>[].obs;

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
        productPriceTenPlus.value = allProducts.where((filter) => filter.price > 10).toList();

        // productRatingThreePlus value assign from allProducts with filter rating.rate > 10
        productRatingThreePlus.value = allProducts.where((filter) => filter.rating.rate > 10).toList();

        // productReviewCountHundredPlus value assign from allProducts with filter rating.count > 100
        productReviewCountHundredPlus.value = allProducts.where((filter) => filter.rating.count > 100).toList();

        /// Extract getCategories using Set from Json Response Data
        // Set<String> getCategories = data.map((product) => product['category'] as String).toSet();  // Method 01
        Set<String> getCategories = allProducts.map((product) => product.category).toSet();           // Method 02

        // Assign getCategories to categories list
        categories.value = getCategories.toList();

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
