import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas/data/cartprovider.dart';
import 'package:uas/pages_casualshopping.dart/DetailScreenCasual.dart';
import 'package:intl/intl.dart';

class WishListCasual extends StatelessWidget {
  const WishListCasual({super.key});

  @override
  Widget build(BuildContext context) {
    final NumberFormat currencyFormat =
        NumberFormat.currency(locale: 'id', symbol: 'Rp', decimalDigits: 0);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Text("WishList Casual Shopping"),
              centerTitle: true,
              leading: Tooltip(
                message: 'Back',
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              actions: [
                Tooltip(
                  message: 'Home',
                  child: IconButton(
                    icon: const Icon(Icons.home),
                    onPressed: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                  ),
                ),
              ],
            ),
            body: Padding(
                padding: const EdgeInsets.all(5),
                child: Consumer<CartProvider>(builder: (context, value, child) {
                  if (value.wishListItems.isEmpty) {
                    return Center(
                      child: Text(
                        "Wishlist Belanja Kosong",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    );
                  }

                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Consumer<CartProvider>(
                            builder: (context, cartProvider, child) {
                              if (cartProvider.wishListItems.isEmpty) {
                                return const Center(
                                  child: Text("Wishlist Anda kosong"),
                                );
                              }
                              return Column(
                                children: cartProvider.wishListItems
                                    .map((wishlistItem) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailScreenCasual(
                                                      item: wishlistItem,
                                                    )));
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 3,
                                              blurRadius: 10,
                                              offset: const Offset(0, 3),
                                            )
                                          ],
                                        ),
                                        child: Stack(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  width: 130,
                                                  height: 150,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(10),
                                                      bottomLeft:
                                                          Radius.circular(10),
                                                    ),
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          wishlistItem[
                                                              'cover']),
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 20),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          wishlistItem['title'],
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 5),
                                                        Text(
                                                          wishlistItem[
                                                              'subtitle'],
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 20),
                                                        Text(
                                                          "Price: ${currencyFormat.format(wishlistItem['harga'])}",
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 10),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Positioned(
                                              top: 0,
                                              right: 0,
                                              child: Tooltip(
                                                message:
                                                    'Tambahkan ke Keranjang',
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    if (cartProvider.cartItems
                                                        .contains(
                                                            wishlistItem)) {
                                                      cartProvider
                                                          .removeFromCart(
                                                              wishlistItem);
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: const Text(
                                                            'Makanan berhasil dihapus dari keranjang',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          backgroundColor:
                                                              Colors.red,
                                                          duration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      800),
                                                        ),
                                                      );
                                                    } else {
                                                      cartProvider.addToCart(
                                                          wishlistItem);
                                                      // cartProvider.removeWishList(wishlistItem);
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: const Text(
                                                            'Makanan berhasil ditambahkan ke keranjang',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          backgroundColor:
                                                              Colors.green,
                                                          duration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      800),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                  child: Icon(
                                                    Icons.shopping_cart,
                                                    color: cartProvider
                                                            .cartItems
                                                            .contains(
                                                                wishlistItem)
                                                        ? Colors.red
                                                        : Colors.grey,
                                                    size: 26,
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    shape: const CircleBorder(),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    backgroundColor:
                                                        Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              right: 0,
                                              child: Tooltip(
                                                message: 'Hapus dari Wishlist',
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    cartProvider.removeWishList(
                                                        wishlistItem);
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: const Text(
                                                          'Makanan berhasil dihapus dari wishlist',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        backgroundColor:
                                                            Colors.red,
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    800),
                                                      ),
                                                    );
                                                  },
                                                  child: const Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                    size: 26,
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    shape: const CircleBorder(),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    backgroundColor:
                                                        Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  );
                }
                )
                )
                )
                );
  }
}
