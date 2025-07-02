import 'package:hive/hive.dart';

part 'expense.g.dart';

@HiveType(typeId: 3)
class Expense {
  @HiveField(0)
  String title;

  @HiveField(1)
  double amount;

  @HiveField(2)
  String paidBy;

  Expense({required this.title, required this.amount, required this.paidBy});
}
