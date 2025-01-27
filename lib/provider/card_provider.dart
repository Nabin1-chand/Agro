import 'package:agro_app/model/cart_model.dart';
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

  List<CartItem> _cartItems = [];
  List<CartItem> get cartItems => _cartItems;

  void addItem(CartItem item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeItem(CartItem item) {
    _cartItems.remove(item);
    notifyListeners();
  }
}
