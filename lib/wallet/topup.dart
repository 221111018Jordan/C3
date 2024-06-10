import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas/screens/buttonNavBar.dart';
import 'package:uas/wallet/wallet.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Walletup extends StatefulWidget {
  Walletup({super.key});

  @override
  State<Walletup> createState() => _WalletupState();
}

class _WalletupState extends State<Walletup> {
  TextEditingController jumlah = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TOP UP"),
        automaticallyImplyLeading: false,
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => bottonnav(currentIndex: 0)));
              },
              child: Text("BACK TO HOME"))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Saldo Anda: ${context.watch<Wallet>().formattedSaldo}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: jumlah,
                    inputFormatters: [CurrencyTextInputFormatter()],
                    decoration: InputDecoration(
                      label: Text("Input Jumlah Topup"),
                      prefixIcon: Icon(Icons.money),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<Wallet>().topup(_parseCurrency(jumlah.text));
                      jumlah.text = "";
                    },
                    child: Text("Submit"))
              ],
            ),
          ],
        ),
      ),
    );
  }

  int _parseCurrency(String value) {
    value = value.replaceAll('.', ''); // Remove the dot separators
    return int.tryParse(value) ?? 0;
  }
}

class CurrencyTextInputFormatter extends TextInputFormatter {
  final formatter = NumberFormat.decimalPattern('en_US');

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text.replaceAll('.', '');

    if (newText.isEmpty) {
      return newValue.copyWith(text: '');
    }

    final number = int.tryParse(newText) ?? 0;
    if (number > 100000000) {
      return oldValue; // Keep old value if new value exceeds 100,000,000
    }

    final formatted = formatter.format(number).replaceAll(',', '.'); // Replace commas with dots

    return newValue.copyWith(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
