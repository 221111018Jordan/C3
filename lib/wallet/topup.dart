import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas/data/theme.dart';
import 'package:uas/pages/register.dart';
import 'package:uas/screens/buttonNavBar.dart';
import 'package:uas/wallet/wallet.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Walletup extends StatefulWidget {
  Walletup({super.key});
  bool isLoading = false;

  @override
  State<Walletup> createState() => _WalletupState();
}

class _WalletupState extends State<Walletup> {
  TextEditingController jumlah = TextEditingController();
  bool errorActive = false;

  void generateImage() async {
    widget.isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2), () {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("berhasil",textAlign: TextAlign.center,),
              content: SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Image.network(
                      "https://st4.depositphotos.com/25868248/29022/v/1600/depositphotos_290222400-stock-illustration-green-check-mark-icon-checkmark.jpg")),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      context.read<Wallet>().topup(_parseCurrency(jumlah.text));
                      jumlah.text = "";
                    },
                    child: Text("close")),
              ],
            );
          });

      widget.isLoading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TOP UP"),
        automaticallyImplyLeading: false,
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => bottonnav(currentIndex: 0)));
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
                    decoration: const InputDecoration(
                      label: Text("Input Jumlah Topup"),
                      prefixIcon: Icon(Icons.money),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                      if (jumlah.text.isEmpty) {
                        errorActive = true;
                      } else {
                        errorActive = false;
                        generateImage();
                      }  
                      });
                    },
                    child: Text("Submit"))
              ],
            ),
            Center(
                child: Text(
              "Harus berisi angka ",
              style: TextStyle(
                color: errorActive ? Colors.red : Provider.of<themeManager>(context).mode
                                  ? Colors.black
                                  : Colors.white,
              ),
            )),
            SizedBox(
              height: 300,
              width: 300,
              child: widget.isLoading ? const Center(
                child: CircularProgressIndicator(),
              ):Text("nothing",style: TextStyle(color: Provider.of<themeManager>(context).mode
                                  ? Colors.black
                                  : Colors.white,),)),
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
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text.replaceAll('.', '');

    if (newText.isEmpty) {
      return newValue.copyWith(text: '');
    }

    final number = int.tryParse(newText) ?? 0;
    if (number > 100000000) {
      return oldValue; // Keep old value if new value exceeds 100,000,000
    }

    final formatted = formatter
        .format(number)
        .replaceAll(',', '.'); // Replace commas with dots

    return newValue.copyWith(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
