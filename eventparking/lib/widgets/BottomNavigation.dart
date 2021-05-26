import 'package:flutter/material.dart';

class BottomTravelBar extends StatefulWidget {
  @override
  _BottomTravelBar createState() => _BottomTravelBar();
}

class _BottomTravelBar extends State<BottomTravelBar> {
  var currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });

        if (index == 2) {
          Navigator.pushNamed(context, '/profile');
        } else if (index == 1) {
          Navigator.pushNamed(context, '/map');
        }
      },
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.radio, color: Color.fromARGB(255, 0, 0, 0)),
            label: 'Add'),
        BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color.fromARGB(255, 0, 0, 0)),
            label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline, color: Color.fromARGB(255, 0, 0, 0)),
          label: 'Profile',
        ),
      ],
    );
  }
}
