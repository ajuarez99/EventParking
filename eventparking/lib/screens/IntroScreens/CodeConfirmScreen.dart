import 'package:amazon_cognito_identity_dart/cognito.dart';
import '../../widgets/SignUp/RegistrationFields.dart';
import 'package:eventparking/services/Validator.dart';
import 'package:eventparking/services/secret.dart';
import 'package:eventparking/widgets/CustomButton.dart';
import 'package:eventparking/widgets/CustomText.dart';
import 'package:flutter/material.dart';

class CodeConfirmScreen extends StatefulWidget {
  CodeConfirmScreen({Key key, this.email, this.password}) : super(key: key);
  final String email;
  final String password;

  @override
  _CodeConfirmScreen createState() => _CodeConfirmScreen();
}

class _CodeConfirmScreen extends State<CodeConfirmScreen> {
  final TextEditingController code = new TextEditingController();
  CustomText _code;
  @override
  void initState() {
    super.initState();
    _code = new CustomText(
      baseColor: Colors.grey,
      borderColor: Colors.grey[400],
      errorColor: Colors.red,
      controller: code,
      hint: "Code",
      inputType: TextInputType.emailAddress,
      validator: Validator.validateEmail,
    );
  }

  @override
  Widget build(BuildContext context) {
    final CodeArguments args = ModalRoute.of(context).settings.arguments;
    return new Scaffold(
      appBar: AppBar(
        title: Text("Confirmation"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Stack(children: <Widget>[
        Center(
            child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Colors.red, Colors.blue])))),
        Container(
            padding: EdgeInsets.only(
                top: 10,
                bottom: 40,
                left:
                    90), // if boxes show error change this value around to not show error for you
            child: Icon(Icons.email,
                size: 200, color: Color.fromARGB(245, 245, 245, 245))),
        Container(
            padding: EdgeInsets.only(
                top: 200,
                bottom: 40,
                left:
                    90), // if boxes show error change this value around to not show error for you
            child: Text("Enter the code sent to your email :" + args.email)),
        Container(
            padding: EdgeInsets.only(
                top: 250,
                bottom: 40,
                left: 100,
                right:
                    100), // if boxes show error change this value around to not show error for you
            child: _code),
        Container(
            padding: EdgeInsets.only(
                top: 320,
                bottom: 40,
                left:
                    140), // if boxes show error change this value around to not show error for you
            child: CustomButton(
              title: "Confirm",
              fontSize: 22,
              fontWeight: FontWeight.w700,
              textColor: Colors.white,
              onPressed: () {
                _authenticate(
                    email: args.email,
                    password: args.password,
                    code: code.text,
                    context: context);
              },
            ))
      ]),
    );
  }

  void _authenticate(
      {String email,
      String password,
      String code,
      BuildContext context}) async {
    if (Validator.validateEmail(email) &&
        Validator.validatePassword(password)) {
      try {
        final userPool =
            new CognitoUserPool(cognitoUserPoolId, cognitoClientId);
        final cognitoUser = new CognitoUser(email, userPool);
        final authDetails =
            new AuthenticationDetails(username: email, password: password);
        CognitoUserSession session;
        cognitoUser.confirmRegistration(code);

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
      } catch (e) {
        print("Error in email sign in: $e");
      }
    }
  }
}
