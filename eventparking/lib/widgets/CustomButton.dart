import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final VoidCallback onPressed;

  CustomButton({
    this.title,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Text(
          title,
          softWrap: true,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            decoration: TextDecoration.none,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontFamily: "OpenSans",
          ),
        ),
      ),
    );
  }
}
