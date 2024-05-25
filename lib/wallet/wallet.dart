import 'package:flutter/cupertino.dart';

class Wallet with ChangeNotifier {
  int _saldo = 100000;

  int get saldo => _saldo;

  void topup(int value) {
    notifyListeners();

    _saldo += value;
  }

  void pay(int value) {
    notifyListeners();
    if (_saldo >= value) {
      _saldo -= value;
    } else {
      // Kirim notifikasi bahwa saldo tidak mencukupi
      debugPrint('Saldo tidak mencukupi untuk pembayaran ini.');
    }
  }
}



