import 'package:eventparking/widgets/SignUp/RegistrationCustomText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eventparking/widgets/CustomButton.dart';
import 'package:amazon_cognito_identity_dart/cognito.dart';
import '../../services/secret.dart';
import '../CustomButton.dart';

class RegistrationFields extends StatefulWidget {
  RegistrationFields({Key key, this.password, this.email}) : super(key: key);
  final TextEditingController password;
  final TextEditingController email;
  _RegistrationFields createState() => _RegistrationFields();
}

class _RegistrationFields extends State<RegistrationFields> {
  RegistrationCustomText _emailField;
  RegistrationCustomText _passwordField;
  RegistrationCustomText _firstNameField;
  RegistrationCustomText _lastNameField;
  RegistrationCustomText _stateField;
  RegistrationCustomText _zipField;
  RegistrationCustomText _addressField;
  RegistrationCustomText _usernameField;

  @override
  void initState() {
    super.initState();
    _emailField = new RegistrationCustomText(
      keyboard: TextInputType.emailAddress,
      textEditingController: widget.email,
      icon: Icons.email,
      hint: "Email",
    );

    _passwordField = new RegistrationCustomText(
      keyboard: TextInputType.text,
      textEditingController: widget.password,
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
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
            child: _addressField,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 14.0, horizontal: 40.0),
            child: CustomButton(
              title: "Register",
              fontSize: 22,
              fontWeight: FontWeight.w700,
              textColor: Colors.white,
              onPressed: () {
                registerUser(
                    email: widget.email.text.trim(),
                    password: widget.password.text.trim(),
                    context: context);
              },
            ),
          ),
        ]),
      ])
    ]));
  }
}

void registerUser({String email, String password, BuildContext context}) async {
  final userPool = new CognitoUserPool(cognitoUserPoolId, cognitoClientId);
  try {
    await userPool.signUp(
      email,
      password,
    );
    Navigator.pushNamed(context, '/code',
        arguments: CodeArguments(email, password));
  } catch (e) {
    print(e);
  }
}

class CodeArguments {
  final String email;
  final String password;
  CodeArguments(this.email, this.password);
}
