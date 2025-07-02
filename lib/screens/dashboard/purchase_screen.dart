import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/purchase_item.dart';
import '../../providers/purchase_provider.dart';

class PurchaseScreen extends StatefulWidget {
  const PurchaseScreen({super.key});

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();

  void _addItem() {
    final name = _nameController.text.trim();
    final price = double.tryParse(_priceController.text.trim()) ?? 0;

    if (name.isEmpty || price <= 0) return;

    final item = PurchaseItem(name: name, price: price);
    Provider.of<PurchaseProvider>(context, listen: false).addItem(item);

    _nameController.clear();
    _priceController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PurchaseProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Purchase Planner')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Item'),
                ),
                TextField(
                  controller: _priceController,
                  decoration: const InputDecoration(
                    labelText: 'Estimated Cost',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  icon: const Icon(Icons.add_shopping_cart),
                  label: const Text('Add Item'),
                  onPressed: _addItem,
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: provider.items.length,
              itemBuilder: (_, index) {
                final item = provider.items[index];
                return ListTile(
                  leading: Icon(
                    item.bought
                        ? Icons.check_box
                        : Icons.check_box_outline_blank,
                    color: item.bought ? Colors.green : null,
                  ),
                  title: Text(item.name),
                  subtitle: Text('₦${item.price.toStringAsFixed(2)}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.done),
                        onPressed: () => provider.toggleBought(index),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => provider.deleteItem(index),
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
