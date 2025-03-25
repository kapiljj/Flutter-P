import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductRepository {
  Future<List<Product>> fetchProducts(int page) async {
    final response = await http.get(Uri.parse('https://dummyjson.com/products?limit=10&skip=${page * 10}'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body)['products'] as List;
      return data.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
