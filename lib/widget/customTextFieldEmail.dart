import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class CustomTextFieldEmail extends StatefulWidget {
  CustomTextFieldEmail(
      {super.key, required this.label,required this.obscureText, required this.icon, required this.isi});

  String label;
  IconData icon;
  TextEditingController isi;
  bool obscureText;

  @override
  State<CustomTextFieldEmail> createState() => _EmailState();
}

class _EmailState extends State<CustomTextFieldEmail> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.isi,
      autofocus: true,
      enabled: true,
      maxLength: 20,
      keyboardType: TextInputType.text, // Sesuaikan dengan kebutuhan aplikasi
      decoration: InputDecoration(
        helperText: "Input Your ${widget.label}",
        labelText: "${widget.label}",
        helperStyle: TextStyle(color: Colors.green),
        suffixIcon: Icon(
            Icons.email,
            color: Colors.red,
          ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 4),
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
  }
}

