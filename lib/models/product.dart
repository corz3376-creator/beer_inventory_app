class Product {
  final int? id;
  final String name;
  final String category;
  final String brand;
  final double stock;
  final double price;

  Product({
    this.id,
    required this.name,
    required this.category,
    required this.brand,
    required this.stock,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int?,
      name: json['name'] as String,
      category: json['category'] as String,
      brand: json['brand'] as String,
      stock: (json['stock'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'brand': brand,
      'stock': stock,
      'price': price,
    };
  }
}
