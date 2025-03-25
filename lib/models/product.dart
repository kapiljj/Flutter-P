class Product {
  final int id;
  final String name;
  final String image;
  final double price;
  final double discount;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.discount,
  });

  // Add this factory method for JSON deserialization
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
      price: (json['price'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
    );
  }

  double get discountedPrice => price - (price * (discount / 100));
}
