import 'package:flutter/material.dart';

class HomePageCasual extends StatelessWidget {
  const HomePageCasual({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("On Going"),
        centerTitle: true,
        backgroundColor: Colors.black,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}