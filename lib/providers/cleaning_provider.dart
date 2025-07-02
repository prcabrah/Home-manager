import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/cleaning_task.dart';

class CleaningProvider with ChangeNotifier {
  final Box<CleaningTask> _box = Hive.box<CleaningTask>('cleaningTasks');

  List<CleaningTask> get tasks => _box.values.toList();

  void addTask(CleaningTask task) {
    _box.add(task);
    notifyListeners();
  }

  void toggleCompletion(int index) {
    final task = _box.getAt(index);
    if (task != null) {
      task.completed = !task.completed;
      _box.putAt(index, task);
      notifyListeners();
    }
  }

  void deleteTask(int index) {
    _box.deleteAt(index);
    notifyListeners();
  }
}
