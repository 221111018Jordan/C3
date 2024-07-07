import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas/data/cartprovider.dart';
import 'package:uas/pages_casualshopping.dart/DateScreenCasual.dart';
import 'package:uas/wallet/wallet.dart';

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
                      "Checkout \nRp.$totalPrice",
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
                        // Cek apakah ada item dengan kuantitas 0
                        bool hasZeroQuantity = cartProvider.cartItems.any((item) => item['quantity'] == 0);

                        if (hasZeroQuantity) {
                          // Tampilkan dialog jika ada item dengan kuantitas 0
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Peringatan",
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
                            final cartTotal = cartProvider.totalPrices;
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
                                          cartProvider.clearItems();
                                          Navigator.of(context).pop();
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text('Pembayaran berhasil menggunakan saldo.'),
                                            ),
                                          );
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => DateCasual(),));
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
                                        cartProvider.clearItems();
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
