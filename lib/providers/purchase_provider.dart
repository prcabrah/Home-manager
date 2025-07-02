import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/purchase_item.dart';

class PurchaseProvider with ChangeNotifier {
  final Box<PurchaseItem> _box = Hive.box<PurchaseItem>('purchases');

  List<PurchaseItem> get items => _box.values.toList();

  void addItem(PurchaseItem item) {
    _box.add(item);
    notifyListeners();
  }

  void toggleBought(int index) {
    final item = _box.getAt(index);
    if (item != null) {
      item.bought = !item.bought;
      _box.putAt(index, item);
      notifyListeners();
    }
  }

  void deleteItem(int index) {
    _box.deleteAt(index);
    notifyListeners();
  }
}