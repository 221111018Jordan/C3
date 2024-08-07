import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas/pages_casualshopping.dart/DetailScreenCasual.dart';
import 'package:uas/data/cartprovider.dart';
import 'package:uas/pages_casualshopping.dart/CartCasual.dart';
import 'package:uas/pages_casualshopping.dart/Drawercasual.dart';
import 'package:intl/intl.dart'; // Tambahkan ini

List<Map<String, dynamic>> content = [
  {
    "screen": "Casual Shopping",
    "contents": [
      {
        "tab": "Trending",
        "data": [
          {
            "title": "Kaos Oblong",
            "subtitle": "Warna Hitam",
            "harga": 20000,
            "quantity": 0,
            "cover":
                "https://i.pinimg.com/564x/74/03/f8/7403f86b3875302f2ba2dd790b4a8e01.jpg"
          },
          {
            "title": "Kaos Distro",
            "subtitle": "Motif Kombinasi",
            "harga": 30000,
            "quantity": 0,
            "cover":
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrVj6r2_M_nyQYFPuTzuF_6Zf6FaSAekfZOwuBLreAFQ&s"
          },
          {
            "title": "Celana Panjang",
            "subtitle": "Outdoor",
            "harga": 25000,
            "quantity": 0,
            "cover":
                "https://areioutdoorgear.co.id/wp-content/uploads/2023/03/WhatsApp-Image-2023-03-09-at-15.47.34-1.jpeg"
          },
          {
            "title": "Celana Panjang",
            "subtitle": "Pria Stretch Regular Fit",
            "harga": 37000,
            "quantity": 0,
            "cover":
                "https://cutoff.id/cdn/shop/files/ICEWASHEDBLUE.jpg?v=1686984909"
          },
          {
            "title": "Celana Pendek",
            "subtitle": "Pria ADV 03 Arei Outdoorgear",
            "harga": 26000,
            "quantity": 0,
            "cover":
                "https://areioutdoorgear.co.id/wp-content/uploads/2023/06/WhatsApp-Image-2023-06-01-at-13.38.59.jpeg"
          },
          {
            "title": "Celana Pendek",
            "subtitle": "Pria Trekking Gunung Durable MT500",
            "harga": 20000,
            "quantity": 0,
            "cover":
                "https://contents.mediadecathlon.com/p2137351/k348eebdd745c6f2531cf465fe8dd91a1/men-s-mountain-trekking-durable-shorts-mt500.jpg?format=auto&quality=70&f=768x768"
          },
        ]
      },
      {
        "tab": "News",
        "data": [
          {
            "title": "PC Gaming",
            "subtitle": "Thunder 2.0 Middle Spec",
            "harga": 12000000,
            "quantity": 0,
            "cover":
                "https://down-id.img.susercontent.com/file/id-11134207-7qul1-lke0437zzk8a3f"
          },
          {
            "title": "PC Gaming",
            "subtitle": "I-5",
            "harga": 11000000,
            "quantity": 0,
            "cover":
                "https://down-id.img.susercontent.com/file/id-11134207-7qul1-lhx5e3hvkzckd6"
          },
        ]
      },
      {
        "tab": "Flash Sale",
        "data": [
          {
            "title": "iPhone 15 Pro Max",
            "subtitle": "Warna Silver",
            "harga": 22999000,
            "quantity": 0,
            "cover":
                "https://cdn.eraspace.com/media/catalog/product/a/p/apple_iphone_15_pro_max_natural_titanium_1_1_2.jpg"
          },
        ]
      },
    ]
  },
];

List<Map<String, dynamic>> contents() {
  return content[_currentIndex]['contents'];
}

List<dynamic> data() {
  if (content[_currentIndex]['contents'][_currentBottomIndex]['data'].length >
      0) {
    return content[_currentIndex]['contents'][_currentBottomIndex]['data'];
  }
  return [];
}

List<dynamic> allData() {
  List<dynamic> allDataList = [];

  for (var screen in content) {
    for (var tab in screen['contents']) {
      if (tab['data'].length > 0) {
        allDataList.addAll(tab['data']);
      }
    }
  }

  return allDataList;
}

int _currentIndex = 0;
int _currentBottomIndex = 0;

class HomePageCasual extends StatefulWidget {
  final int initialTabIndex;

  HomePageCasual({super.key, this.initialTabIndex = 0});

  @override
  State<HomePageCasual> createState() => _HomePageCasualState();
}

class _HomePageCasualState extends State<HomePageCasual> {
  @override
  void initState() {
    super.initState();
    _currentBottomIndex = widget.initialTabIndex;
  }

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.currency(
        locale: 'id_ID', symbol: 'Rp', decimalDigits: 0); // Format Rupiah tanpa desimal
    return DefaultTabController(
      length: 3,
      initialIndex: _currentBottomIndex,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            content[_currentIndex]['screen'],
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          leading: Builder(
            builder: (BuildContext context) {
              return Tooltip(
                message: 'Menu',
                child: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              );
            },
          ),
          bottom: TabBar(
            onTap: (value) {
              setState(() {
                _currentBottomIndex = value;
              });
            },
            labelColor: Colors.green,
            indicatorColor: Colors.amber,
            unselectedLabelColor: Colors.red,
            tabs: contents().map((e) {
              return Tab(
                child: Text("${e['tab']}"),
              );
            }).toList(),
          ),
        ),
        drawer: DrawerCasual(),
        body: data().isNotEmpty
            ? ListView(
                children: data().map((e) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailScreenCasual(item: e),
                      ));
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 50,
                              child: Image.network(e['cover']),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e['title'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    e['subtitle'],
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            Column(
                              children: [
                                Text(
                                  formatCurrency.format(e['harga']),
                                  style: TextStyle(
                                    color: Colors.pink,
                                    fontSize: 12,
                                  ),
                                ),
                                Tooltip(
                                  message: 'Tambah Ke Keranjang',
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Provider.of<CartProvider>(context,
                                              listen: false)
                                          .addToCart(e);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Item berhasil ditambahkan ke keranjang',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          backgroundColor: Colors.green,
                                          duration: Duration(
                                              milliseconds:
                                                  800), // Durasi tampilan notifikasi
                                        ),
                                      );
                                    },
                                    child: Icon(Icons.shopping_cart),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              )
            : Center(
                child: Text(
                    "${content[_currentIndex]['screen']} ${content[_currentIndex]['contents'][_currentBottomIndex]['tab']} Kosong"),
              ),
        floatingActionButton: Tooltip(
          message: 'Pergi Ke Keranjang',
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CasualCartPage(),
                ),
              );
            },
            child: Icon(Icons.shopping_cart),
          ),
        ),
      ),
    );
  }
}