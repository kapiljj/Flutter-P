import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product.dart';
import '../blocs/cart_bloc.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Image.asset(
                product.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Text(
              product.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            Text(
              '₹${product.discountedPrice.toStringAsFixed(2)}',
              style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<CartBloc>().add(AddToCart(product));
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
