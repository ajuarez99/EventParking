import 'package:flutter/material.dart';
import '../widgets/BottomNavigation.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key, this.name}) : super(key: key);
  final String name;
  @override
  _ProfileScreen createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      bottomNavigationBar: BottomTravelBar(),
    );
  }
}
