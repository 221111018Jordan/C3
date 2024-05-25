import 'package:flutter/material.dart';
import 'package:uas/models/foodModel.dart';

class detailScreen extends StatelessWidget {
  detailScreen({super.key, required this.data});

  foodModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${data.text}"),
        centerTitle: true,
      ),
      body: Text("${data.text}"),
    );
  }
}

