import 'dart:async';

import 'package:eventparking/widgets/BottomNavigation.dart';
import 'package:eventparking/widgets/SizableHomeMenu.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../services/MapsService.dart';
import '../widgets/BottomNavigation.dart';
import '../widgets/SizableHomeMenu.dart';
class MapScreen extends StatefulWidget {
  MapScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MapScreen createState() => _MapScreen();
}

class _MapScreen extends State<MapScreen> {
  MapsService googleMap = new MapsService();
  
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return new Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
    body: Column(children: <Widget>[
              Row(
                //ROW 1
                children: [
                  Container(  
                   width: screenSize.width,
                   height: screenSize.height *.5,
                   child: googleMap.googleMap()
                  ),         
                ],
              ),
              Row(//ROW 2
                children: [  
                  Container(
                    width: screenSize.width,
                    height: screenSize.height *.3,
                    child: SizableHomeMenu(),
                    
                  )
              ]),
      
    ]),
         
        
      bottomNavigationBar: BottomTravelBar(),
    );
  }
}
