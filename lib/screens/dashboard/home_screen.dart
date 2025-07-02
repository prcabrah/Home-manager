import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../dashboard/chat_screen.dart';
import '../dashboard/cooking_screen.dart';
import '../dashboard/cleaning_screen.dart';
import '../dashboard/expenses_screen.dart';
import '../dashboard/purchase_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context).user;

    final List<Map<String, dynamic>> features = [
      {
        'title': 'Cooking Schedule',
        'icon': Icons.kitchen,
        'screen': const CookingScreen(),
      },
      {
        'title': 'Expense Sharing',
        'icon': Icons.attach_money,
        'screen': const ExpensesScreen(),
      },
      {
        'title': 'Cleaning & Repairs',
        'icon': Icons.cleaning_services,
        'screen': const CleaningScreen(),
      },
      {
        'title': 'Purchase Planning',
        'icon': Icons.shopping_cart,
        'screen': const PurchaseScreen(),
      },
      {
        'title': 'Chat Room',
        'icon': Icons.chat_bubble,
        'screen': const ChatScreen(),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('House Manager'),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<AuthProvider>(context, listen: false).logout();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Text('Welcome, ${user?.email}', style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(16),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: features.map((feature) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => feature['screen']),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(feature['icon'], size: 40),
                          const SizedBox(height: 10),
                          Text(feature['title']),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
