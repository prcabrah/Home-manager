import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/cooking_task.dart';

class CookingProvider with ChangeNotifier {
  final Box<CookingTask> _box = Hive.box<CookingTask>('cookingTasks');

  List<CookingTask> get tasks => _box.values.toList();

  void addTask(CookingTask task) {
    _box.add(task);
    notifyListeners();
  }

  void deleteTask(int index) {
    _box.deleteAt(index);
    notifyListeners();
  }
}