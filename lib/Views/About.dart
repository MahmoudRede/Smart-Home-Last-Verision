import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/Custom/CustomAppBar.dart';

class About extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<About>{
  @override
  Widget build(BuildContext context) {
     return SafeArea(child: Scaffold(
      backgroundColor: Color(AppTheme.backGround),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width*.05,
            right: MediaQuery.of(context).size.width*.05
             ),
          child: Column(
            children: [
              CustomAppBar(title: "About"),
              SizedBox(height: MediaQuery.of(context).size.height*.01,),
              Image.asset("assets/images/logo/logo2.png",
                height: MediaQuery.of(context).size.height*.23,
                fit: BoxFit.cover,
              ),
              Text("Future Scrollation",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
              SizedBox(height: MediaQuery.of(context).size.height*.05,),
              Container(
                width: MediaQuery.of(context).size.width*.9,
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height*.04,
                  bottom: MediaQuery.of(context).size.height*.03,
                  left: MediaQuery.of(context).size.width*.035,
                  right: MediaQuery.of(context).size.width*.035,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
                ),
                child: Column(
                  children: [
                   Text("Grammarly now organizes your writing feedback by theme, so you can see how each change will help your readers better understand your message. Grammarly now organizes your writing feedback by theme, so you can see how each change will help your readers better understand your message.",
                       textAlign: TextAlign.center,),
                    SizedBox(height: MediaQuery.of(context).size.height*.01,),
                    Icon(Icons.phone,size: 30,color: Color(AppTheme.yellowColor)),
                    Text("01000458785",style: TextStyle(color: Color(AppTheme.yellowColor)),)
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.05,),
            ],
          ),
        ),
      ),
    ));
  }
}