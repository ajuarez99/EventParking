import 'package:flutter/material.dart';

class SizableHomeMenu extends StatefulWidget{
  @override
  _SizableHomeMenu createState() => _SizableHomeMenu();
}

class _SizableHomeMenu extends State<SizableHomeMenu>with SingleTickerProviderStateMixin{
 AnimationController _controller;
  Duration _duration = Duration(milliseconds: 500);
  Tween<Offset> _tween = Tween(begin: Offset(0, 1), end: Offset(0, 0));

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _duration);
  }
  @override 
  Widget build(BuildContext context){
    return CustomScrollView(
  slivers: <Widget>[
    const SliverAppBar(
      pinned: false,
      backgroundColor: Colors.white,
      expandedHeight: 250.0,
      flexibleSpace: FlexibleSpaceBar(
        title: Icon(Icons.reorder,color: Color.fromARGB(255, 0, 0, 0)),
        centerTitle: true,
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
        childCount: 20,
      ),
    ),
   
  ],
);
   
  }
 }