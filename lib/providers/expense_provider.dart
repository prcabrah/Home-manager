import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/expense.dart';

class ExpenseProvider with ChangeNotifier {
  final Box<Expense> _box = Hive.box<Expense>('expenses');

  List<Expense> get all => _box.values.toList();

  void addExpense(Expense exp) {
    _box.add(exp);
    notifyListeners();
  }

  void deleteExpense(int index) {
    _box.deleteAt(index);
    notifyListeners();
  }

  Map<String, double> get groupedByUser {
    final Map<String, double> result = {};
    for (var exp in _box.values) {
      result.update(
        exp.paidBy,
        (v) => v + exp.amount,
        ifAbsent: () => exp.amount,
      );
    }
    return result;
  }

  void deleteTask(int index) {}
}
