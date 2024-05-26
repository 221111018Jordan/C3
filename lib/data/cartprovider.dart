import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addToCart(Map<String, dynamic> item) {
  bool alreadyInCart = _cartItems.any((cartItem) => cartItem['title'] == item['title']);

  if (alreadyInCart) {
    int index = _cartItems.indexWhere((cartItem) => cartItem['title'] == item['title']);
    increaseQuantity(index);
  } else {
    // Jika belum ada, tambahkan ke keranjang
    _cartItems.add(item);
    notifyListeners();
  }
}


  void removeFromCart(Map<String, dynamic> item) {
    _cartItems.remove(item);
    notifyListeners();
  }

void increaseQuantity(int index) {
  if (index >= 0 && index < _cartItems.length) {
    _cartItems[index]['quantity']++;
    notifyListeners();
  } else {
    ClearItems();
  }
}

void decreaseQuantity(int index) {
  if (index >= 0 && index < _cartItems.length) {
    if (_cartItems[index]['quantity'] > 1) {
      _cartItems[index]['quantity']--;
    } else {
      _cartItems.removeAt(index);
    }
    notifyListeners();
  }
}


  void ClearItems(){
    _cartItems = [];
    notifyListeners();
  }

  get totalPrices {
    if (_cartItems.isEmpty) {
      print("Kosong");
      return 0;
    }

    int total = 0;

}
}