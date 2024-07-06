import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<Map<String, dynamic>> _cartItems = [];
  List<Map<String, dynamic>> _wishListItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;
  List<Map<String, dynamic>> get wishListItems => _wishListItems;

  void addToWishList(Map<String, dynamic> item) {
    if (!_wishListItems.contains(item)) {
      _wishListItems.add(item);
      notifyListeners();
    }
  }

  void removeWishList(Map<String, dynamic> item) {
    _wishListItems.remove(item);
    notifyListeners();
  }

  void addToCart(Map<String, dynamic> item) {
    bool alreadyInCart = _cartItems.contains(item);

    if (alreadyInCart) {
      int index = _cartItems.indexOf(item);
      increaseQuantity(index);
    } else {
      item['quantity'] = 1; // Set initial quantity to 1
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
      clearItems();
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

  void clearItems() {
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
