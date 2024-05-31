import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:uas/components/users.dart';
import 'package:uas/pages/login_page.dart';

final usernameController = TextEditingController();
final emailController = TextEditingController();
final addressController = TextEditingController();

class accountpage extends StatefulWidget {
  const accountpage({super.key});

  @override
  State<accountpage> createState() => _accountpageState();
}

class _accountpageState extends State<accountpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 170,
              color: Colors.blue,
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        child: Image.asset("images/pizza.png"),
                        radius: 50,
                      ),
                      Column(
                        children: [
                          Text(
                            Provider.of<userListManager>(context)
                                .currentUser
                                .username,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            Provider.of<userListManager>(context)
                                .currentUser
                                .email,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            SizedBox(height: 12),
            Card(
                child: ListTile(
              leading: Icon(Icons.person),
              title: Text("change identity"),
              trailing: IconButton(
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
                                      InputDecoration(hintText: "username"),
                                ),
                                TextField(
                                  controller: emailController,
                                  decoration:
                                      InputDecoration(hintText: "email"),
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
                                child: Text("CLOSE")),
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
                                child: Text("YES"))
                          ],
                        );
                      });
                },
                icon: Icon(Icons.arrow_forward),
              ),
            )),
            SizedBox(height: 12),
            Card(
              child: ListTile(
                leading: Icon(CupertinoIcons.location),
                title: Text("Address"),
                subtitle: Text(addressController.text),
                trailing: IconButton(
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
                                          InputDecoration(hintText: "address"),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            addressController.clear();
                                          },
                                          child: Text("cancel")),
                                      TextButton(
                                          onPressed: () {
                                            setState(() {
                                              if (addressController
                                                  .text.isNotEmpty) {
                                                Navigator.of(context).pop();
                                              }
                                            });
                                          },
                                          child: Text("Change"))
                                    ],
                                  )
                                ],
                              ));
                    },
                    icon: Icon(Icons.arrow_forward)),
              ),
            ),
            SizedBox(height: 12),
            Card(
              child: ListTile(
                leading: Icon(Icons.info),
                title: Text("About us"),
                trailing: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          shape: Border(
                              top: BorderSide(width: 10, color: Colors.yellow)),
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return Container(
                              height: 300,
                              child: Column(
                                children: [
                                  SizedBox(height: 24),
                                  Text(
                                      "ini adalah projek kami bersama di sini berisi data diri masing masing anggota"),
                                  ListTile(
                                    leading: Icon(Icons.person),
                                    title: Text("NAMA : Jordan"),
                                    subtitle: Text("NIM : 221111018"),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.person),
                                    title: Text("NAMA : Sanjaya Citra"),
                                    subtitle: Text("NIM : 221111926"),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.person),
                                    title: Text("NAMA : Venderson Egy Agatran"),
                                    subtitle: Text("NIM : 221110627"),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("Close"))
                                ],
                              ),
                            );
                          });
                    },
                    icon: Icon(Icons.arrow_forward)),
              ),
            ),
            SizedBox(height: 12),
            Card(
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
            ))
          ],
        ),
      ),
    );
  }
}
