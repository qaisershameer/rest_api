import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rest_api/controllers/product_controller.dart';
import 'package:rest_api/models/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    Get.find<ProductController>();
    return Scaffold(
      ///-----[ AppBar ]-----
      appBar: AppBar(
        title: Text('Product Details'),
        centerTitle: true,
      ),

      ///-----[ Body ]-----
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ///-----[Image]-----
              CircleAvatar(
                radius: 75,
                backgroundColor: Colors.white, // Optional
                backgroundImage: NetworkImage(product.image),
              ),

              SizedBox(height: 16.0),

              ///-----[ID-Price]-----
              Text(
                'ID: 0${product.id} ☆ Price: \$ ${product.price.toString()}',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.green, fontWeight: FontWeight.bold),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Divider(),
              ),

              ///-----[Title]-----
              Text(
                product.title.toUpperCase(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 16.0),

              ///-----[Category]-----
              Text(
                'Category: ${product.category.toUpperCase()}',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.yellow, fontWeight: FontWeight.bold),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Divider(),
              ),

              ///-----[Description]-----
              Text(
                product.description,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Divider(),
              ),

              ///-----[Rating-Review]-----
              Text(
                'Rating: ${product.rating.rate} ☆ (${product.rating.count} reviews)',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
