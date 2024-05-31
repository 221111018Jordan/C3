import 'package:flutter/material.dart';
import 'package:uas/data/theme.dart';
import 'package:uas/pages/login_page.dart';
import 'package:uas/screens/accountpage.dart';
import 'package:uas/screens/botnav.dart';
import 'package:uas/screens/categorypage.dart';
import 'package:uas/screens/homepage.dart';
import 'package:provider/provider.dart';

bool lokasi = true;

// ignore: must_be_immutable, camel_case_types
class bottonnav extends StatefulWidget {
  bottonnav({super.key, required this.currentIndex});

  int currentIndex = 0;

  @override
  State<bottonnav> createState() => _bottonnavState();
}

class _bottonnavState extends State<bottonnav> {
  final List<Widget> bodyContent = [Homepage(), CategoryPage(), accountpage()];
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
                      PopupMenuItem(child:ListTile(title: Text("Dark Mode"),trailing: Switchs()),padding: EdgeInsets.only(left: 5,right: 5),),
                      PopupMenuItem(child:Switchslisttile(),padding: EdgeInsets.only(left: 5,right: 5),),
                      PopupMenuDivider(),
                      PopupMenuItem(
                        child: ListTile(leading: Icon(Icons.logout),title: Text("LOG OUT"),),onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return LoginPage();
                              },
                            ));
                        },
                      )
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


class Switchslisttile extends StatefulWidget {
  Switchslisttile({super.key});

  @override
  State<Switchslisttile> createState() => _SwitchslisttileState();
}

class _SwitchslisttileState extends State<Switchslisttile> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
            value: lokasi,
            onChanged: (value) {
              setState(() {
                lokasi = value;
              });
              if (lokasi == false) {
                ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
                  content: Text("lokasi kamu terputus,aplikasi harus online"),
                  actions: [
                    textbuttonlokasi()
                  ],
                  leading: Icon(Icons.location_off),
                ));
              } else{
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
              }
            },
            title: Text("lokasi"),
            secondary: Icon(Icons.location_on),
          );
  }
}

class textbuttonlokasi extends StatefulWidget {
  const textbuttonlokasi({super.key});

  @override
  State<textbuttonlokasi> createState() => _textbuttonlokasiState();
}

class _textbuttonlokasiState extends State<textbuttonlokasi> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
                        onPressed: () {
                          setState(() {
                            lokasi = true;
                          });
                          ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                        }, child: Text("nyalakan lokasi"));
  }
}