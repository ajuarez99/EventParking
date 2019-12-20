
import 'package:flutter/material.dart';

class BottomTravelBar extends StatefulWidget{
  @override
  _BottomTravelBar createState() => _BottomTravelBar();
}

class _BottomTravelBar extends State<BottomTravelBar>{

  @override
  Widget build(BuildContext context){
    var _currentIndex = 1;
  return  BottomNavigationBar(
       onTap:  (index) {
          setState(() {
                      _currentIndex = index;
                    });
         
          if (index == 2){
            Navigator.pushNamed(context, '/b');
            
          }
          else if(index == 1){
              Navigator.pushNamed(context, '/a');
            
          }
        }, 
      currentIndex: 0,
          type: BottomNavigationBarType.fixed ,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.radio,color: Color.fromARGB(255, 0, 0, 0)),
                      title: new Text('Add')
                      
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home,color: Color.fromARGB(255, 0, 0, 0)),
                      title: new Text('Home')
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person_outline,color: Color.fromARGB(255, 0, 0, 0)),
                      title: new Text('Profile'),
                    ),        
                  ],
            );
            }
}