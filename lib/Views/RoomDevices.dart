import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/Custom/CustomAppBar.dart';
import 'package:fssmarthome/Views/Devices/AddDevice.dart';
import 'package:fssmarthome/Views/Devices/Alarm.dart';
import 'package:fssmarthome/Views/Devices/Door.dart';
import 'package:fssmarthome/Views/Devices/FireDetector.dart';
import 'package:fssmarthome/Views/Devices/Motion.dart';
import 'package:fssmarthome/Views/Devices/SmokeDetector.dart';
import 'package:fssmarthome/Views/Devices/Switch.dart';
import 'package:fssmarthome/Views/Devices/Temperature.dart';
import 'package:fssmarthome/Views/Devices/WaterLeak.dart';

class RoomDivices extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<RoomDivices>{
   int index=0;
  @override
  Widget build(BuildContext context) {
    List content=[
      SwitchDevice(),
      // AddDevice(),
      Temperature(),
      Door(),
      Alarm(),
      Motion()
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(AppTheme.backGround),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
              Container(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width*.05,
                    right: MediaQuery.of(context).size.width*.05
                ),
                child: Column(
                  children: [
                    CustomAppBar(title: "Living Room"),
                    Row(
                      children: [
                        Text("Devices",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                      ],
                    ),
                    SizedBox(height: 7,),
                  ],
                ),
              ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*.17,
                  child: ListView(
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width*.05,),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            index=0;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width*.22,
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width*.2,
                                height: MediaQuery.of(context).size.height*.085,

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(color: Colors.black12,width: 1),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(3, 3), // changes position of shadow
                                    ),
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(-3, -3), // changes position of shadow
                                    ),
                                  ],
                                  color: index==0?Color(AppTheme.primaryColor):Colors.white,
                                ),
                                padding: EdgeInsets.all(8),
                                child: Icon(Icons.add,size: 40, color:index==0?Colors.white: Color(AppTheme.primaryColor),),

                              ),
                              SizedBox(height: 5,),
                              Text("Add New Divic",textAlign: TextAlign.center,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,height: 1.4),)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 7,),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            index=1;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width*.22,
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width*.2,
                                height: MediaQuery.of(context).size.height*.085,

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(color: Colors.black12,width: 1),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(3, 3), // changes position of shadow
                                    ),
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(-3, -3), // changes position of shadow
                                    ),
                                  ],
                                  color: index==1?Color(AppTheme.primaryColor):Colors.white,
                                ),
                                padding: EdgeInsets.all(8),
                                child: Image.asset("assets/images/devices/tempreture.png",
                                  color:index==1?Colors.white: Color(AppTheme.primaryColor),
                                ),

                              ),
                              SizedBox(height: 5,),
                              Text("Temperature&Humidity",textAlign: TextAlign.center,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,height: 1.5),)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 7,),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            index=2;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width*.22,
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width*.2,
                                height: MediaQuery.of(context).size.height*.085,

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(color: Colors.black12,width: 1),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(3, 3), // changes position of shadow
                                    ),
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(-3, -3), // changes position of shadow
                                    ),
                                  ],
                                  color: index==2?Color(AppTheme.primaryColor):Colors.white,
                                ),
                                padding: EdgeInsets.all(8),
                                child: Image.asset("assets/images/devices/door mag.png",
                                  color:index==2?Colors.white: Color(AppTheme.primaryColor),
                                ),

                              ),
                              SizedBox(height: 5,),
                              Text("Door&Window magentic",textAlign: TextAlign.center,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,height: 1.4),)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 7,),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            index=3;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width*.22,
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width*.2,
                                height: MediaQuery.of(context).size.height*.085,

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(color: Colors.black12,width: 1),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(3, 3), // changes position of shadow
                                    ),
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(-3, -3), // changes position of shadow
                                    ),
                                  ],
                                  color:index==3?Color(AppTheme.primaryColor):Colors.white,
                                ),
                                padding: EdgeInsets.all(8),
                                child: Image.asset("assets/images/devices/alarm-clock 1.png",
                                  color:index==3?Colors.white: Color(AppTheme.primaryColor),
                                ),

                              ),
                              SizedBox(height: 5,),
                              Text("Alarm clock",textAlign: TextAlign.center,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,height: 1.4),)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 7,),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            index=4;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width*.22,
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width*.2,
                                height: MediaQuery.of(context).size.height*.085,

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(color: Colors.black12,width: 1),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(3, 3), // changes position of shadow
                                    ),
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(-3, -3), // changes position of shadow
                                    ),
                                  ],
                                  color: index==4?Color(AppTheme.primaryColor):Colors.white,
                                ),
                                padding: EdgeInsets.all(8),
                                child: Image.asset("assets/images/devices/motion.png",
                                color:index==4?Colors.white: Color(AppTheme.primaryColor),
                                ),

                              ),
                              SizedBox(height: 5,),
                              Text("Motion ",textAlign: TextAlign.center,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,height: 1.4),)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width*.05,),
                    ],
                  ),
                ),
                SizedBox(height: 5,),
                content[index],
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}