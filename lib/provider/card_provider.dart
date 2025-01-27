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

  void incrementItemCart(
    int index,
  ) {
    cartItems[index].quantity++;
    notifyListeners();
  }

  void decrementItemCart(int index) {
    if (cartItems[index].quantity > 0) {
      cartItems[index].quantity--;
    }
  }

  double get subTotal {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }

  double get tax => subTotal * 0.02;
  double get total => subTotal + tax;
}
