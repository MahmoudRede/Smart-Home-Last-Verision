import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Soil extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<Soil>{
  @override
  Widget build(BuildContext context) {
   return Container(
     width: MediaQuery.of(context).size.width*.8,
     height: MediaQuery.of(context).size.height*.6,
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(10),
       color: Color(0xffecedf2)
     ),
   );
  }
}