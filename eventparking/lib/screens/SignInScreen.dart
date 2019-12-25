import 'package:eventparking/widgets/CustomButton.dart';
import "package:flutter/material.dart";
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import '../widgets/CustomText.dart';
import 'package:flutter/services.dart';
import '../services/Validator.dart';

class SignInScreen extends StatefulWidget {
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _email = new TextEditingController();
  final TextEditingController _password = new TextEditingController();
  CustomText _emailField;
  CustomText _passwordField;
  bool _blackVisible = false;

  @override
  void initState() {
    super.initState();

    _emailField = new CustomText(
      baseColor: Colors.grey,
      borderColor: Colors.grey[400],
      errorColor: Colors.red,
      controller: _email,
      hint: "E-mail Adress",
      inputType: TextInputType.emailAddress,
      validator: Validator.validateEmail,
    );
    _passwordField = CustomText(
      baseColor: Colors.grey,
      borderColor: Colors.grey[400],
      errorColor: Colors.red,
      controller: _password,
      obscureText: true,
      hint: "Password",
      validator: Validator.validatePassword,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              Center(
                  child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [Colors.red, Colors.blue])))),
              ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 70.0, bottom: 10.0, left: 120.0, right: 10.0),
                    child: Text(
                      "Event Parking",
                      softWrap: true,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(255, 220, 215, 1.0),
                        decoration: TextDecoration.none,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: "OpenSans",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20.0, bottom: 10.0, left: 15.0, right: 15.0),
                    child: _emailField,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 10.0, bottom: 20.0, left: 15.0, right: 15.0),
                    child: _passwordField,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 40.0),
                    child: CustomButton(
                      title: "Log In",
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      textColor: Colors.white,
                      onPressed: () {
                        _emailLogin(
                            email: _email.text,
                            password: _password.text,
                            context: context);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "OR",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: "OpenSans",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 40.0),
                    child: CustomButton(
                      title: "Facebook Login",
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      textColor: Colors.white,
                      onPressed: () {
                        _facebookLogin(context: context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          Offstage(
            offstage: !_blackVisible,
            child: GestureDetector(
              onTap: () {},
              child: AnimatedOpacity(
                opacity: _blackVisible ? 1.0 : 0.0,
                duration: Duration(milliseconds: 400),
                curve: Curves.ease,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _changeBlackVisible() {
    setState(() {
      _blackVisible = !_blackVisible;
    });
  }

  void _emailLogin(
      {String email, String password, BuildContext context}) async {
    if (Validator.validateEmail(email) &&
        Validator.validatePassword(password)) {
      try {
        SystemChannels.textInput.invokeMethod('TextInput.hide');
        _changeBlackVisible();
      } catch (e) {
        print("Error in email sign in: $e");
      }
    }
  }

  void _facebookLogin({BuildContext context}) async {
    try {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
      _changeBlackVisible();
      FacebookLogin facebookLogin = new FacebookLogin();

      final FacebookLoginResult result =
          await facebookLogin.logIn(['email', 'public_profile']);
      FacebookAccessToken facebookAccessToken = result.accessToken;
      switch (result.status) {
        case FacebookLoginStatus.loggedIn:
          /*  Auth.signInWithFacebok(result.accessToken.token).then((uid) {
            Auth.getCurrentFirebaseUser().then((firebaseUser) {
              User user = new User(
                firstName: firebaseUser.displayName,
                userID: firebaseUser.uid,
                email: firebaseUser.email ?? '',
                profilePictureURL: firebaseUser.photoUrl ?? '',
              );
              //   Auth.addUser(user);
              Navigator.of(context).pop();
            });
          });*/
          break;
        case FacebookLoginStatus.cancelledByUser:
        case FacebookLoginStatus.error:
          _changeBlackVisible();
      }
    } catch (e) {
      print("Error in facebook sign in: $e");
    }
  }
}
