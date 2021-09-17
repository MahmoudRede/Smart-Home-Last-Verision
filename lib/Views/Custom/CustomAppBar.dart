import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';

class CustomAppBar extends StatefulWidget{
  String title;
  CustomAppBar({required this.title});
  @override
  State<StatefulWidget> createState() {
    return _state(title: this.title);
  }
}
class _state extends State<CustomAppBar>{
  String title;
  _state({required this.title});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.only(top: 8),
          child: Icon(Icons.arrow_back_ios),
        ),
        Container(
          height: MediaQuery.of(context).size.height*.13,
          width: MediaQuery.of(context).size.width*.55,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(1000),
                  bottomRight: Radius.circular(1000)
              ),
              color: Colors.white
          ),
          alignment: Alignment.center,
          child: Text(this.title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Color(AppTheme.yellowColor)),),
        ),
        Icon(Icons.arrow_back_ios,color: Color(AppTheme.backGround),)
      ],
    );
  }
}
