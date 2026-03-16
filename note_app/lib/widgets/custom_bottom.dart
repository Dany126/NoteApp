import 'package:flutter/material.dart';
import 'package:note_app/constant.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({super.key, required this.onTap, required this.isLoading});
  final void Function() onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: kPrimaryColor,
        ),
        height: 50,
        width: double.infinity,
        child: Center(
          child: Text(
            " Add Note ",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
