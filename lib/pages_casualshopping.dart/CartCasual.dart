import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas/data/cartprovider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          return ListView.builder(
            itemCount: cartProvider.cartItems.length,
            itemBuilder: (context, index) {
              var item = cartProvider.cartItems[index];
              return ListTile(
                leading: Image.network(item['cover']),
                title: Text(item['title']),
                subtitle: Text(item['subtitle']),
                trailing: Text(item['harga'].toString()),
              );
            },
          );
        },
      ),
    );
  }
}
