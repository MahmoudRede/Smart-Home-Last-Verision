import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Theme/StaticList.dart';
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
   int _index=0;
  @override
  Widget build(BuildContext context) {
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
                  height: MediaQuery.of(context).size.height*.17+5,
                  child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: StaticList.DevicesImages.length+1,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return Row(
                          children: [
                            SizedBox(width: MediaQuery.of(context).size.width*.04,),
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  _index=index;
                                });
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width*.2,
                                margin: EdgeInsets.only(top: 5),
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width*.17,
                                      height: MediaQuery.of(context).size.height*.075,

                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        border: Border.all(color: Colors.black12,width: 1),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.05),
                                            spreadRadius: 2,
                                            blurRadius: 2,
                                            offset: Offset(3, 3), // changes position of shadow
                                          ),
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.05),
                                            spreadRadius: 2,
                                            blurRadius: 2,
                                            offset: Offset(-3, -3), // changes position of shadow
                                          ),
                                        ],
                                        color: index==_index?Color(AppTheme.primaryColor):Colors.white,
                                      ),
                                      padding: EdgeInsets.all(12),
                                      child:index== StaticList.DevicesImages.length?Icon(Icons.add,size: 30,color:index==_index?Colors.white:Color(AppTheme.primaryColor),): Image.asset(StaticList.DevicesImages[index],
                                        color:_index==index?Colors.white:Color(AppTheme.primaryColor),
                                      ),

                                    ),
                                    SizedBox(height: 5,),
                                    Text(index== StaticList.DevicesImages.length?"Add Divice":StaticList.DevicesNames[index],textAlign: TextAlign.center,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,height: 1.5),)
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      }),
                ),
                SizedBox(height: 5,),
                StaticList.DevicesWidget[_index],
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}