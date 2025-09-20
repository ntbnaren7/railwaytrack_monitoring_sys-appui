import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuthenticated = false;
  String? _userId;

  bool get isAuthenticated => _isAuthenticated;
  String? get userId => _userId;

  Future<bool> login(String userId, String password) async {
    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 1));
    
    // Hardcoded demo credentials
    if (userId == 'gov_demo' && password == 'Rail@2025') {
      _isAuthenticated = true;
      _userId = userId;
      notifyListeners();
      return true;
    }
    return false;
  }

  void logout() {
    _isAuthenticated = false;
    _userId = null;
    notifyListeners();
  }

  void navigateToLogin(BuildContext context) {
    context.go('/login');
  }

  void navigateToDashboard(BuildContext context) {
    context.go('/dashboard');
  }
}

