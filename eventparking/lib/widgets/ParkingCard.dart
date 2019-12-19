import 'package:flutter/material.dart';
class ParkingCard extends StatefulWidget{
   @override
  _ParkingCard createState() => _ParkingCard();
}
class _ParkingCard extends State<ParkingCard>{
  @override
  Widget build(BuildContext context){
       return Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(right: 20),
          width: 180,
        
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
          boxShadow: [
            new BoxShadow(
              color: Colors.grey,
              blurRadius: 10.0,
            ),
          ],
        ),
          child: 
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: CircleAvatar(
                    child: Icon(Icons.home,color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("How Many Spots:",),
                    Text("Cost:")
                  ],
                )
              ],
            ),
          ],
        ),
  );
  }
}