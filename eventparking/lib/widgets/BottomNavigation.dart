import 'dart:async';

import 'package:flutter/material.dart';

class BottomTravelBar extends StatefulWidget{
  @override
  _BottomTravelBar createState() => _BottomTravelBar();
}

class _BottomTravelBar extends State<BottomTravelBar>{

  @override
  Widget build(BuildContext context){
  return  BottomNavigationBar(
        
type: BottomNavigationBarType.shifting ,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit,color: Color.fromARGB(255, 0, 0, 0)),
            title: new Text('')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit,color: Color.fromARGB(255, 0, 0, 0)),
            title: new Text('')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit,color: Color.fromARGB(255, 0, 0, 0)),
            title: new Text('')
          ),        
        ],
  );
  }
}