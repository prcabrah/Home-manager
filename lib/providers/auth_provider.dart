import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  // User? get user => _user;
  // Future<void> login(String email, String password) async {
  //   await _auth.signInWithEmailAndPassword(email: email, password: password);
  //   notifyListeners();
  // }

  bool get isAuthenticated => _auth.currentUser != null;
  User? get user => _user ?? _auth.currentUser;

  Future<void> register(String email, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      _user = result.user;

      // Default role is roommate
      await FirebaseFirestore.instance.collection('users').doc(_user!.uid).set({
        'email': _user!.email,
        'role': 'roommate',
      });

      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    notifyListeners();
  }

  getUserRole() {}

  Future<void> login(String trim, String trim2) async {}
}

Future<String> getUserRole() async {
  final currentUser = FirebaseAuth.instance.currentUser;

  if (currentUser == null) {
    throw Exception('User not logged in');
  }

  final doc = await FirebaseFirestore.instance
      .collection('users')
      .doc(currentUser.uid)
      .get();
  return doc.data()?['role'] ?? 'roommate';
}
