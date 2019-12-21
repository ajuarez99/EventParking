import 'package:flutter/material.dart';
import '../services/MapsService.dart';

class SizableHomeMenu extends StatefulWidget {
  @override
  _SizableHomeMenu createState() => _SizableHomeMenu();
}

class _SizableHomeMenu extends State<SizableHomeMenu>
    with SingleTickerProviderStateMixin {
  MapsService googleMap = new MapsService();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        googleMap.googleMap(),
        PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            expandedHeight: 50.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Icon(Icons.reorder, color: Color.fromARGB(255, 0, 0, 0)),
              centerTitle: true,
            ),
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('Grid Item $index'),
              );
            },
            childCount: 10,
          ),
        ),
      ],
    );
  }
}
