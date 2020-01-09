import 'package:eventparking/services/secret.dart';
import 'package:eventparking/widgets/CustomButton.dart';
import "package:flutter/material.dart";
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import '../widgets/CustomText.dart';
import 'package:flutter/services.dart';
import '../services/Validator.dart';
import 'package:amazon_cognito_identity_dart/cognito.dart';

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
                        top: 100.0, bottom: 10.0, left: 100.0, right: 10.0),
                    child: Text(
                      "Event Parking",
                      softWrap: true,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(255, 250, 255, 1.0),
                        decoration: TextDecoration.none,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 50.0, bottom: 10.0, left: 15.0, right: 15.0),
                    child: _emailField,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20.0, bottom: 20.0, left: 15.0, right: 15.0),
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
                            email: _email.text.trim(),
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
        final userPool =
            new CognitoUserPool(cognitoUserPoolId, cognitoClientId);
        final cognitoUser = new CognitoUser(email, userPool);
        final authDetails =
            new AuthenticationDetails(username: email, password: password);
        CognitoUserSession session;
        // cognitoUser.confirmRegistration('705759');

        try {
          session = await cognitoUser.authenticateUser(authDetails);
        } on CognitoUserNewPasswordRequiredException catch (e) {
          print(e);
          // handle New Password challenge
        } on CognitoUserMfaRequiredException catch (e) {
          print(e);
          // handle SMS_MFA challenge
        } on CognitoUserSelectMfaTypeException catch (e) {
          print(e);
          // handle SELECT_MFA_TYPE challenge
        } on CognitoUserMfaSetupException catch (e) {
          cognitoUser.enableMfa();
          print(e);
          // handle MFA_SETUP challenge
        } on CognitoUserTotpRequiredException catch (e) {
          print(e);
          // handle SOFTWARE_TOKEN_MFA challenge
        } on CognitoUserCustomChallengeException catch (e) {
          print(e);
          // handle CUSTOM_CHALLENGE challenge
        } on CognitoUserConfirmationNecessaryException catch (e) {
          print(e);
          // handle User Confirmation Necessary
        } catch (e) {
          print(e);
        }
        print(session.getAccessToken().getJwtToken());
        Navigator.pushNamed(context, '/map');
        SystemChannels.textInput.invokeMethod('TextInput.hide');
        _changeBlackVisible();
      } catch (e) {
        print("Error in email sign in: $e");
      }
    }
  }

  void _facebookLogin({BuildContext context}) {
    Navigator.pushNamed(context, '/register');
  }
}
