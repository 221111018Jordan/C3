import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas/data/foods.dart';
import 'package:uas/wallet/wallet.dart';
import 'package:intl/intl.dart';

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
                  builder: (context, value, child) {
                    final formatter = NumberFormat.currency(
                      locale: 'id_ID',
                      symbol: 'Rp. ',
                      decimalDigits: 0,
                    );
                    return Text(
                      "Checkout ${formatter.format(value.totalPrice)}",
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
                Text("Pembayaran: "),
                DropdownButton(
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
                Consumer<FoodListManager>(
                  builder: (context, foodListManager, child) {
                    return ElevatedButton(
                      onPressed: () {
                        // Cek apakah ada item dengan kuantitas 0
                        bool hasZeroQuantity = foodListManager.CardList.any((item) => item.quantity == 0);

                        if (hasZeroQuantity) {
                          // Tampilkan dialog jika ada item dengan kuantitas 0
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  "Peringatan",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.red),
                                ),
                                content: Text("Terdapat item dengan kuantitas 0 di keranjang belanja Anda."),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("OK"),
                                  ),
                                ],
                              );
                            },
                          );
                          return;
                        }

                        if (dropDownValue != null) {
                          if (dropDownValue == "Saldo") {
                            final wallet = context.read<Wallet>();
                            final cartTotal = foodListManager.totalPrice;
                            if (wallet.saldo >= cartTotal) {
                              // Tampilkan dialog konfirmasi
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Konfirmasi Pembayaran"),
                                    content: Text("Apakah Anda yakin ingin membayar menggunakan saldo?"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("Batal"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          wallet.pay(cartTotal);
                                          foodListManager.Clear();
                                          Navigator.of(context).pop();
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text('Pembayaran berhasil menggunakan saldo.'),
                                            ),
                                          );
                                        },
                                        child: const Text("Lanjut"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              // Tampilkan notifikasi jika saldo tidak mencukupi
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Saldo tidak mencukupi untuk pembayaran ini.'),
                                ),
                              );
                            }
                          } else if (dropDownValue == "Tunai") {
                            // Tampilkan dialog pembayaran tunai
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Konfirmasi Pembayaran"),
                                  content: Text("Apakah Anda yakin ingin membayar tunai?"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Batal"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        foodListManager.Clear();
                                        Navigator.of(context).pop();
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text('Pembayaran berhasil menggunakan tunai.'),
                                            backgroundColor: Colors.green,
                                            duration: Duration(milliseconds: 1000),
                                          ),
                                        );
                                      },
                                      child: const Text("Lanjut"),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Silakan pilih metode pembayaran terlebih dahulu.',
                              style: TextStyle(color: Colors.white)),
                              backgroundColor: Colors.red,
                              duration: Duration(milliseconds: 1000),
                            ),
                          );
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
