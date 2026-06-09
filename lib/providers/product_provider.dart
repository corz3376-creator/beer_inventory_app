import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<ProductProvider>().products;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        backgroundColor: const Color(0xFF8B4513),
      ),
      body: products.isEmpty
          ? const Center(
              child: Text('No products yet'),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: const Icon(Icons.local_drink),
                    title: Text(product.name),
                    subtitle: Text(
                      'Category: ${product.category}
Brand: ${product.brand}',
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            ),
    );
  }
}
