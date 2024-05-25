import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas/pages_casualshopping.dart/HomePageCasual.dart';
import 'package:uas/pages_food.dart/HomePageFood.dart';
import 'package:uas/screens/botnav.dart';
import 'package:uas/screens/buttonNavBar.dart';
import 'package:uas/wallet/textfield.dart';
import 'package:uas/wallet/topup.dart';
import 'package:uas/wallet/wallet.dart';
import 'package:uas/widget/ButtonHomePage.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  TextEditingController jumlah = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: double.infinity,
          width: 700,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 153, 151, 221),
                    border: Border.all(
                      color: Color.fromARGB(255, 0, 0, 0),
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: Icon(Icons.person, size: 40),
                        ),
                        Consumer<Wallet>(
                            builder: (context, value, child) => Text(
                                  "Saldomu : Rp. ${value.saldo}",
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold),
                                )),
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Walletup()));
                          },
                          icon: Icon(Icons.add, size: 40),
                          label: Text("TOP UP"),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Testing(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePageFood()));
                      },
                      icon: Icons.food_bank,
                      title: "Shopping Food",
                    ),
                    Testing(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePageCasual(),
                          ),
                        );
                      },
                      icon: Icons.shopping_bag,
                      title: "Casual Shopping",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(100, 100, 100, 100),
    );
  }
}
