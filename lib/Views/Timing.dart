import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:fssmarthome/Provider/DeviceProvider.dart';
import 'package:fssmarthome/Provider/RoomProvider.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/Custom/CustomAppBar.dart';
import 'package:fssmarthome/Views/ListOfTiming.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
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
  TextEditingController room_id=new TextEditingController();
  List<Days>days=[
    Days(day: "sat",Selected: false),
    Days(day: "sun",Selected: false),
    Days(day: "mon",Selected: false),
    Days(day: "tue",Selected: false),
    Days(day: "wed",Selected: false),
    Days(day: "thu",Selected: false),
    Days(day: "fri",Selected: false),
  ];
  bool loading =true;
  bool event_action=true;
  bool device_action=true;
  loadData()async{
    var roomProvider= Provider.of<RoomProvider>(context, listen: false);
    var deviceProvider= Provider.of<DeviceProvider>(context, listen: false);
    var body=GlobalFunction.getBody(27, 0, "id", "ASC", "all", "false", "true", ["user_id"], ["="], ["${MyApp.user_id}"]);
    await roomProvider.getUserRooms(body);
    setState(() {
      loading=false;
    });

    print("-----------------------------------------------------------------------");
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  @override
  Widget build(BuildContext context) {
    var roomProvider= Provider.of<RoomProvider>(context, listen: true);
    var deviceProvider= Provider.of<DeviceProvider>(context, listen: false);
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
                CustomAppBar(title:translator.translate('Timing')),
                SizedBox(height:MediaQuery.of(context).size.height*.03),
                Text(translator.translate('CreateTiming'),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
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
                          Text(translator.translate('EventAction'),style: TextStyle(color: Color(AppTheme.yellowColor),fontSize: 16),),
                          SizedBox(width: 10,),
                          FlutterSwitch(
                            height: 15.0,
                            width: 35.0,
                            padding: 4.0,
                            toggleSize: 9.0,
                            borderRadius: 10.0,
                            inactiveColor: Colors.black12,
                            inactiveToggleColor: Colors.black26,
                            activeColor: Colors.black54,
                            activeToggleColor:Color(AppTheme.primaryColor),
                            value: event_action,
                            onToggle: (value) {
                              setState(() {
                                 event_action=!event_action;
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
                                controller: room_id,
                                readOnly: true,
                                onTap: ()=>SelectRoom(context),
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
                                    hintText: translator.translate('RoomNumber'),
                                    hintStyle: TextStyle(fontSize: 14,color: Colors.black)
                                ),
                              ),
                            ),
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
                                readOnly: true,
                                onTap: ()=>SelectDevice(context),
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
                                    hintText: translator.translate('DeviceNumber'),
                                    hintStyle: TextStyle(fontSize: 14,color: Colors.black)
                                ),
                              ),
                            ),
                            SizedBox(height: 25,),
                            Text(translator.translate('StartTime'),style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
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
                            Text(translator.translate('EndTime'),style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
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
                                    endTime = time;
                                  });
                                },
                              ),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.02,),
                      Text(translator.translate('Repeat'),style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
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
                          Text(translator.translate('DiviceAction'),style: TextStyle(color: Color(AppTheme.primaryColor),fontSize: 14),),
                          SizedBox(width: 10,),
                          FlutterSwitch(
                            height: 15.0,
                            width: 35.0,
                            padding: 4.0,
                            toggleSize: 9.0,
                            borderRadius: 10.0,
                            inactiveColor: Colors.black12,
                            inactiveToggleColor: Colors.black26,
                            activeColor: Color(AppTheme.yellowColor).withOpacity(.4),
                            activeToggleColor:Color(AppTheme.yellowColor),
                            value: device_action,
                            onToggle: (value) {
                              print("---------------------------------------------");
                              setState(() {
                                device_action=!device_action;
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
                        onTap: ()async{
                          List<String>_days=[];
                          for(int i=0;i<days.length;i++){
                            if(days[i].Selected){
                              _days.add(days[i].day);
                            }
                          }
                          await deviceProvider.AddTiming(startTime.toString().substring(10,19), device_number.text, endTime.toString().substring(10,19), event_action?1:0, device_action?1:0, _days);
                          if(deviceProvider.connection==200)
                            {
                              FlutterToastr.show(translator.translate('dataAdded'), context, duration: FlutterToastr.lengthLong, position:  FlutterToastr.center);
                              Navigator.push(context, GlobalFunction.route(ListOfTiming()));
                            }
                          else
                          {
                            FlutterToastr.show(translator.translate('Errorr'), context, duration: FlutterToastr.lengthLong, position:  FlutterToastr.center);
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width*.35,
                          height: MediaQuery.of(context).size.height*.06,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(AppTheme.primaryColor)
                          ),
                          alignment: Alignment.center,
                          child: Text(translator.translate('Save'),style: TextStyle(color: Colors.white),),
                        ),
                      ),
                      SizedBox(height:MediaQuery.of(context).size.height*.02),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, GlobalFunction.route(ListOfTiming()));
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
                          child: Text(translator.translate('ViewList'),style: TextStyle(color: Color(AppTheme.primaryColor)),),
                        ),
                      ),
                      SizedBox(height:MediaQuery.of(context).size.height*.02),
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
  SelectRoom(BuildContext context) {
    var roomProvider= Provider.of<RoomProvider>(context, listen: false);
    var deviceProvider= Provider.of<DeviceProvider>(context, listen: false);
    showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
          child:  Container(
            width: MediaQuery.of(context).size.width*.4,
            decoration: BoxDecoration(color: Colors.white,
              // borderRadius: BorderRadius.all(Radius.circular(20))
              // border: Border.all(color: Colors.black12,width: 2.0)
            )
            ,padding: EdgeInsets.only(
            top:  MediaQuery.of(context).size.height*0.01,
            bottom: MediaQuery.of(context).size.height*0.01,
            left: MediaQuery.of(context).size.width*0.05,
            right: MediaQuery.of(context).size.width*0.05,
          ),


            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  roomProvider.rooms.length==0? Container(
                    height: 100,
                    alignment: Alignment.center,
                    child: Text(translator.translate('NoRoomAddedForYou')),
                  ): ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount:  roomProvider.rooms.length,
                    itemBuilder: (context,index){
                      return InkWell(
                          onTap: (){
                            setState(() {
                             room_id.text=roomProvider.rooms[index].id.toString();
                            });
                            deviceProvider.getRoomDevices(roomProvider.rooms[index].id);
                            Navigator.pop(context);
                          },
                          child:Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*.005,top: MediaQuery.of(context).size.height*.005),
                                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*.005,top: MediaQuery.of(context).size.height*.005),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    //color: Color(h.mainColor)
                                  ),
                                  alignment: Alignment.center,
                                  child: Text( roomProvider.rooms[index].room.name,style: TextStyle(color: Colors.black),)),
                              roomProvider.rooms.length-1==index?SizedBox():Container(height: 1,width: MediaQuery.of(context).size.width)
                            ],
                          )
                      );
                    },
                  ),
                ],
              ),
            ),

          ),
        ));
  }
  SelectDevice(BuildContext context) {
    var deviceProvider= Provider.of<DeviceProvider>(context, listen: false);
    showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
          child:  Container(
            width: MediaQuery.of(context).size.width*.4,
            decoration: BoxDecoration(color: Colors.white,
              // borderRadius: BorderRadius.all(Radius.circular(20))
              // border: Border.all(color: Colors.black12,width: 2.0)
            )
            ,padding: EdgeInsets.only(
            top:  MediaQuery.of(context).size.height*0.01,
            bottom: MediaQuery.of(context).size.height*0.01,
            left: MediaQuery.of(context).size.width*0.05,
            right: MediaQuery.of(context).size.width*0.05,
          ),


            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  deviceProvider.roomDevices.length==0? Container(
                    height: 100,
                    alignment: Alignment.center,
                    child: Text(translator.translate('nodevices')),
                  ): ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount:  deviceProvider.roomDevices.length,
                    itemBuilder: (context,index){
                      return InkWell(
                          onTap: (){
                            setState(() {
                               device_number.text= deviceProvider.roomDevices[index].id.toString();
                            });
                            Navigator.pop(context);
                          },
                          child:Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*.005,top: MediaQuery.of(context).size.height*.005),
                                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*.005,top: MediaQuery.of(context).size.height*.005),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    //color: Color(h.mainColor)
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(deviceProvider.roomDevices[index].device.name,style: TextStyle(color: Colors.black),)),
                              deviceProvider.roomDevices.length-1==index?SizedBox():Container(height: 1,width: MediaQuery.of(context).size.width,)
                            ],
                          )
                      );
                    },
                  ),
                ],
              ),
            ),

          ),
        ));
  }
}
class Days{
   String day;
   bool Selected;
   Days({required this.day,required this.Selected});
}
