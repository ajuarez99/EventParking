import 'package:eventparking/widgets/SignUp/RegistrationCustomText.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  RegistrationCustomText _emailField;
  RegistrationCustomText _passwordField;
  RegistrationCustomText _firstNameField;
  RegistrationCustomText _lastNameField;
  RegistrationCustomText _stateField;
  RegistrationCustomText _zipField;
  RegistrationCustomText _addressField;
  RegistrationCustomText _usernameField;
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailField = new RegistrationCustomText(
      keyboard: TextInputType.emailAddress,
      icon: Icons.email,
      hint: "Email",
    );

    _passwordField = new RegistrationCustomText(
      keyboard: TextInputType.text,
      textEditingController: passwordController,
      icon: Icons.lock,
      hint: "Password",
    );
    _firstNameField = new RegistrationCustomText(
      keyboard: TextInputType.text,
      icon: Icons.person,
      hint: "First Name",
    );
    _lastNameField = new RegistrationCustomText(
      keyboard: TextInputType.text,
      icon: Icons.person,
      hint: "Last name",
    );
    _stateField = new RegistrationCustomText(
      keyboard: TextInputType.text,
      icon: Icons.satellite,
      hint: "State",
    );
    _zipField = new RegistrationCustomText(
      keyboard: TextInputType.number,
      icon: Icons.check,
      hint: "Zip",
    );
    _addressField = new RegistrationCustomText(
      keyboard: TextInputType.text,
      icon: Icons.home,
      hint: "Address",
    );
    _usernameField = new RegistrationCustomText(
      keyboard: TextInputType.text,
      icon: Icons.person,
      hint: "Username",
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Stack(children: <Widget>[
      Stack(alignment: Alignment.topLeft, children: <Widget>[
        Center(
            child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Colors.red, Colors.blue])))),
        ListView(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: 50.0, bottom: 10.0, left: 15.0, right: 15.0),
            child: _emailField,
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
            child: _passwordField,
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
            child: _firstNameField,
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
            child: _lastNameField,
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
            child: _stateField,
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
            child: _usernameField,
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
            child: _zipField,
          )
        ])
      ])
    ]));
  }
}
