import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/cleaning_task.dart';
import '../../providers/cleaning_provider.dart';

class CleaningScreen extends StatefulWidget {
  const CleaningScreen({super.key});

  @override
  State<CleaningScreen> createState() => _CleaningScreenState();
}

class _CleaningScreenState extends State<CleaningScreen> {
  final _taskController = TextEditingController();
  final _assignController = TextEditingController();

  void _addTask() {
    final task = _taskController.text.trim();
    final assigned = _assignController.text.trim();

    if (task.isEmpty || assigned.isEmpty) return;

    final cleaningTask = CleaningTask(task: task, assignedTo: assigned);
    Provider.of<CleaningProvider>(context, listen: false).addTask(cleaningTask);

    _taskController.clear();
    _assignController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CleaningProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Cleaning & Repairs')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                TextField(
                  controller: _taskController,
                  decoration: const InputDecoration(labelText: 'Task'),
                ),
                TextField(
                  controller: _assignController,
                  decoration: const InputDecoration(labelText: 'Assigned To'),
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
                  leading: Icon(
                    task.completed
                        ? Icons.check_circle
                        : Icons.radio_button_unchecked,
                    color: task.completed ? Colors.green : null,
                  ),
                  title: Text(task.task),
                  subtitle: Text('Assigned to: ${task.assignedTo}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.done),
                        onPressed: () => provider.toggleCompletion(index),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => provider.deleteTask(index),
                      ),
                    ],
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
