import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addToCart(Map<String, dynamic> food) {
    bool exists = false;

    for (var item in _cartItems) {
      if (item["id"] == food["id"]) {
        item["quantity"]++;
        exists = true;
        break;
      }
    }

    if (!exists) {
      _cartItems.add({...food, "quantity": 1});
    }

    notifyListeners();
  }

  void removeFromCart(String id) {
    _cartItems.removeWhere((item) => item["id"] == id);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
