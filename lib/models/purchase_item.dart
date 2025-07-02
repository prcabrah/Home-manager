import 'package:hive/hive.dart';

part 'purchase_item.g.dart';

@HiveType(typeId: 2)
class PurchaseItem {
  @HiveField(0)
  String name;

  @HiveField(1)
  double price;

  @HiveField(2)
  bool bought;

  PurchaseItem({required this.name, required this.price, this.bought = false});
}
