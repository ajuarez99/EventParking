import 'package:flutter/material.dart';

class RegistrationCustomText extends StatefulWidget {
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
  _RegistrationCustomText createState() => _RegistrationCustomText();
}

class _RegistrationCustomText extends State<RegistrationCustomText> {
  @override
  Widget build(BuildContext context) {
    widget.width = MediaQuery.of(context).size.width;
    widget.pixelRatio = MediaQuery.of(context).devicePixelRatio;
    return new Material(
      borderRadius: BorderRadius.circular(30.0),
      elevation: 10,
      child: TextFormField(
        controller: widget.textEditingController,
        keyboardType: widget.keyboard,
        cursorColor: Colors.red[200],
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon, color: Colors.red[200], size: 20),
          hintText: widget.hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
