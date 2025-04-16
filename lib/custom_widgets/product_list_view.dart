import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rest_api/models/product_model.dart';
import 'package:rest_api/views/products/product_detail_screen.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key, this.title, required this.products});
  final String? title;
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            padding: EdgeInsets.all(8.0),
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (context, index) {
              // Product data
              Product product = products[index];

              return InkWell(
                onTap: () => Get.to(() => ProductDetailScreen(product: product)),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.orangeAccent, Colors.blueAccent],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(
                              product.image,
                              scale: 0.25,
                            ),
                          ),

                          /// Product Price
                          Text(
                            '\$${product.price}',
                            style: GoogleFonts.lato(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal.shade800,
                            ),
                          ),
                        ],
                      ),

                      /// Product Title
                      Text(
                        product.title,
                        style: GoogleFonts.lato(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                        maxLines: 2,
                      ),

                      /// Product Description
                      Expanded(
                        child: Text(
                          product.description,
                          style: GoogleFonts.lato(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      /// Product Category
                      Text(
                        'Category: ${product.category}',
                        style: GoogleFonts.lato(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),

                      /// Product Rating Count
                      Text(
                        'Rating: ${product.rating.rate} ☆ (${product.rating.count} reviews)',
                        style: GoogleFonts.lato(
                          fontSize: 12,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
