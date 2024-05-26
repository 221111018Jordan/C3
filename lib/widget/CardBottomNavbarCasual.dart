import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas/data/cartprovider.dart';
import 'package:uas/wallet/wallet.dart'; // Import CartProvider

class CartBottomNavbarCasual extends StatefulWidget {
  CartBottomNavbarCasual({Key? key}) : super(key: key);

  @override
  State<CartBottomNavbarCasual> createState() => _CartBottomNavbarCasualState();
}

class _CartBottomNavbarCasualState extends State<CartBottomNavbarCasual> {
  dynamic dropDownValue;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "Total",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 15),
                Consumer<CartProvider>(
                  builder: (context, cartProvider, child) {
                    double totalPrice = 0;
                    for (Map<String, dynamic> item in cartProvider.cartItems) {
                      totalPrice += item['harga'] * item['quantity'];
                    }
                    return Text(
                      "Checkout Rp. $totalPrice", // Menggunakan total harga dari CartProvider
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    );
                  },
                ),
              ],
            ),
            Row(
              children: [
                Text("Pembayaran : "),
                SizedBox(
                  child: DropdownButton(
                    hint: Text("Pilihan"),
                    value: dropDownValue,
                    items: [
                      DropdownMenuItem(
                        child: Text("Tunai"),
                        value: "Tunai",
                      ),
                      DropdownMenuItem(
                        child: Text("Saldo"),
                        value: "Saldo",
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        dropDownValue = value.toString();
                      });
                    },
                  ),
                ),
                Consumer<CartProvider>(
                  builder: (context, cartProvider, child) {
                    return ElevatedButton(
                      onPressed: () {
                        if (dropDownValue != null) {
                            if (dropDownValue == "Saldo") {
                              final wallet = context.read<Wallet>();
                            if (wallet.saldo >= cartProvider.totalPrices) {
                              wallet.pay(cartProvider.totalPrices);
                              cartProvider.ClearItems();
                            } else {
                              // Tampilkan notifikasi jika saldo tidak mencukupi
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Saldo tidak mencukupi untuk pembayaran ini.'),
                                ),
                              );
                            }
                          }
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 20,
                          ),
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Order Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
