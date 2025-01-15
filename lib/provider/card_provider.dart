import 'package:flutter/material.dart';

class CardProvider with ChangeNotifier {
  int quantity = 1;
  void increment() {
    quantity++;
    notifyListeners();
  }

  void decrement() {
    if (quantity > 1) {
      quantity--;
      notifyListeners();
    }
  }
}
