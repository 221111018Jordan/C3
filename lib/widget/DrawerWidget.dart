import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas/components/users.dart';
import 'package:uas/pages/login_page.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
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
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage("images/avatar.jpg"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "homepage");
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
                // Lakukan aksi saat tombol "My Account" ditekan
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
                // Lakukan aksi saat tombol "My Orders" ditekan
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
                Navigator.pushNamed(context, "wishlist");
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
                // Lakukan aksi saat tombol "Settings" ditekan
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Warna latar belakang
                elevation: 4, // Tinggi tombol terangkat
              ),
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.settings,
                  color: Colors.white,
                ),
                title: Text(
                  'Settings',
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
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return LoginPage(); // Ganti HalamanBaru dengan nama halaman yang ingin ditampilkan
                  },
                ));
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
      ),
    );
  }
}
