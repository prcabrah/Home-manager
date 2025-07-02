import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/cooking_task.dart';
import '../../providers/cooking_provider.dart';
import '../../providers/auth_provider.dart';
// import 'package:house_manager_/services/notification_service.dart';

class CookingScreen extends StatefulWidget {
  const CookingScreen({super.key});

  @override
  State<CookingScreen> createState() => _CookingScreenState();
}

class _CookingScreenState extends State<CookingScreen> {
  final _dayController = TextEditingController();
  final _mealController = TextEditingController();
  final _costController = TextEditingController();

  void _addTask() {
    final day = _dayController.text.trim();
    final meal = _mealController.text.trim();
    final cost = double.tryParse(_costController.text.trim()) ?? 0;

    if (day.isEmpty || meal.isEmpty || cost <= 0) return;

    final task = CookingTask(day: day, meal: meal, cost: cost);
    Provider.of<CookingProvider>(context, listen: false).addTask(task);

    _dayController.clear();
    _mealController.clear();
    _costController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CookingProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Cooking Schedule')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                TextField(
                  controller: _dayController,
                  decoration: const InputDecoration(labelText: 'Day'),
                ),
                TextField(
                  controller: _mealController,
                  decoration: const InputDecoration(labelText: 'Meal'),
                ),
                TextField(
                  controller: _costController,
                  decoration: const InputDecoration(labelText: 'Cost (₦)'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text('Add Task'),
                  onPressed: _addTask,
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: provider.tasks.length,
              itemBuilder: (_, index) {
                final task = provider.tasks[index];
                return ListTile(
                  leading: const Icon(Icons.restaurant_menu),
                  title: Text('${task.day}: ${task.meal}'),
                  subtitle: Text('₦${task.cost.toStringAsFixed(2)}'),
                  trailing: FutureBuilder<String>(
                    future: Provider.of<AuthProvider>(
                      context,
                      listen: false,
                    ).getUserRole(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SizedBox.shrink(); // Don't show anything while loading
                      }

                      if (snapshot.data != 'admin') {
                        return SizedBox.shrink(); // Hide delete button if not admin
                      }

                      return IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => provider.deleteTask(index),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// NotificationService.scheduleNotification(
//   title: 'Cooking Reminder',
//   body: 'You planned "${mealName}" for today!',
//   scheduledTime: DateTime.now().add(Duration(hours: 1)),
// );
