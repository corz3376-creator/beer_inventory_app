import 'package:flutter/foundation.dart';
import '../models/product.dart';
import '../services/database_helper.dart';

class ProductProvider extends ChangeNotifier {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Product> _products = [];

  List<Product> get products => _products;

  Future<void> loadProducts() async {
    final data = await _dbHelper.getAllProducts();
    _products = data.map((e) => Product.fromJson(e)).toList();
    notifyListeners();
  }

  Future<void> addProduct(Product product) async {
    await _dbHelper.insertProduct(product.toJson());
    await loadProducts();
  }

  Future<void> updateProduct(Product product) async {
    await _dbHelper.updateProduct(product.toJson());
    await loadProducts();
  }
}
