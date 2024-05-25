import 'package:flutter/material.dart';

class Testing extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onPressed;

  const Testing({super.key, required this.icon, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 125,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 153, 151, 221),
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: onPressed,
                    child: Icon(
                      icon,
                      size: 50,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    title,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
