import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:uas/components/users.dart';
import 'package:uas/data/theme.dart';
import 'package:uas/pages/login_page.dart';

final usernameController = TextEditingController();
final emailController = TextEditingController();
final addressController = TextEditingController();

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  List<double> _value = [0, 0, 255, 200, 175];
  double _max = 255;

  String? _imagePath;

  _getImageFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Container(
                width: _value[3],
                height: _value[4],
                color: Color.fromARGB(255, _value[0].toInt(), _value[1].toInt(),
                    _value[2].toInt()),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Tooltip(
                          message: 'Foto Profil',
                          child: CircleAvatar(
                            child: SizedBox(
                              child: _imagePath == null
                                  ? Center(
                                      child: Image.asset("images/avatar.jpg"),
                                    )
                                  : Image.file(
                                      File(_imagePath!),
                                    ),
                            ),
                          )),
                      Column(
                        children: [
                          Text(
                            Provider.of<userListManager>(context)
                                .currentUser
                                .username,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            Provider.of<userListManager>(context)
                                .currentUser
                                .email,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Card(
                child: ExpansionTile(
                  leading: Icon(Icons.settings),
                  title: Text("Change Color"),
                  children: [
                    Text("RED"),
                    Slider(
                      value: _value[0],
                      activeColor: Colors.red,
                      max: _max,
                      divisions: _max.toInt(),
                      label: "${_value[0].toInt()}",
                      onChanged: (double value) {
                        setState(() {
                          _value[0] = value;
                        });
                      },
                    ),
                    Text("GREEN"),
                    Slider(
                      value: _value[1],
                      activeColor: Colors.green,
                      max: _max,
                      divisions: _max.toInt(),
                      label: "${_value[1].toInt()}",
                      onChanged: (double value) {
                        setState(() {
                          _value[1] = value;
                        });
                      },
                    ),
                    Text("BLUE"),
                    Slider(
                      value: _value[2],
                      activeColor: Colors.blue,
                      max: _max,
                      divisions: _max.toInt(),
                      label: "${_value[2].toInt()}",
                      onChanged: (double value) {
                        setState(() {
                          _value[2] = value;
                        });
                      },
                    ),
                    Text("WIDTH"),
                    Slider(
                      value: _value[3],
                      activeColor: Provider.of<themeManager>(context).mode
                          ? Colors.white
                          : Colors.black,
                      min: 200,
                      max: 1235,
                      divisions: 1235,
                      label: "${_value[3].toInt()}",
                      onChanged: (double value) {
                        setState(() {
                          _value[3] = value;
                        });
                      },
                    ),
                    Text("HEIGHT"),
                    Slider(
                      value: _value[4],
                      activeColor: Provider.of<themeManager>(context).mode
                          ? Colors.white
                          : Colors.black,
                      min: 175,
                      max: 300,
                      divisions: 300,
                      label: "${_value[4].toInt()}",
                      onChanged: (double value) {
                        setState(() {
                          _value[4] = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Card(
                child: ListTile(
                  leading: Tooltip(
                    message: 'Icon Profil',
                    child: Icon(Icons.person),
                  ),
                  title: Text("Change Identity"),
                  trailing: Tooltip(
                    message: 'Edit Identitas',
                    child: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              icon: Icon(
                                Icons.update,
                                color: Colors.green,
                              ),
                              title: Text("Update"),
                              content: SizedBox(
                                height: 150,
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: usernameController,
                                      decoration:
                                          InputDecoration(hintText: "Username"),
                                    ),
                                    TextField(
                                      controller: emailController,
                                      decoration:
                                          InputDecoration(hintText: "Email"),
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    usernameController.clear();
                                    emailController.clear();
                                  },
                                  child: Text("CLOSE"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      if (usernameController.text.isNotEmpty &&
                                          emailController.text.isNotEmpty) {
                                        context
                                            .read<userListManager>()
                                            .currentUser
                                            .username = usernameController.text;
                                        context
                                            .read<userListManager>()
                                            .currentUser
                                            .email = emailController.text;
                                      }
                                    });
                                    Navigator.of(context).pop();
                                    usernameController.clear();
                                    emailController.clear();
                                  },
                                  child: Text("YES"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: Icon(Icons.arrow_forward),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Card(
                child: Tooltip(
                    message: 'Ganti Gambar',
                    child: ListTile(
                      leading: Icon(Icons.image),
                      title: Text("Change image"),
                      trailing: IconButton(
                          onPressed: _getImageFromGallery,
                          icon: Icon(Icons.arrow_forward)),
                    )),
              ),
              SizedBox(height: 12),
              Card(
                child: ListTile(
                  leading: Tooltip(
                    message: 'Alamat',
                    child: Icon(CupertinoIcons.location),
                  ),
                  title: Text("Address"),
                  subtitle: Text(addressController.text),
                  trailing: Tooltip(
                    message: 'Edit Alamat',
                    child: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => SimpleDialog(
                            title: Text("Address"),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: TextField(
                                  controller: addressController,
                                  decoration:
                                      InputDecoration(hintText: "Address"),
                                ),
                              ),
                              Row(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      addressController.clear();
                                    },
                                    child: Text("Cancel"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        if (addressController.text.isNotEmpty) {
                                          Navigator.of(context).pop();
                                        }
                                      });
                                    },
                                    child: Text("Change"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      icon: Icon(Icons.arrow_forward),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Card(
                child: ListTile(
                  leading: Tooltip(
                    message: 'Tentang Kami',
                    child: Icon(Icons.info),
                  ),
                  title: Text("About Us"),
                  trailing: Tooltip(
                    message: 'Info Mengenai Kami',
                    child: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          shape: Border(
                            top: BorderSide(width: 10, color: Colors.yellow),
                          ),
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return Container(
                              height: 300,
                              child: Column(
                                children: [
                                  SizedBox(height: 24),
                                  Text(
                                      "This is our project together, containing personal data of each member"),
                                  ListTile(
                                    leading: Icon(Icons.person),
                                    title: Text("NAME: Jordan"),
                                    subtitle: Text("NIM: 221111018"),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.person),
                                    title: Text("NAME: Sanjaya Citra"),
                                    subtitle: Text("NIM: 221111926"),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.person),
                                    title: Text("NAME: Venderson Egy Agatran"),
                                    subtitle: Text("NIM: 221110627"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Close"),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      icon: Icon(Icons.arrow_forward),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Card(
                child: Tooltip(
                  message: 'Logout',
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return LoginPage();
                        },
                      ));
                    },
                    label: Text("LOGOUT"),
                    icon: Icon(Icons.logout),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
