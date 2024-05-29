import 'package:flutter/material.dart';
import 'package:uas/data/theme.dart';
import 'package:uas/pages/login_page.dart';
import 'package:uas/screens/accountpage.dart';
import 'package:uas/screens/botnav.dart';
import 'package:uas/screens/categorypage.dart';
import 'package:uas/screens/homepage.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable, camel_case_types
class bottonnav extends StatefulWidget {
  bottonnav({super.key, required this.currentIndex});

  int currentIndex = 0;

  @override
  State<bottonnav> createState() => _bottonnavState();
}

class _bottonnavState extends State<bottonnav> {
  final List<Widget> bodyContent = [Homepage(), CategoryPage(), AccountPage()];
  // void moveNav(int index) {
  //   setState(() {
  //     widget.currentIndex = index;
  //   });
  // }

  List<String> title = ["Home", "Category Shopping", "Accounts"];
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Consumer<themeManager>(builder: (contex, value, child) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
          title: Text(title[value.currentIndex]),
          actions: [
            PopupMenuButton(
                initialValue: _selectedValue,
                onSelected: (String value) {
                  setState(() {
                    _selectedValue = value;
                  });
                },
                itemBuilder: (context) => <PopupMenuEntry<String>>[
                      PopupMenuItem(child: Switchs()),
                      PopupMenuDivider(),
                      PopupMenuItem(
                          child: Text("LOG OUT"),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return LoginPage();
                              },
                            ));
                          })
                    ])
          ],
        ),
        bottomNavigationBar: BotNav(
          items: const [
            {"label": "Home", "icon": Icons.home},
            {"label": "category", "icon": Icons.category},
            {"label": "accounts", "icon": Icons.person},
          ],
        ),
        body: bodyContent[value.currentIndex],
      );
    });
  }
}

class Switchs extends StatelessWidget {
  const Switchs({super.key});

  @override
  Widget build(BuildContext context) {
    return Switch(
      activeColor: Colors.purple,
      value: Provider.of<themeManager>(context).mode,
      onChanged: (value) {
        Provider.of<themeManager>(context, listen: false).changeMode();
      },
    );
  }
}
