import 'package:flutter/material.dart';

class themeManager with ChangeNotifier {
  bool _mode = false;

  bool get mode => _mode;

  int currentIndex = 0;

  void changeCurrentIndex(value) {
    currentIndex = value;
    notifyListeners();
  }

  void changeMode() {
    _mode = !_mode;
    notifyListeners();
  }
}
