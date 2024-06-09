import 'package:intl/intl.dart';

class foodModel {
  String imagePath;
  String text;
  String kategori;
  int quantity;
  String harga;

  foodModel({
    required this.imagePath,
    required this.text,
    required this.kategori,
    required this.quantity,
    required this.harga,
  });

  String get formattedHarga {
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: '', decimalDigits: 0);
    return formatter.format(harga);
  }
}


