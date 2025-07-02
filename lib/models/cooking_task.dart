import 'package:hive/hive.dart';

part 'cooking_task.g.dart';

@HiveType(typeId: 0)
class CookingTask {
  @HiveField(0)
  String day;

  @HiveField(1)
  String meal;

  @HiveField(2)
  double cost;

  CookingTask({required this.day, required this.meal, required this.cost});
}