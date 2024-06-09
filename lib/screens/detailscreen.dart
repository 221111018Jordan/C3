import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas/data/foods.dart';
import 'package:uas/models/foodModel.dart';

class DetailScreen extends StatefulWidget {
  final foodModel data;

  DetailScreen({required this.data});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isFavorite = false;
  bool isInCart = false;

  @override
  void initState() {
    super.initState();
    final foodListManager = context.read<FoodListManager>();
    isFavorite = foodListManager.WishList.contains(widget.data);
    isInCart = foodListManager.CardList.contains(widget.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data.text),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.data.imagePath),
                      fit: BoxFit.fitHeight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.data.text,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Price: ${widget.data.harga}',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Description: This is a delicious ${widget.data.text} that you can enjoy any time. It is priced at ${widget.data.harga} and is part of the ${widget.data.kategori} category.',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isFavorite = !isFavorite;
                              });
                              if (isFavorite) {
                                context.read<FoodListManager>().addWish(widget.data);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("${widget.data.text} berhasil ditambahkan ke Wishlist",
                                    style: TextStyle(color: Colors.white),
                                    ), 
                                    backgroundColor: Colors.red,
                                    duration: Duration(milliseconds: 800),
                                    ),
                                );
                              } else {
                                context.read<FoodListManager>().removeWish(widget.data);
                              }
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.favorite,
                                  color: isFavorite ? Colors.red : Colors.grey,
                                  size: 26,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  isFavorite ? 'Remove from Wishlist' : 'Add to Wishlist',
                                  style: TextStyle(
                                    color: isFavorite ? Colors.red : Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(10),
                              backgroundColor: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 20),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isInCart = !isInCart;
                              });
                              if (isInCart) {
                                context.read<FoodListManager>().addChart(widget.data);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      '${widget.data.text} berhasil ditambahkan ke keranjang',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Colors.red,
                                    duration: Duration(milliseconds: 800),
                                  ),
                                );
                              } else {
                                context.read<FoodListManager>().removeChart(widget.data);
                              }
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.shopping_cart,
                                  color: isInCart ? Colors.red : Colors.grey,
                                  size: 26,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  isInCart ? 'Remove from Cart' : 'Add to Cart',
                                  style: TextStyle(
                                    color: isInCart ? Colors.red : Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(10),
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
