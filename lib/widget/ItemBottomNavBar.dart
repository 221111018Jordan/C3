import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemBottomNavBar extends StatelessWidget {
  const ItemBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Text(
                "Total", 
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold),
            ),

            SizedBox(width: 15),
            
            Text(
              "Rp. 100.000", 
              style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
            ),
            ],
            ),
            ElevatedButton.icon(
              onPressed: (){},
              style: ButtonStyle(
                backgroundColor: 
                const MaterialStatePropertyAll(Colors.red),
                padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(
                  vertical: 13,
                  horizontal: 15,
                  ),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                  )
              ),
              icon: const Icon(CupertinoIcons.cart,
              color: Colors.white,
              ),
              
              label: const Text("Add To Cart",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),),
              ),
          ],
        ),

        ),
    );
  }
}