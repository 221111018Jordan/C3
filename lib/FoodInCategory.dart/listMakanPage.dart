import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas/data/foods.dart';
import 'package:uas/data/theme.dart';
import 'package:uas/pages_food.dart/CartPage.dart';
import 'package:uas/pages_food.dart/Detailscreen.dart';

class FoodieList extends StatefulWidget {
  FoodieList({super.key, required this.kategori});

  final String kategori;

  @override
  _FoodieListState createState() => _FoodieListState();
}

class _FoodieListState extends State<FoodieList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar ${widget.kategori}"),
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
            message: 'Pergi Ke Keranjang',
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CartPage(),
                ));
              },
              child: Consumer<FoodListManager>(
                builder: (context, value, child) => Badge.count(
                  count: value.cartCount,
                  child: const Icon(Icons.shopping_cart),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Consumer<FoodListManager>(
                builder: (context, value, child) {
                  return Column(
                    children: value.foodlist
                        .where((element) => element.kategori == widget.kategori)
                        .map((e) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailScreen(data: e),
                            ));
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Provider.of<themeManager>(context).mode
                                  ? Colors.black
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                ),
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
                                          image: AssetImage(e.imagePath),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              e.text,
                                              style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              "Taste our ${e.text}",
                                              style: const TextStyle(
                                                fontSize: 10,
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              "We provide our great ${e.text}",
                                              style: TextStyle(
                                                fontSize: 10,
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            Text(
                                              "Price: ${e.harga}",
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
                                    message: 'Tambahkan ke WishList',
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          if (value.WishList.contains(e)) {
                                            context.read<FoodListManager>().removeWish(e);
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text("Makanan berhasil di hapus dari wishlist",
                                                style: TextStyle(color: Colors.white),
                                                ),
                                                backgroundColor: Colors.red,
                                                duration: Duration(seconds: 1),
                                                )
                                            );
                                          } else {
                                            context.read<FoodListManager>().addWish(e);
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                "Makanan berhasil di tambahkan ke wishlist",
                                                style: TextStyle(color: Colors.white),
                                                ),
                                                backgroundColor: Colors.green,
                                                duration: Duration(seconds: 1),
                                                ),
                                            );
                                          }
                                        });
                                      },
                                      child: Icon(
                                        Icons.favorite,
                                        color: value.WishList.contains(e) ? Colors.red : Colors.grey,
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
                                    message: 'Tambahkan ke Keranjang',
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          if (value.CardList.contains(e)) {
                                            context.read<FoodListManager>().removeChart(e);
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Makanan berhasil dihapus dari keranjang',
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                                backgroundColor: Colors.red,
                                                duration: Duration(seconds: 1),
                                              ),
                                            );
                                          } else {
                                            context.read<FoodListManager>().addChart(e);
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Makanan berhasil ditambahkan ke keranjang',
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                                backgroundColor: Colors.green,
                                                duration: Duration(seconds: 1),
                                              ),
                                            );
                                          }
                                        });
                                      },
                                      child: Icon(
                                        Icons.shopping_cart,
                                        color: value.CardList.contains(e) ? Colors.red : Colors.grey,
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
            ),
          ],
        ),
      ),
    );
  }
}
