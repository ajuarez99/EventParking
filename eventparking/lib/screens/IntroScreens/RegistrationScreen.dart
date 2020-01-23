import 'package:eventparking/widgets/SignUp/RegistrationFields.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final RegistrationFields fields = RegistrationFields(
      email: TextEditingController(), password: TextEditingController());
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Stack(children: <Widget>[
      Stack(alignment: Alignment.topLeft, children: <Widget>[
        fields,
      ])
    ]));
  }
}
