import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:uas/screens/buttonNavBar.dart';
import 'package:uas/wallet/wallet.dart';

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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => bottonnav(currentIndex: 0)));
              },
              child: Text("BACK TO HOME"))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                controller: jumlah,
                enabled: true,
                decoration: InputDecoration(
                  label: Text("Input Jumlah Topup"),
                  prefixIcon: Icon(Icons.money),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<Wallet>().topup(int.tryParse(jumlah.text) ?? 0);
                  jumlah.text = "";
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
