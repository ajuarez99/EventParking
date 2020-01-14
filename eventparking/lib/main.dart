import 'package:eventparking/screens/ProfileScreen.dart';
import 'package:eventparking/screens/IntroScreens/RegistrationScreen.dart';
import 'package:eventparking/screens/IntroScreens/CodeConfirmScreen.dart';
import 'package:flutter/material.dart';
import './screens/IntroScreens/SignInScreen.dart';
import './screens/MapScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EventGo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/signin',
      routes: <String, WidgetBuilder>{
        '/map': (BuildContext context) => MapScreen(title: 'Event Parking'),
        '/profile': (BuildContext context) => ProfileScreen(),
        '/signin': (BuildContext context) => SignInScreen(),
        '/register': (BuildContext context) => RegistrationScreen(),
        '/code': (BuildContext context) => CodeConfirmScreen(),
      },
    );
  }
}
