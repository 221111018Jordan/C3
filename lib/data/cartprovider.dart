import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addToCart(Map<String, dynamic> item) {
    bool alreadyInCart =
        _cartItems.contains(item);

    if (alreadyInCart) {
      int index = _cartItems
          .indexOf(item);
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

  void ClearItems() {
    _cartItems = [];
    notifyListeners();
  }

  int get totalPrices {
    if (_cartItems.isEmpty) {
      print("Kosong");
      return 0;
    }

    int total = 0;
    num sementara = 0;
    for (Map<String, dynamic> i in _cartItems) {
      sementara += i['harga'] * i['quantity'];
    }

    total = sementara.toInt();

    return total;
  }
}
