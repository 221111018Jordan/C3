import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  CustomTextField(
      {super.key, required this.label,required this.obscureText, required this.icon, required this.isi});

  String label;
  IconData icon;
  TextEditingController isi;
  bool obscureText;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.isi,
      autofocus: true,
      obscureText: widget.obscureText,
      enabled: true,
      maxLength: 20,
      keyboardType: TextInputType.text, // Sesuaikan dengan kebutuhan aplikasi
      decoration: InputDecoration(
        helperText: "Input Your ${widget.label}",
        labelText: "${widget.label}",
        helperStyle: TextStyle(color: Colors.green),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              widget.obscureText = !widget.obscureText;
            });
          },
          icon: Icon(
            widget.obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.red,
          ),
        ),
        // prefixIcon: Icon(Icons.person),
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

