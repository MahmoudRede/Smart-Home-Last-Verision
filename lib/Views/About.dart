import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<About>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("About"),
      ),
    );
  }
}