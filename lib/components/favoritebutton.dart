import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(), backgroundColor: isFavorite ? Colors.red : null,
          padding: const EdgeInsets.all(0),
          
        ),
        child: const Icon(
          Icons.favorite_border,
          color: Colors.white,
          size: 26,
        ),
        
      ),
    );
  }
}
