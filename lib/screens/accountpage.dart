import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class accountpage extends StatefulWidget {
  const accountpage({Key? key}) : super(key: key);

  @override
  State<accountpage> createState() => _AccountPageState();
}

class _AccountPageState extends State<accountpage> {
  void _openIconButtonPressed() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => bottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: _openIconButtonPressed,
            icon: const Icon(Icons.info),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/images/user.png'),
            ),
            const SizedBox(height: 20),
            itemProfile('Name', 'XXX', CupertinoIcons.person),
            const SizedBox(height: 10),
            itemProfile('Phone', 'XXX', CupertinoIcons.phone),
            const SizedBox(height: 10),
            itemProfile('Address', 'XXX', CupertinoIcons.location),
            const SizedBox(height: 10),
            itemProfile('Email', 'XXX@gmail.com', CupertinoIcons.mail),
            const SizedBox(height: 20,),
            
          ],
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 200,
      child: const Center(
        child: Text('Disini nanti taruh tulisan penting'),
      ),
    );
  }

  Widget itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: Colors.deepOrange.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10
            )
          ]
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: const Icon(Icons.arrow_forward, color: Colors.grey),
        tileColor: Colors.white,
      ),
    );
  }
}
