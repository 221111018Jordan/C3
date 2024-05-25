import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas/data/foods.dart';
import 'package:uas/wallet/wallet.dart';

class CartBottomNavbar extends StatefulWidget {
  CartBottomNavbar({Key? key}) : super(key: key);

  @override
  State<CartBottomNavbar> createState() => _CartBottomNavbarState();
}

class _CartBottomNavbarState extends State<CartBottomNavbar> {
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
                Consumer<FoodListManager>(
                    builder: ((context, value, child) {
                  return Text(
                    "Checkout Rp. ${value.totalPrice}",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  );
                }))
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
                Consumer<FoodListManager>(
                    builder: ((context, value, child) {
                  return ElevatedButton(
                    onPressed: () {
                      if (dropDownValue != null) {
                        if (dropDownValue == "Saldo") {
                          final wallet = context.read<Wallet>();
                          final foodListManager = context.read<FoodListManager>();
                          if (wallet.saldo >= value.totalPrice) {
                            wallet.pay(value.totalPrice);
                            foodListManager.Clear();
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
                })),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
