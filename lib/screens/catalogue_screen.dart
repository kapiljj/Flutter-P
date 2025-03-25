import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class CatalogueScreen extends StatelessWidget {
  final List<Product> products = [
    Product(id: 1, name: 'iPhone 9', image: 'assets/iphone9.png', price: 477.85, discount: 10),
    Product(id: 2, name: 'Samsung Universe 9', image: 'assets/samsung.png', price: 337.72, discount: 5),
    Product(id: 3, name: 'OPPO F19', image: 'assets/oppo.png', price: 105.90, discount: 8),
    Product(id: 4, name: 'Google Pixel', image: 'assets/google_pixel.png', price: 505.90, discount: 15),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalogue'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductCard(product: product);
          },
        ),
      ),
    );
  }
}
