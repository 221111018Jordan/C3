import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:uas/pages_casualshopping.dart/HomePageCasual.dart';
import 'package:uas/widget/CategoriesWidget.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({super.key});

  List<String> content = [
    "https://i.pinimg.com/564x/74/03/f8/7403f86b3875302f2ba2dd790b4a8e01.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrVj6r2_M_nyQYFPuTzuF_6Zf6FaSAekfZOwuBLreAFQ&s",
    "https://areioutdoorgear.co.id/wp-content/uploads/2023/03/WhatsApp-Image-2023-03-09-at-15.47.34-1.jpeg",
    "https://cutoff.id/cdn/shop/files/ICEWASHEDBLUE.jpg?v=1686984909",
    "https://areioutdoorgear.co.id/wp-content/uploads/2023/06/WhatsApp-Image-2023-06-01-at-13.38.59.jpeg",
    "https://contents.mediadecathlon.com/p2137351/k348eebdd745c6f2531cf465fe8dd91a1/men-s-mountain-trekking-durable-shorts-mt500.jpg?format=auto&quality=70&f=768x768",
    "https://down-id.img.susercontent.com/file/id-11134207-7qul1-lke0437zzk8a3f",
    "https://down-id.img.susercontent.com/file/id-11134207-7qul1-lhx5e3hvkzckd6",
    "https://cdn.eraspace.com/media/catalog/product/a/p/apple_iphone_15_pro_max_natural_titanium_1_1_2.jpg",    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 20),
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
                  ]),
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
                          horizontal: 15
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "What would you like to have?",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const Icon(Icons.filter_list),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 20),
            child: Text(
              "Categories Food",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),

          CategoriesWidget(),

          const Padding(
            padding: EdgeInsets.only(top: 20, left: 20),
            child: Text(
              "Categories Casual Shopping",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),

          SizedBox(
            height: 5,
          ),

          Container(
            child: CarouselSlider(
              items: content.map((e) {
                return GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => HomePageCasual()
                              )
                              );

                  } ,
                  child: Container(
                    width: double.infinity,
                    height: 5,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                  color: Colors.red,
                  ) ,
                  
                );
              }).toList(), 
              
              options: CarouselOptions(height: 300, autoPlay: true)),)
        
        ],
      ),

      floatingActionButton: Container(
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
            Navigator.pushNamed(context, "cartPage");
          },
          child: Icon(
            Icons.shopping_cart,
            size: 28,
            color: Colors.red,
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
