import 'package:eventparking/screens/ProfileScreen.dart';
import 'package:flutter/material.dart';

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
      initialRoute: '/a',
      routes: <String, WidgetBuilder>{
        '/a': (BuildContext context) => MapScreen(title: 'Event Parking'),
        '/b': (BuildContext context) => ProfileScreen(),
      },
    );
  }
}
