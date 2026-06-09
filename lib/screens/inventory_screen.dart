import 'package:flutter/material.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory'),
        backgroundColor: const Color(0xFF8B4513),
      ),
      body: const Center(
        child: Text('Inventory page'),
      ),
    );
  }
}
