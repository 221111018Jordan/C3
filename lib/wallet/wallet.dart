import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class Wallet with ChangeNotifier {
  int _saldo = 0;

  int get saldo => _saldo;

  String get formattedSaldo => formatCurrency(_saldo);

  void topup(int value) {
    _saldo += value;
    notifyListeners();
  }

  void pay(int value) {
    if (_saldo >= value) {
      _saldo -= value;
    } else {
      // Kirim notifikasi bahwa saldo tidak mencukupi
      debugPrint('Saldo tidak mencukupi untuk pembayaran ini.');
    }
    notifyListeners();
  }
}

String formatCurrency(int amount) {
  final NumberFormat formatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );
  return formatter.format(amount);
}
