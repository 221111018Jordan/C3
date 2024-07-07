import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas/FoodInCategory.dart/listMakanPage.dart';
import 'package:uas/components/users.dart';
import 'package:uas/data/cartprovider.dart';
import 'package:uas/data/foods.dart';
import 'package:uas/data/theme.dart';
import 'package:uas/pages/login_page.dart';
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
      title: "C3 Project UAS",
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(),
      themeMode: Provider.of<themeManager>(context).mode
          ? ThemeMode.dark
          : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => LoginPage(),      
        "drink": (context) => FoodieList(kategori: "Minuman"),
        "snack": (context) => FoodieList(kategori: "Snack"),
        "sweet": (context) => FoodieList(kategori: "Sweet"),
        "rice": (context) => FoodieList(kategori: "Nasi"),
        "chicken": (context) => FoodieList(kategori: "Ayam"),
        "fastfood": (context) => FoodieList(kategori: "FastFood"),
        "bread": (context) => FoodieList(kategori: "Roti"),
        "japan": (context) => FoodieList(kategori: "Japan"),
        "meatball": (context) => FoodieList(kategori: "Bakso"),
        "noodle": (context) => FoodieList(kategori: "Mie"),
        "icecream": (context) => FoodieList(kategori: "IceCream"),
      },
    );
  }
}
