import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addItem(Map<String, dynamic> item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeItem(Map<String, dynamic> item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  void increaseQuantity(Map<String, dynamic> item) {
    int index = _cartItems.indexOf(item);
    if (index != -1) {
      _cartItems[index]['quantity'] += 1;
      notifyListeners();
    }
  }

  void decreaseQuantity(Map<String, dynamic> item) {
    int index = _cartItems.indexOf(item);
    if (index != -1 && _cartItems[index]['quantity'] > 1) {
      _cartItems[index]['quantity'] -= 1;
      notifyListeners();
    }
  }
}
