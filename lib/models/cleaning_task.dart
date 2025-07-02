import 'package:hive/hive.dart';

part 'cleaning_task.g.dart';

@HiveType(typeId: 1)
class CleaningTask {
  @HiveField(0)
  String task;

  @HiveField(1)
  String assignedTo;

  @HiveField(2)
  bool completed;

  CleaningTask({
    required this.task,
    required this.assignedTo,
    this.completed = false,
  });
}
