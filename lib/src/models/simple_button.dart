import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  final Color backGroundColor;
  final String title;
  final VoidCallback? onPressed;

  const SimpleButton(
      {super.key,
      this.backGroundColor = const Color(0xFF40CFCF),
      required this.title,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 51,
      width: 130,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: backGroundColor),
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }
}
