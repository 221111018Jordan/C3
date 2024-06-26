import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas/data/foods.dart';
import 'package:uas/pages_food.dart/detailscreen.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("WishList"),
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Consumer<FoodListManager>(
                  builder: (context, value, child) {
                    return Column(
                      children: value.WishList.asMap().entries.map((entry) {
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
        ),
      ),
    );
  }
}
