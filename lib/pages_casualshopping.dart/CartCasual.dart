import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas/data/cartprovider.dart';
import 'package:uas/widget/CardBottomNavbarCasual.dart';

class CasualCartPage extends StatelessWidget {
  CasualCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Casual Shopping Cart'),
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
            message: 'Kembali ke Home',
            child: IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
          ),
        ],
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          return cartProvider.cartItems.isEmpty
              ? Center(
                  child: Text(
                    'Keranjang belanja Casual kosong',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(20),
                  child: ListView.builder(
                    itemCount: cartProvider.cartItems.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> item = cartProvider.cartItems[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 10,
                                offset: Offset(0, 3), // changes position of shadow
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
                                        image: NetworkImage(item['cover']),
                                        fit: BoxFit.contain,
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
                                            item['title'],
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            item['subtitle'],
                                            style: const TextStyle(
                                              fontSize: 10,
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          Text(
                                            "Price: ${item['harga']}",
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
                                child: Row(
                                  children: [
                                    Tooltip(
                                      message: 'Kurang Item',
                                      child: ElevatedButton(
                                        onPressed: () {
                                          cartProvider.decreaseQuantity(index);
                                        },
                                        child: Icon(
                                          Icons.remove,
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
                                    Text("${item['quantity']}"),
                                    Tooltip(
                                      message: 'Tambah Item',
                                      child: ElevatedButton(
                                        onPressed: () {
                                          cartProvider.increaseQuantity(index);
                                        },
                                        child: Icon(
                                          Icons.add,
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
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Tooltip(
                                  message: 'Hapus Item',
                                  child: ElevatedButton(
                                    onPressed: () {
                                      cartProvider.removeFromCart(item);
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
                      );
                    },
                  ),
                );
        },
      ),
      bottomNavigationBar: Container(
        height: 120,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CartBottomNavbarCasual(),
        ),
      ),
    );
  }
}
