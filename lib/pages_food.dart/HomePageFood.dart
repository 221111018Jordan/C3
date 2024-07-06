import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas/FoodInCategory.dart/listMakanPage.dart';
import 'package:uas/data/foods.dart';
import 'package:uas/data/theme.dart';
import 'package:uas/models/foodModel.dart';
import 'package:uas/pages_food.dart/CartPage.dart';
import 'package:uas/screens/buttonNavBar.dart';
import 'package:uas/widget/DrawerWidget.dart';

class HomePageFood extends StatefulWidget {
  HomePageFood({Key? key}) : super(key: key);

  @override
  State<HomePageFood> createState() => _HomePageFoodState();
}

class _HomePageFoodState extends State<HomePageFood> {
  List<foodModel> listfood = FoodListManager().foodlist;

  Set<String> listkategori = {};
  Set<String> selectedkategori = {};

  @override
  void initState() {
    super.initState();
    for (foodModel i in listfood) {
      listkategori.add(i.kategori.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return Tooltip(
              message: 'Menu',
              child: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            );
          },
        ),
        actions: [
          Tooltip(
            message: 'Home',
            child: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return bottonnav(currentIndex: 0);
                    },
                  ),
                );
              },
              icon: Icon(Icons.home_sharp),
            ),
          ),
        ],
      ),
      backgroundColor: Provider.of<themeManager>(context).mode ? Colors.black : Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 6),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.search,
                        color: Colors.red,
                      ),
                      SizedBox(
                        height: 50,
                        width: 300,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: "What would you like to have?",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      const Tooltip(
                        message: 'Filter',
                        child: Icon(Icons.filter_list),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: listkategori
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FilterChip(
                            selected: selectedkategori.contains(e),
                            label: Text(e),
                            onSelected: (value) {
                              setState(() {
                                if (selectedkategori.contains(e)) {
                                  selectedkategori.remove(e);
                                } else {
                                  selectedkategori.add(e);
                                }
                              });
                            },
                          ),
                        ))
                    .toList(),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: double.infinity,
                width: 400,
                child: Consumer<FoodListManager>(
                  builder: (context, value, child) {
                    return GridView(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 2,
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.25,
                      ),
                      children: value.foodlist.where((element) {
                        if (selectedkategori.isEmpty) {
                          return true;
                        } else {
                          return selectedkategori.contains(element.kategori);
                        }
                      }).map((element) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => FoodieList(kategori: element.kategori),
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                element.imagePath,
                                fit: BoxFit.cover,
                                height: 150,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      element.text,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Provider.of<themeManager>(context).mode ? Colors.white : Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'kategori: ${element.kategori}',
                                      style: TextStyle(
                                        color: Provider.of<themeManager>(context).mode ? Colors.white : Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'Price: ${element.harga}',
                                      style: TextStyle(
                                        color: Provider.of<themeManager>(context).mode ? Colors.white : Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: DrawerWidget(),
      floatingActionButton: Tooltip(
        message: 'Ke Keranjang',
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => CartPage()));
            },
            child: Icon(
              Icons.shopping_cart,
              size: 28,
              color: Colors.red,
            ),
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
