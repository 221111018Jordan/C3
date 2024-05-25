import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  CategoriesWidget({super.key});

  // Daftar gambar dan teks yang akan ditampilkan
  final List<Map<String, dynamic>> categories = [
    {"imagePath": "images/drink.jpg", "text": "Minuman", "routeName": "drink"},
    {"imagePath": "images/snack.png", "text": "Snack", "routeName": "snack"},
    {"imagePath": "images/sweet.jpg", "text": "Manisan", "routeName": "sweet"},
    {"imagePath": "images/rice.jpg", "text": "Aneka Nasi", "routeName": "rice"},
    {"imagePath": "images/chicken.jpg", "text": "Ayam dan Bebek", "routeName": "chicken"},
    {"imagePath": "images/fastfood.jpg", "text": "Cepat Saji", "routeName": "fastfood"},
    {"imagePath": "images/bread.png", "text": "Roti", "routeName": "bread"},
    {"imagePath": "images/japan.png", "text": "Jepang", "routeName": "japan"},
    {"imagePath": "images/meatball.jpeg", "text": "Bakso dan Soto", "routeName": "meatball"},
    {"imagePath": "images/noodle.jpg", "text": "Mie", "routeName": "noodle"},
    {"imagePath": "images/IceCream.jpg", "text": "Ice Cream", "routeName": "icecream"},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, category["routeName"]);
              },
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, category["routeName"]);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Image.asset(
                        category["imagePath"],
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    category["text"],
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
