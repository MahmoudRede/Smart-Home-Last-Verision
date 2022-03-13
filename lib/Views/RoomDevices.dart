import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Models/DeviceRealModel.dart';
import 'package:fssmarthome/Models/RoomDevicesModel.dart';
import 'package:fssmarthome/Provider/DeviceProvider.dart';
import 'package:fssmarthome/Provider/RoomProvider.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Theme/StaticList.dart';
import 'package:fssmarthome/Views/Custom/CustomAppBar.dart';
import 'package:fssmarthome/Views/Custom/GlobalFunction.dart';
import 'package:fssmarthome/Views/Devices/AddDevice.dart';
import 'package:fssmarthome/Views/Devices/Alarm.dart';
import 'package:fssmarthome/Views/Devices/Door.dart';
import 'package:fssmarthome/Views/Devices/FireDetector.dart';
import 'package:fssmarthome/Views/Devices/Motion.dart';
import 'package:fssmarthome/Views/Devices/SmokeDetector.dart';
import 'package:fssmarthome/Views/Devices/Switch.dart';
import 'package:fssmarthome/Views/Devices/Temperature.dart';
import 'package:fssmarthome/Views/Devices/WaterLeak.dart';
import 'package:fssmarthome/main.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

class RoomDivices extends StatefulWidget{
  int room_id;
  String name;
  RoomDivices({required this.room_id,required this.name});
  @override
  State<StatefulWidget> createState() {
    return _state(room_id: this.room_id,name: this.name);
  }
}
class _state extends State<RoomDivices>{
  int room_id;
  var name;
  DatabaseReference ref = FirebaseDatabase.instance.ref("userRoomDevices");

  _state({required this.room_id,required this.name});
   int _index=0;
   bool loading=true;
  List<DeviceRealModel>data=[];
   listenRoomDevices(BuildContext context) async{
     var deviceProvider= Provider.of<DeviceProvider>(context, listen: false);
     ref.onValue.listen((event) {
       //loadData2();
       print(event.snapshot.value);
       Map<Object?,Object?> map =event.snapshot.value as Map<Object?,Object?>;
       print(map);
       data=[];
      map.forEach((key, value) {
         data.add(DeviceRealModel.fromJson(json.decode(json.encode(value))));
       });
      loadData2(context);
     });

   }
   loadData()async{
     var deviceProvider= Provider.of<DeviceProvider>(context, listen: false);
   await deviceProvider.getDevices();
   await deviceProvider.getRoomDevices(room_id);
   deviceProvider.setRoom(room_id);
      if(deviceProvider.roomDevices.length>0){
        deviceProvider.set_Seleceted_index(0);
        if(deviceProvider.roomDevices[0].device.id==14){
         setState(() {
         _index=9;
          });
         deviceProvider.setRoomDevice(deviceProvider.roomDevices[0]);
       }
        else if(deviceProvider.roomDevices[0].device.id==13){
         setState(() {
           _index=8;
         });
         deviceProvider.setRoomDevice(deviceProvider.roomDevices[0]);
       }
       else   if(deviceProvider.roomDevices[0].device.id==12){
         setState(() {
           _index=7;
         });
         deviceProvider.setRoomDevice(deviceProvider.roomDevices[0]);
       }
       else if(deviceProvider.roomDevices[0].device.id==11){
         setState(() {
           _index=6;
         });
         deviceProvider.setRoomDevice(deviceProvider.roomDevices[0]);
       }
       else   if(deviceProvider.roomDevices[0].device.id==10){
         setState(() {
           _index=5;
         });
         deviceProvider.setRoomDevice(deviceProvider.roomDevices[0]);
       }
       else   if(deviceProvider.roomDevices[0].device.id==9){
         setState(() {
           _index=4;
         });
         deviceProvider.setRoomDevice(deviceProvider.roomDevices[0]);
       }
       else if(deviceProvider.roomDevices[0].device.id==8){
         setState(() {
           _index=3;
         });
         deviceProvider.setRoomDevice(deviceProvider.roomDevices[0]);
       }
       else if(deviceProvider.roomDevices[0].device.id==7){
         setState(() {
           _index=2;
         });
         deviceProvider.setRoomDevice(deviceProvider.roomDevices[0]);
       }
       else if(deviceProvider.roomDevices[0].device.id==6){
         setState(() {
           _index=1;
         });
         deviceProvider.setRoomDevice(deviceProvider.roomDevices[0]);
       }
       else if(deviceProvider.roomDevices[0].device.id==5){
         setState(() {
           _index=0;
         });
         deviceProvider.setRoomDevice(deviceProvider.roomDevices[0]);
       }
       else {
         setState(() {
           _index=10;
         });
       }
     }
       else{
       setState(() {
         _index=10;
       });
     }
      setState(() {
       loading=false;
      });
     print(deviceProvider.roomDevicesModel);
     print("-------------------------------------------------------------------------------------------------------");
   }
  loadData2(BuildContext context)async{
    var deviceProvider= Provider.of<DeviceProvider>(context, listen: false);
      for(int i=0;i<deviceProvider.roomDevices.length;i++){
      RoomDevicesModel _roomdevice=  deviceProvider.roomDevices[i];
          print(data[i].id);
          print(_roomdevice.id);
          print("=======================================================");
           DeviceRealModel deviceRealModel    =data.firstWhere((element) => element.id==_roomdevice.id);
          deviceProvider.UpdateRealDevice(i, deviceRealModel);
      }
  }
   @override
   void initState() {
     // TODO: implement initState
     super.initState();
     listenRoomDevices(context);
     loadData();

   }

