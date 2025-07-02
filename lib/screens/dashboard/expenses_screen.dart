import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../models/expense.dart';
import '../../providers/expense_provider.dart';
import '../../providers/auth_provider.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _paidByController = TextEditingController();

  void _addExpense() {
    final title = _titleController.text.trim();
    final amount = double.tryParse(_amountController.text.trim()) ?? 0;
    final paidBy = _paidByController.text.trim();

    if (title.isEmpty || amount <= 0 || paidBy.isEmpty) return;

    final expense = Expense(title: title, amount: amount, paidBy: paidBy);
    Provider.of<ExpenseProvider>(context, listen: false).addExpense(expense);

    _titleController.clear();
    _amountController.clear();
    _paidByController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExpenseProvider>(context);
    final grouped = provider.groupedByUser;

    return Scaffold(
      appBar: AppBar(title: const Text('Expenses & Sharing')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: _amountController,
                  decoration: const InputDecoration(labelText: 'Amount (₦)'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _paidByController,
                  decoration: const InputDecoration(labelText: 'Paid by'),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text('Add Expense'),
                  onPressed: _addExpense,
                ),
              ],
            ),
          ),
          const Divider(),
          if (grouped.isNotEmpty)
            SizedBox(
              height: 180,
              child: PieChart(
                PieChartData(
                  sections: grouped.entries.map((e) {
                    final percent =
                        (e.value / grouped.values.reduce((a, b) => a + b)) *
                        100;
                    return PieChartSectionData(
                      color: Colors
                          .primaries[e.key.hashCode % Colors.primaries.length],
                      value: e.value,
                      title: '${e.key}\n${percent.toStringAsFixed(1)}%',
                      radius: 50,
                      titleStyle: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: provider.all.length,
              itemBuilder: (_, index) {
                final exp = provider.all[index];
                return ListTile(
                  title: Text(exp.title),
                  subtitle: Text(
                    '₦${exp.amount.toStringAsFixed(2)} — ${exp.paidBy}',
                  ),
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
