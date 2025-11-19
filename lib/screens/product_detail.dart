import 'package:flutter/material.dart';
import 'package:football_shop/models/product_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntry product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Detail"),
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Thumbnail
            if (product.thumbnail.isNotEmpty)
              Image.network(
                "http://10.0.2.2:8000/proxy-image/?url=${Uri.encodeComponent(product.thumbnail)}",
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Container(
                      height: 250,
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(Icons.broken_image, size: 50),
                      ),
                    ),
              ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Product Name
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Category + Brand + Rating row
                  Row(
                    children: [
                      // CATEGORY
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          product.category.toUpperCase(),
                          style: TextStyle(
                            color: Colors.green.shade800,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      // BRAND
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          product.brand.toUpperCase(),
                          style: TextStyle(
                            color: Colors.blue.shade800,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      // RATING
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "⭐ ${product.rating}",
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  // PRICE
                  Text(
                    "Rp ${product.price.toString()}",
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),

                  const Divider(height: 30),

                  // DESCRIPTION
                  const Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    product.description,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}