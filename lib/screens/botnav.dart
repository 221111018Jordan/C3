import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uas/data/theme.dart';

// ignore: must_be_immutable
class BotNav extends StatefulWidget {
  BotNav(
      {super.key
      // , required this.moveNav
      ,
      required this.items});

  // Function(int index) moveNav;
  List<Map<String, dynamic>> items;

  @override
  State<BotNav> createState() => _BotNavState();
}

class _BotNavState extends State<BotNav> {
  @override
  Widget build(BuildContext context) {
    return Consumer<themeManager>(builder: (contex, value, child) {
      return BottomNavigationBar(
          onTap: (int index) {
            // widget.moveNav(index);
            // setState(() {
            value.changeCurrentIndex(index);
            // });
          },
          selectedItemColor: Colors.purple,
          showUnselectedLabels: false,
          currentIndex: value.currentIndex,
          items: [
            ...widget.items.map((e) => BottomNavigationBarItem(
                icon: Icon(e['icon']), label: e["label"]))
          ]);
    });
  }
}
