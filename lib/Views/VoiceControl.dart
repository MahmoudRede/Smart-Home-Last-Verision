import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/Custom/CustomAppBar.dart';

class VoiceControl extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<VoiceControl>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppTheme.backGround),
      body: Container(
        child:Column(
          children: [
            Container(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width*.05,
                    right: MediaQuery.of(context).size.width*.05
                ),
                child: CustomAppBar(title: "Voice Control")),
            SizedBox(height: MediaQuery.of(context).size.height*.25,),
            Row(
              children: [
              Image.asset("assets/images/voice speak.png",
              width: MediaQuery.of(context).size.width*.4,
              ),
                Container(
                  width: MediaQuery.of(context).size.width*.2,
                  height:  MediaQuery.of(context).size.width*.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color(AppTheme.primaryColor)
                  ),
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width*.05),
                  child: Image.asset("assets/images/microphone 1.png"),
                ),
                Image.asset("assets/images/voice speak2.png",
                  width: MediaQuery.of(context).size.width*.4,
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.07,),
            Text("You Say :"),
            SizedBox(height: 3,),
            Container(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width*.025,
                right: MediaQuery.of(context).size.width*.025,
                top: 5,bottom: 5
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                border: Border.all(color: Color(AppTheme.primaryColor),width: 1),
                color: Colors.white
              ),
              child: Text("Open The Door "),
            ),
            Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Do You Want Create List Of Voice?",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
                Text("Create",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Color(AppTheme.yellowColor)),)
              ],
            ),
            SizedBox(height: 15,),
          ],
        ),
      )
    );

  }
}