  @override
  Widget build(BuildContext context) {
    var deviceProvider= Provider.of<DeviceProvider>(context, listen: true);
    //listenRoomDevices(context);
    //print(deviceProvider.roomDevices[deviceProvider.SelectedIndex].active);
    //print("----------------------------------------------------------------");

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(AppTheme.backGround),
        body:loading? Center(child: CircularProgressIndicator.adaptive(),):Directionality(
          textDirection:translator.currentLanguage == 'ar' ?  TextDirection.rtl : TextDirection.ltr,
          child: SingleChildScrollView(
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
                      CustomAppBar(title: this.name),
                      Row(
                        children: [
                          Text(translator.translate('Devices'),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
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
                        itemCount: deviceProvider.roomDevices.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                          return Row(
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: MediaQuery.of(context).size.width*.04,),
                                  GestureDetector(
                                    onTap: (){
                                      deviceProvider.set_Seleceted_index(index);
                                      if(deviceProvider.roomDevices[index].device.id==5){
                                        setState(() {
                                          _index=0;
                                        });
                                      }
                                      else if(deviceProvider.roomDevices[index].device.id==6){
                                        setState(() {
                                          _index=1;
                                        });
                                      }
                                      else if(deviceProvider.roomDevices[index].device.id==7){
                                        print(deviceProvider.roomDevices[index].id);
                                        setState(() {
                                          _index=2;
                                        });
                                      }
                                      else if(deviceProvider.roomDevices[index].device.id==8){
                                        setState(() {
                                          _index=3;
                                        });
                                      }
                                      else if(deviceProvider.roomDevices[index].device.id==9){
                                        setState(() {
                                          _index=4;
                                        });
                                      }
                                      else if(deviceProvider.roomDevices[index].device.id==10){
                                        setState(() {
                                          _index=5;
                                        });
                                      }
                                      else if(deviceProvider.roomDevices[index].device.id==11){
                                        setState(() {
                                          _index=6;
                                        });
                                      }
                                      else if(deviceProvider.roomDevices[index].device.id==12){
                                        setState(() {
                                          _index=7;
                                        });
                                      }
                                      else if(deviceProvider.roomDevices[index].device.id==13){
                                        setState(() {
                                          _index=8;
                                        });
                                      }
                                      else if(deviceProvider.roomDevices[index].device.id==14){
                                        setState(() {
                                          _index=9;
                                        });
                                      }
                                      else {
                                        setState(() {
                                          _index=10;
                                        });
                                      }
                                      if(deviceProvider.roomDevices.length>0){
                                        setState(() {
                                          deviceProvider.setRoomDevice(deviceProvider.roomDevices[index]);
                                        });
                                      }
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
                                              color:deviceProvider.roomDevicesModel==null? Colors.white:deviceProvider.roomDevicesModel==deviceProvider.roomDevices[index]?Color(AppTheme.primaryColor):Colors.white,
                                            ),
                                            padding: EdgeInsets.all(12),
                                            child:deviceProvider.roomDevices[index].device==null? Icon(Icons.devices):Image.network(deviceProvider.roomDevices[index].device.logo,
                                              color:deviceProvider.roomDevicesModel==deviceProvider.roomDevices[index]?Colors.white:Color(AppTheme.primaryColor),
                                            ),

                                          ),
                                          SizedBox(height: 5,),
                                          Text(deviceProvider.roomDevices[index].device==null?"Device":deviceProvider.roomDevices[index].device.name,textAlign: TextAlign.center,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,height: 1.5),)
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              index==deviceProvider.roomDevices.length-1?
                              Row(
                                children: [
                                  SizedBox(width: MediaQuery.of(context).size.width*.04,),
                                  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        _index=10;
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
                                              color: _index==10?Color(AppTheme.primaryColor):Colors.white,
                                            ),
                                            padding: EdgeInsets.all(12),
                                            child:Icon(Icons.add,size: 30,color: _index==10?Colors.white:Color(AppTheme.primaryColor),),
                                            /* color: content==AddDevice(room_id: this.room_id,)?Colors.white:Color(AppTheme.primaryColor),*/
                                          ),

                                          SizedBox(height: 5,),
                                          Text(translator.translate('AddDivice'),textAlign: TextAlign.center,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,height: 1.5),)
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: MediaQuery.of(context).size.width*.04,),
                                ],
                              ):SizedBox()
                            ],
                          );
                        }),
                  ),
                  SizedBox(height: 0,),
                  StaticList.DevicesWidget[_index],
                  SizedBox(height: 20,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}