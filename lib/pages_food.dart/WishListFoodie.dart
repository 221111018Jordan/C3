import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas/data/foods.dart';
import 'package:uas/pages_food.dart/Detailscreen.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("WishList Foodies"),
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
                child: Consumer<FoodListManager>(builder: (context, value, child) {
                  if (value.WishList.isEmpty) {
                    return Center(
                      child: Text(
                        "Wishlist Belanja Food Kosong",
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
                child: Consumer<FoodListManager>(
                  builder: (context, value, child) {
                    return Column(
                      children: value.WishList.
                      asMap().entries
                      .map((entry) {
                        final wishlist = entry.value;
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                        data: wishlist,
                                      )));
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
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
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                          ),
                                          image: DecorationImage(
                                            image:
                                                AssetImage(wishlist.imagePath),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                wishlist.text,
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                "Taste our ${wishlist.text}",
                                                style: const TextStyle(
                                                  fontSize: 10,
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              const Text(
                                                "We provide our great Foodie",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                              Text(
                                                "Price: ${wishlist.harga}",
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                ),
                                              ),
                                              const SizedBox(height: 10),
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
                                      message: 'Tambahkan ke Keranjang',
                                      child: ElevatedButton(
                                        onPressed: () {
                                          final foodListManager = context.read<FoodListManager>();
                                          if (foodListManager.CardList.contains(wishlist)) {
                                            foodListManager.removeChart(wishlist);
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Makanan berhasil dihapus dari keranjang',
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                                backgroundColor: Colors.red,
                                                duration: Duration(milliseconds: 800),
                                              ),
                                            );
                                          } else {
                                            foodListManager.addChart(wishlist);
                                            // context.read<FoodListManager>().removeWish(wishlist);
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Makanan berhasil ditambahkan ke keranjang',
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                                backgroundColor: Colors.green,
                                                duration: Duration(milliseconds: 800),
                                              ),
                                            );
                                          }
                                        },
                                        child: Icon(
                                          Icons.shopping_cart,
                                          color: context.read<FoodListManager>().CardList.contains(wishlist) ? Colors.red : Colors.grey,
                                          size: 26,
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          shape: const CircleBorder(),
                                          padding: const EdgeInsets.all(10),
                                          backgroundColor: Colors.white,
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
                                          context
                                              .read<FoodListManager>()
                                              .removeWish(wishlist);
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                          size: 26,
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          shape: const CircleBorder(),
                                          padding: const EdgeInsets.all(10),
                                          backgroundColor: Colors.white,
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
