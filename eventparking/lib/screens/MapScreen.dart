import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../services/MapsService.dart';

class MapScreen extends StatefulWidget {
MapScreen({Key key, this.title}) : super(key: key);
final String title;
  @override
  _MapScreen createState() => _MapScreen();
}
class _MapScreen extends State<MapScreen>{
  MapsService googleMap = new MapsService();
   @override
  Widget build(BuildContext context) {
   return new Scaffold(
      appBar: AppBar(
       title: Text(widget.title),
     ),
      
      body: googleMap.googleMap(),
   );
  }
}

 

 