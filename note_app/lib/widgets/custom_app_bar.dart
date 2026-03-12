import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.icon, required this.onPressed});
  final Icon icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Notes",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const Spacer(),
        Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(29, 255, 255, 255),

            borderRadius: BorderRadius.circular(8.0),
          ),
          height: 45,
          width: 45,
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(icon.icon, color: Colors.white, size: 22),
          ),
        ),
      ],
    );
  }
}
