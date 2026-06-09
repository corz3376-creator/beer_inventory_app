class InventoryItem {
  final String id;
  final String barrelId;
  final String content;
  final DateTime timestamp;

  InventoryItem({
    required this.id,
    required this.barrelId,
    this.content = 'Unknown',
    required this.timestamp,
  });

  // Converts the object into a map format that Google Sheets can easily parse into rows
  Map<String, dynamic> toMap() {
    return {
      'ID': id,
      'Barrel ID': barrelId,
      'Content': content,
      'Log Time': timestamp.toIso8601String(),
    };
  }

  // Optional: Allows you to reconstruct the object if you ever pull data down from the sheet
  factory InventoryItem.fromMap(Map<String, dynamic> map) {
    return InventoryItem(
      id: map['ID']?.toString() ?? '',
      barrelId: map['Barrel ID']?.toString() ?? '',
      content: map['Content']?.toString() ?? '',
      timestamp: DateTime.tryParse(map['Log Time']?.toString() ?? '') ?? DateTime.now(),
    );
  }
}
