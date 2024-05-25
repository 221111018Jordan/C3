import 'package:clippy_flutter/arc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:uas/widget/ItemBottomNavBar.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Builder(
    builder: (BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () { Scaffold.of(context).openDrawer(); },
      );
    },),),
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Image.asset(
                "images/pizza.png",
                height: 300,
                // width: double.infinity,
                // width: 100 ,
              ),
              ),

              Arc(
                edge: Edge.TOP,
                arcType: ArcType.CONVEY,
                height: 30,
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column( 
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 60,bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RatingBar.builder(
                                    initialRating: 4,
                                    minRating: 1,
                                    direction : Axis.horizontal,
                                    itemCount: 5,
                                    itemSize: 18,
                                    itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star, color: Colors.red,),
                                    onRatingUpdate: (index) {},
                                    ),
                                    const Text(
                                      "Rp 15.000",
                                    style:  TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    )
                          ],
                        ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Hot Pizza",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ), 
                              ),

                              Container(
                                width: 90,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color:Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Row(
                                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(CupertinoIcons.minus, 
                                    color: Colors.white,
                                    size: 20,
                                    ),
                                    Text(
                                      "1",
                                      style: TextStyle(
                                        fontSize: 16, 
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold) ,
                                      ),
                                    Icon(CupertinoIcons.plus, 
                                    color: Colors.white,
                                    size: 20,
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                          ),

                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,),
                              child: Text(
                                "Taste Our Hot Pizza at low price, This is famous Pizza and you will love out, it will cost yout at low price, we hope you will enjoy and order many times",
                                style: TextStyle(fontSize: 16),
                                  textAlign: TextAlign.justify,
                                ),
                                ),

                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 15,),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Delivery Time",
                                          style: TextStyle(fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic),
                                          ),

                                      Row(
                                        children: [
                                          Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 5),
                                          child: Icon(
                                            CupertinoIcons.clock,
                                            color: Colors.red,
                                            ),
                                            ),

                                            Text(
                                          "30 Minutes",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                          ),
                                        ],
                                      ),

                                      ],
                                    ),
                                      ),
                                
                      ],
                    ),
                  ),
                ),
              ),

          ],
        ),
        ),
        bottomNavigationBar: const ItemBottomNavBar(),
    );
  }
}