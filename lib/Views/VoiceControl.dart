import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/AddVoice.dart';
import 'package:fssmarthome/Views/Custom/CustomAppBar.dart';

import 'Custom/GlobalFunction.dart';

class VoiceControl extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<VoiceControl>{
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        Navigator.pushNamedAndRemoveUntil(context,"/mainPage", (route) => false);
        return true;
      },
      child: Scaffold(
        backgroundColor: Color(AppTheme.backGround),
        body: Container(
          child:Column(
            children: [
              Container(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width*.05,
                      right: MediaQuery.of(context).size.width*.05
                  ),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamedAndRemoveUntil(context,"/mainPage", (route) => false);
                        },
                        child: Padding(
                          padding:  EdgeInsets.only(top: 8),
                          child: Icon(Icons.arrow_back_ios),
                        ),
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
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width*.02,
                          right: MediaQuery.of(context).size.width*.02,
                        ),
                        child: Text("Voice Control",textAlign: TextAlign.center,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Color(AppTheme.yellowColor)),),
                      ),
                      Icon(Icons.arrow_back_ios,color: Color(AppTheme.backGround),)
                    ],
                  )),
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
              GestureDetector(
                onTap: (){
                  Navigator.push(
                      context, GlobalFunction.route(AddVoice()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Do You Want Create List Of Voice?",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
                    Text("Create",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Color(AppTheme.yellowColor)),)
                  ],
                ),
              ),
              SizedBox(height: 15,),
            ],
          ),
        )
      ),
    );

  }
}
