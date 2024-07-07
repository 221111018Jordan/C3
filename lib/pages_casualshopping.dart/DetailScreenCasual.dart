import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas/data/cartprovider.dart';
import 'package:intl/intl.dart'; // Tambahkan ini

class DetailScreenCasual extends StatefulWidget {
  final Map<String, dynamic> item;

  DetailScreenCasual({required this.item});

  @override
  State<DetailScreenCasual> createState() => _DetailScreenCasualState();
}

class _DetailScreenCasualState extends State<DetailScreenCasual> {
  bool isFavorite = false;
  bool isInCart = false;

  @override
  void initState() {
    super.initState();
    isFavorite = context.read<CartProvider>().wishListItems.contains(widget.item);
    isInCart = context.read<CartProvider>().cartItems.contains(widget.item);
  }

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0); // Format Rupiah tanpa desimal

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item['title']),
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
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(widget.item['cover']),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.item['title'],
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.item['subtitle'],
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    Text(
                      'Price: ${formatCurrency.format(widget.item['harga'])}',
                      style: TextStyle(fontSize: 18, color: Colors.green),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 10,left: 5,right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Tooltip(
                        message: 'Tambahkan Ke Wishlist',
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                            if (isFavorite) {
                              Provider.of<CartProvider>(context, listen: false)
                                  .addToWishList(widget.item);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "${widget.item['title']} berhasil ditambahkan ke Wishlist",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.green,
                                  duration: Duration(milliseconds: 800),
                                ),
                              );
                            } else {
                              Provider.of<CartProvider>(context, listen: false)
                                  .removeWishList(widget.item);
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
                      ),
                      const SizedBox(width: 20),
                      Tooltip(
                        message: 'Tambahkan Ke Keranjang',
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isInCart = !isInCart;
                            });
                            if (isInCart) {
                              Provider.of<CartProvider>(context, listen: false)
                                  .addToCart(widget.item);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    '${widget.item['title']} berhasil ditambahkan ke keranjang',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.green,
                                  duration: Duration(milliseconds: 800),
                                ),
                              );
                            } else {
                              Provider.of<CartProvider>(context, listen: false)
                                  .removeFromCart(widget.item);
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
