import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/Custom/CustomAppBar.dart';

class More extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<More>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppTheme.backGround),
      body:Container(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width*.05,
          right: MediaQuery.of(context).size.width*.05
        ),
        child: Column(
          children: [
            CustomAppBar(title: "Profile")
          ],
        ),
      ),
    );

  }
}
