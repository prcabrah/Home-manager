// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'screens/auth/login_screen.dart';
import 'screens/dashboard/home_screen.dart';
import 'providers/cooking_provider.dart';
import 'providers/cleaning_provider.dart';
import 'providers/purchase_provider.dart';
import 'providers/expense_provider.dart';

class HouseManagerApp extends StatelessWidget {
  const HouseManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => CookingProvider()),
        ChangeNotifierProvider(create: (_) => CleaningProvider()),
        ChangeNotifierProvider(create: (_) => PurchaseProvider()),
        ChangeNotifierProvider(create: (_) => ExpenseProvider()),
      ],
      child: Consumer<AuthProvider>(
        builder: (ctx, auth, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'House Manager',
            theme: ThemeData(primarySwatch: Colors.green, useMaterial3: true),
            home: auth.isAuthenticated
                ? const HomeScreen()
                : const LoginScreen(),
          );
        }, // builder
      ),
    );
  }
}
