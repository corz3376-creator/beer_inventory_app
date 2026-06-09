import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../models/product.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<ProductProvider>().products;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: products.isEmpty
          ? const Center(
              child: Text('No products available'),
            )
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: ListTile(
                    title: Text(product.name),
                    subtitle: Text(
                      'Category: ${product.category}
'
                      'Brand: ${product.brand}
'
                      'Stock: ${product.stock}
'
                      'Price: ${product.price}',
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            // TODO: open edit dialog
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            context.read<ProductProvider>().deleteProduct(product.id!);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: open add product dialog
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
