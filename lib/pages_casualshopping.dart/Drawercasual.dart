import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas/components/users.dart';
import 'package:uas/data/theme.dart';
import 'package:uas/pages/login_page.dart';
import 'package:uas/pages_casualshopping.dart/CartCasual.dart';
import 'package:uas/pages_casualshopping.dart/WishListCasual.dart';
import 'package:uas/screens/buttonNavBar.dart';

class DrawerCasual extends StatelessWidget {
  DrawerCasual({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Consumer<userListManager>(builder: (context, value, child) {
      return ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
              accountName: Container(
                margin: const EdgeInsets.only(top: 25),
                child: Text(
                  Provider.of<userListManager>(context).currentUser.username,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              accountEmail: Text(
                Provider.of<userListManager>(context).currentUser.email,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: !value.isLogin
                    ? null
                    : value.currentUser.pfp != ""
                        ? FileImage(value.currentUser.pfp)
                        : null,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => bottonnav(
                          currentIndex:
                              Provider.of<themeManager>(context).currentIndex,
                        )));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Warna latar belakang
                elevation: 4, // Tinggi tombol terangkat
              ),
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.home,
                  color: Colors.white,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: ElevatedButton(
              onPressed: () {
                Provider.of<themeManager>(context, listen: false).currentIndex =
                    2;
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => bottonnav(
                          currentIndex:
                              Provider.of<themeManager>(context, listen: false)
                                  .currentIndex,
                        )));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Warna latar belakang
                elevation: 4, // Tinggi tombol terangkat
              ),
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.person,
                  color: Colors.white,
                ),
                title: Text(
                  'My Account',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CasualCartPage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Warna latar belakang
                elevation: 4, // Tinggi tombol terangkat
              ),
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.cart_fill,
                  color: Colors.white,
                ),
                title: Text(
                  'My Orders',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => WishListCasual()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Warna latar belakang
                elevation: 4, // Tinggi tombol terangkat
              ),
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.heart_fill,
                  color: Colors.white,
                ),
                title: Text(
                  'My Wishlist',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoginPage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Warna latar belakang
                elevation: 4, // Tinggi tombol terangkat
              ),
              child: ListTile(
                leading: Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                ),
                title: Text(
                  'Log Out',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }));
  }
}
