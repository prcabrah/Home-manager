import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:house_manager_/models/cooking_task.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'services/notification_service.dart';
import 'models/cleaning_task.dart';
import 'models/purchase_item.dart';
import 'models/expense.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await Hive.initFlutter();
  Hive.registerAdapter(CookingTaskAdapter());
    await Hive.openBox<CookingTask>('cookingTasks');
  Hive.registerAdapter(CleaningTaskAdapter());
    await Hive.openBox<CleaningTask>('cleaningTasks');
  Hive.registerAdapter(PurchaseItemAdapter());
    await Hive.openBox<PurchaseItem>('purchases');
  Hive.registerAdapter(ExpenseAdapter());
    await Hive.openBox<Expense>('expenses');
    await NotificationService.init();
  // await Provider.of<AuthProvider>(context, listen: false).autoLogin();
  runApp(const HouseManagerApp());
}
