import 'dart:async';

import 'package:flutter/material.dart';

import './screens/MapScreen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EventGo',
      theme: ThemeData(primarySwatch: Colors.red,),
      
      home: MapScreen(title: 'Event Parking'),
    );
  }
}

