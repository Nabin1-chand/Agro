import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final Color? backGroundColor;
  final Color? textColor;

  const CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.width,
      this.backGroundColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: TextButton(
        onPressed: () {
          onPressed();
        },
        style: TextButton.styleFrom(
          backgroundColor:
              backGroundColor ?? const Color.fromARGB(255, 27, 96, 199),
          padding: EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          side: BorderSide(
              color: const Color.fromARGB(255, 7, 101, 179),
              width: 2), // Border color and thickness
        ),
        child: Text(
          text,
          style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
