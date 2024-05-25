import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas/data/foods.dart';
import 'package:uas/data/theme.dart';
import 'package:uas/pages_food.dart/CartPage.dart';
import 'package:uas/screens/detail.dart';

class BreadList extends StatefulWidget {
  BreadList({super.key, required this.kategori});

  final String kategori;

  @override
  _BreadListState createState() => _BreadListState();
}

class _BreadListState extends State<BreadList> {
  // final List<Map<String, dynamic>> breadlist = [
  //   {"imagePath": "images/breadimages/Bagel.png", "text": "Bagel", "harga": "10", "routeName": "Bagel"},
  //   {"imagePath": "images/breadimages/Baguette_De_Campagne.png", "text": "Baguette De Campagne", "harga": "10", "routeName": "Baguette_De_Campagne"},
  //   {"imagePath": "images/breadimages/Batard.png", "text": "Batard", "harga": "10", "routeName": "Batard"},
  //   {"imagePath": "images/breadimages/Croissant.png", "text": "Croissant", "harga": "10", "routeName": "Croissant"},
  //   {"imagePath": "images/breadimages/Croissant_2.png", "text": "Croissant_2", "harga": "10", "routeName": "Croissant_2"},
  //   {"imagePath": "images/breadimages/Epi_Baguette.png", "text": "Epi Baguette", "harga": "10", "routeName": "Epi_Baguette"},
  //   {"imagePath": "images/breadimages/Ficelle.png", "text": "Ficelle", "harga": "10", "routeName": "Ficelle"},
  //   {"imagePath": "images/breadimages/Flute_Baguette.png", "text": "Flute Baguette", "harga": "10", "routeName": "Flute_Baguette"},
  //   {"imagePath": "images/breadimages/Fougasse.png", "text": "Fougasse", "harga": "10", "routeName": "Fougasse"},
  //   {"imagePath": "images/breadimages/Navette_De_Marseille.png", "text": "Navette De Marseille", "harga": "10", "routeName": "Navette_De_Marseille"},
  //   {"imagePath": "images/breadimages/Pain_7_Cereales.png", "text": "Pain 7 Cereales", "harga": "10", "routeName": "Pain_7_Cereales"},
  //   {"imagePath": "images/breadimages/Pain_Au_Chocolat.png", "text": "Pain Au Chocolat", "harga": "10", "routeName": "Pain_Au_Chocolat"},
  //   {"imagePath": "images/breadimages/Pain_Au_Levain.png", "text": "Pain Au Levain", "harga": "10", "routeName": "Pain_Au_Levain"},
  //   {"imagePath": "images/breadimages/Pain_Aux_Raisin.png", "text": "Pain Aux Raisin", "harga": "10", "routeName": "Pain_Aux_Raisin"},
  //   {"imagePath": "images/breadimages/Pain_Complet.png", "text": "Pain Complet", "harga": "10", "routeName": "Pain_Complet"},
  //   {"imagePath": "images/breadimages/Pain_De_Campagne_Rond.png", "text": "Pain De Campagne Rond", "harga": "10", "routeName": "Pain_De_Campagne_Rond"},
  //   {"imagePath": "images/breadimages/Pain_De_Mie.png", "text": "Pain De Mie", "harga": "10", "routeName": "Pain_De_Mie"},
  //   {"imagePath": "images/breadimages/Pain_De_Seigle_Noir.png", "text": "Pain De Seigle Noir", "harga": "10", "routeName": "Pain_De_Seigle_Noir"},
  //   {"imagePath": "images/breadimages/Pain_Polka.png", "text": "Pain Polka", "harga": "10", "routeName": "Pain_Polka"},
  //   {"imagePath": "images/breadimages/Petits_Pains.png", "text": "Petits Pains", "harga": "10", "routeName": "Petits_Pains"},
  //   {"imagePath": "images/breadimages/Pistolet_Bread.png", "text": "Pistolet_Bread", "harga": "10", "routeName": "Pistolet_Bread"},
  //   {"imagePath": "images/breadimages/Tabatiere_bread.png", "text": "Tabatiere bread", "harga": "10", "routeName": "Tabatiere_bread"},

  // ];

  // List<bool> isFavoriteList = List.filled(22, false);
  // List<bool> isShoppingList = List.filled(22, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Daftar ${widget.kategori}"),
          centerTitle: true,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          actions: [
            ElevatedButton(
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
                )),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                                builder: (context) => detailScreen(
                                      data: e,
                                    )));
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                            const Text(
                                              "We provide our great Snacks",
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
                                  child: ElevatedButton(
                                    onPressed: () {
                                      context
                                          .read<FoodListManager>()
                                          .addWish(e);
                                    },
                                    child: Icon(
                                      Icons.favorite,
                                      color: value.WishList.contains(e)
                                          ? Colors.red
                                          : Colors.grey,
                                      size: 26,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      padding: const EdgeInsets.all(10),
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      context
                                          .read<FoodListManager>()
                                          .addChart(e);
                                    },
                                    child: Icon(
                                      Icons.shopping_cart,
                                      color: value.CardList.contains(e)
                                          ? Colors.red
                                          : Colors.grey,
                                      size: 26,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      padding: const EdgeInsets.all(10),
                                      backgroundColor: Colors.white,
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
          ]),
        ));
  }
}
