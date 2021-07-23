import 'package:flutter/material.dart';


// ignore: camel_case_types
class Selected_Item extends StatefulWidget {

  @override
  _Selected_ItemState createState() => _Selected_ItemState();

}

class _Selected_ItemState extends State<Selected_Item> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 3));
  }

  @override
  void dispose() {
    super.dispose();
    _controller = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}

