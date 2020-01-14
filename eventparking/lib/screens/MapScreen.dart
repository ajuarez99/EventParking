import 'package:eventparking/widgets/BottomNavigation.dart';
import 'package:eventparking/widgets/ParkingCard.dart';
import 'package:flutter/material.dart';
import '../services/MapsService.dart';
import '../widgets/BottomNavigation.dart';
import '../widgets/ParkingCard.dart';

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
    return new Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(widget.title),
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0))),
      body: Stack(
        children: <Widget>[
          googleMap.googleMap(),
          Container(
            padding: EdgeInsets.only(
                top: 500,
                bottom:
                    40), // if boxes show error change this value around to not show error for you
            child: ListView(
              padding: EdgeInsets.only(left: 20),
              children: getParkingSpots(),
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomTravelBar(),
    );
  }

  List<Widget> getParkingSpots() {
    List<Widget> cards = [];

    cards.add(ParkingCard());
    cards.add(ParkingCard());
    cards.add(ParkingCard());
    cards.add(ParkingCard());
    cards.add(ParkingCard());

    return cards;
  }
}
