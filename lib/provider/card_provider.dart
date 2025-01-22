import 'package:flutter/material.dart';

class CardProvider with ChangeNotifier {
  final Map<String, int> _productQuantities = {};

  int getQuantity(String productName) {
    return _productQuantities[productName] ?? 1;
  }

  void increment(String productName) {
    _productQuantities[productName] =
        (_productQuantities[productName] ?? 1) + 1;
    notifyListeners();
  }

  void decrement(String productName) {
    if ((_productQuantities[productName] ?? 1) > 1) {
      _productQuantities[productName] =
          (_productQuantities[productName] ?? 1) - 1;
      notifyListeners();
    }
  }
}
