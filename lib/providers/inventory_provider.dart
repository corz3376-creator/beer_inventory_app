import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/inventory_item.dart';
import '../services/google_sheets_api.dart';

class InventoryProvider with ChangeNotifier {
  List<InventoryItem> _items = [];
  List<InventoryItem> get items => _items;

  // This method will be called when you tap a button to log a barrel
  Future<void> addBarrelLog(String barrelId, String content) async {
    // 1. Create the new log entry
    final newItem = InventoryItem(
      id: const Uuid().v4(),
      barrelId: barrelId,
      content: content,
      timestamp: DateTime.now(),
    );

    // 2. Immediately update the local list so the app UI feels fast
    _items.add(newItem);
    notifyListeners();

    // 3. Push the data silently to Google Sheets in the background
    final success = await GoogleSheetsApi.insertItem(newItem);
    
    if (!success) {
      print("Warning: Failed to sync barrel $barrelId to Google Sheets");
      // Optional: You could add logic here to alert the user if the upload failed
    }
  }
}
