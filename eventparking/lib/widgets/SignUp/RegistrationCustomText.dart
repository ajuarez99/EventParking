import 'package:flutter/material.dart';

class RegistrationCustomText extends StatelessWidget {
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType keyboard;
  final bool obscureText;
  final IconData icon;
  double width;
  double pixelRatio;
  bool large;
  bool medium;

  RegistrationCustomText(
      {this.hint,
      this.textEditingController,
      this.keyboard,
      this.icon,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    pixelRatio = MediaQuery.of(context).devicePixelRatio;
    return new Material(
      borderRadius: BorderRadius.circular(30.0),
      elevation: 10,
      child: TextFormField(
        controller: textEditingController,
        keyboardType: keyboard,
        cursorColor: Colors.red[200],
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.red[200], size: 20),
          hintText: hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
