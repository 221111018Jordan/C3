import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas/FoodInCategory.dart/listMakanPage.dart';
import 'package:uas/components/users.dart';
import 'package:uas/data/cartprovider.dart';
import 'package:uas/data/foods.dart';
import 'package:uas/data/theme.dart';
import 'package:uas/pages_food.dart/CartPage.dart';
import 'package:uas/pages_food.dart/HomePageFood.dart';
import 'package:uas/pages_food.dart/ItemPage.dart';
import 'package:uas/pages/login_page.dart';
import 'package:uas/pages_food.dart/WishList.dart';
import 'package:uas/screens/buttonNavBar.dart';
import 'package:uas/wallet/wallet.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => userListManager()),
    ChangeNotifierProvider(create: (context) => FoodListManager()),
    ChangeNotifierProvider(create: (context) => Wallet()),
    ChangeNotifierProvider(create: (context) => themeManager()),
    ChangeNotifierProvider(create: (context) => CartProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(),
      themeMode: Provider.of<themeManager>(context).mode
          ? ThemeMode.dark
          : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => LoginPage(),
        "homepage": (context) => bottonnav(
              currentIndex: Provider.of<themeManager>(context).currentIndex,
            ),
        "wishlist": (context) => WishList(),
        "homepagefood": (context) => HomePageFood(),
        "cartPage": (context) => const CartPage(),
        "itemPage": (context) => const ItemPage(),
        "drink": (context) => BreadList(kategori: "Minuman"),
        "snack": (context) => BreadList(kategori: "Snack"),
        "sweet": (context) => BreadList(kategori: "Sweet"),
        "rice": (context) => BreadList(kategori: "Nasi"),
        "chicken": (context) => BreadList(kategori: "Ayam"),
        "fastfood": (context) => BreadList(kategori: "FastFood"),
        "bread": (context) => BreadList(kategori: "Roti"),
        "japan": (context) => BreadList(kategori: "Japan"),
        "meatball": (context) => BreadList(kategori: "Bakso"),
        "noodle": (context) => BreadList(kategori: "Mie"),
        "icecream": (context) => BreadList(kategori: "IceCream"),
        // "Air_Mineral_3Botol": (context) => const Air_Mineral3botol(),
      },
    );
  }
}
