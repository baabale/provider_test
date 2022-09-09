import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  int quantity = 0;

  void addToCart() {
    quantity++;
    notifyListeners();
  }

  void removeFromCart() {
    quantity--;
    notifyListeners();
  }
}
