import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Base/shared_preference_manger.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';

class Splash extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<Splash>{
   String? user_id;
  loadData()async{
   user_id=await SharedPreferenceManager.getData("UserId");
   setState(() {
   });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), (){
      Navigator.of(context)
          .pushNamedAndRemoveUntil(user_id!=null?"/mainPage":"/login",
              (Route<dynamic> route) => false);
      // Phoenix.rebirth(context);
    });
    return Scaffold(
      backgroundColor: Color(AppTheme.primaryColor),
      body: Container(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width*.2,
          right: MediaQuery.of(context).size.width*.2,
        ),
        child: Center(
          child:Image.asset("assets/images/logo/logo1.png",
            width: MediaQuery.of(context).size.width*.6,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}