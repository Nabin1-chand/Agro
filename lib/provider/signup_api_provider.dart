import 'package:agro_app/Auth_service/api_service.dart';
import 'package:flutter/material.dart';

class SignUpProvider with ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = '';
  bool _isSuccess = false;

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  bool get isSuccess => _isSuccess;

  Future<void> signUp(String email, String password) async {
    _isLoading = true;
    _errorMessage = '';
    _isSuccess = false;
    notifyListeners();

    try {
      final response = await ApiService.signUp(email, password);

      if (response.statusCode == 200) {
        _isSuccess = true;
        notifyListeners();
      } else {
        _errorMessage = 'Registration failed. Please try again.';
        notifyListeners();
      }
    } catch (e) {
      _errorMessage = 'An error occurred. Please try again later.';
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
