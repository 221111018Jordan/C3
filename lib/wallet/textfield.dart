import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class fieldtext extends StatelessWidget {
  fieldtext({super.key,required this.isi});

  TextEditingController isi;

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: isi,
        keyboardType: TextInputType.number,
    );
  }
}