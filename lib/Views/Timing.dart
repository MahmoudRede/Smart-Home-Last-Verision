import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/Custom/CustomAppBar.dart';
import 'package:fssmarthome/Views/ListOfTiming.dart';

import 'Custom/GlobalFunction.dart';

class Timing extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _state();
  }
}
class _state extends State<Timing>{
  var startTime;
  var endTime;
  TextEditingController device_number=new TextEditingController();
  List<Days>days=[
    Days(day: "Sat",Selected: false),
    Days(day: "Sun",Selected: true),
    Days(day: "Mon",Selected: false),
    Days(day: "Tus",Selected: false),
    Days(day: "Wed",Selected: false),
    Days(day: "Thr",Selected: false),
    Days(day: "Fri",Selected: false),
  ];
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(AppTheme.backGround),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width*.05,
              right: MediaQuery.of(context).size.width*.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(title: "Timing"),
                SizedBox(height:MediaQuery.of(context).size.height*.03),
                Text("Create Timing",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                SizedBox(height:MediaQuery.of(context).size.height*.02),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                  ),
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width*.05,
                    right: MediaQuery.of(context).size.width*.05,
                    top: MediaQuery.of(context).size.height*.02,
                    bottom: MediaQuery.of(context).size.height*.02

                  ),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Event Action",style: TextStyle(color: Color(AppTheme.yellowColor),fontSize: 16),),
                          SizedBox(width: 10,),
                          FlutterSwitch(
                            height: 15.0,
                            width: 35.0,
                            padding: 4.0,
                            toggleSize: 9.0,
                            borderRadius: 10.0,
                            inactiveColor: Colors.white,
                            inactiveToggleColor: Colors.black26,
                            activeColor: Colors.black54,
                            activeToggleColor:Color(AppTheme.primaryColor),
                            value: true,
                            onToggle: (value) {
                              setState(() {

                              });
                            },
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width*.05,
                            right: MediaQuery.of(context).size.width*.05,
                            top: MediaQuery.of(context).size.height*.02,
                            bottom: MediaQuery.of(context).size.height*.02

                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 25,),
                            Container(
                              height: MediaQuery.of(context).size.height*.05,
                              child: TextFormField(
                                onFieldSubmitted: (value){
                                  FocusScope.of(context).requestFocus(FocusNode());
                                },
                                validator: (value){
                                  if(value!.isEmpty){
                                    return '';
                                  }
                                  return null;
                                },
                                controller: device_number,
                                decoration: InputDecoration(
                                    errorStyle: TextStyle(fontSize: 0,height: 0),
                                    contentPadding: EdgeInsets.only(left: 10,right: 10),
                                    enabledBorder: new OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black12)
                                    ),
                                    focusedBorder:  new OutlineInputBorder(

                                        borderSide: BorderSide(color: Colors.black12)
                                    ),
                                    focusedErrorBorder:new OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black12)
                                    ),
                                    errorBorder:new OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.red)
                                    ),
                                    hintText: "Device Number",
                                    hintStyle: TextStyle(fontSize: 14,color: Colors.black)
                                ),
                              ),
                            ),
                            SizedBox(height: 25,),
                            Text("Start Time",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                            SizedBox(height: 5,),
                            Container(
                              width: MediaQuery.of(context).size.width*.8,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Color(AppTheme.yellowColor),width: 1)
                              ),
                              child:  TimePickerSpinner(
                                is24HourMode: false,
                                normalTextStyle: TextStyle(
                                    fontSize: 18,
                                    height: 1.5,
                                    color: Colors.black
                                ),
                                highlightedTextStyle: TextStyle(
                                    fontSize: 18,
                                    height: 1.5,
                                    color: Color(AppTheme.yellowColor)
                                ),
                                spacing: 35,
                                itemHeight: 30,
                                isForce2Digits: true,
                                onTimeChange: (time) {
                                  setState(() {
                                    startTime = time;
                                  });
                                },
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*.06,),
                            Text("End Time",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                            SizedBox(height: 5,),
                            Container(
                              width: MediaQuery.of(context).size.width*.8,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Color(AppTheme.yellowColor),width: 1)
                              ),
                              child:  TimePickerSpinner(
                                is24HourMode: false,
                                normalTextStyle: TextStyle(
                                    fontSize: 18,
                                    height: 1.5,
                                    color: Colors.black
                                ),
                                highlightedTextStyle: TextStyle(
                                    fontSize: 18,
                                    height: 1.5,
                                    color: Color(AppTheme.yellowColor)
                                ),
                                spacing: 35,
                                itemHeight: 30,
                                isForce2Digits: true,
                                onTimeChange: (time) {
                                  setState(() {
                                    startTime = time;
                                  });
                                },
                              ),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.02,),
                      Text("Repeat",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Container(
                        height: 50,
                        child: ListView.builder(
                            shrinkWrap: true,primary: false,scrollDirection: Axis.horizontal
                            ,itemCount: days.length,itemBuilder: (context,index){
                          return Row(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  print("ssssssssssssssssssssssssssssss");
                                  days[index].Selected=true;
                                  setState(() {
                                  });
                                },
                                child: Container(
                                    height: 35,width: 35,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(color: Color(AppTheme.primaryColor),width: 1),
                                        color: days[index].Selected?Color(AppTheme.primaryColor):Colors.white
                                    ),
                                    alignment: Alignment.center,
                                    child:Text(days[index].day,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold, color: days[index].Selected?Colors.white:Color(AppTheme.primaryColor)),)
                                ),
                              ),
                              SizedBox(width: 10,)
                            ],
                          );
                        }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Divice Action",style: TextStyle(color: Color(AppTheme.primaryColor),fontSize: 14),),
                          SizedBox(width: 10,),
                          FlutterSwitch(
                            height: 15.0,
                            width: 35.0,
                            padding: 4.0,
                            toggleSize: 9.0,
                            borderRadius: 10.0,
                            inactiveColor: Colors.white,
                            inactiveToggleColor: Colors.black26,
                            activeColor: Color(AppTheme.yellowColor).withOpacity(.4),
                            activeToggleColor:Color(AppTheme.yellowColor),
                            value: true,
                            onToggle: (value) {
                              setState(() {

                              });
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height:MediaQuery.of(context).size.height*.03),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width*.35,
                          height: MediaQuery.of(context).size.height*.06,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(AppTheme.primaryColor)
                          ),
                          alignment: Alignment.center,
                          child: Text("Save",style: TextStyle(color: Colors.white),),
                        ),
                      ),
                      SizedBox(height:MediaQuery.of(context).size.height*.02),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context, GlobalFunction.route(ListOfTiming()));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width*.35,
                          height: MediaQuery.of(context).size.height*.06,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color:  Color(AppTheme.primaryColor),width: 1),
                              color: Colors.white
                          ),
                          alignment: Alignment.center,
                          child: Text("View List",style: TextStyle(color: Color(AppTheme.primaryColor)),),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
class Days{
   String day;
   bool Selected;
   Days({required this.day,required this.Selected});
}
