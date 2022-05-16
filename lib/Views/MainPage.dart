import 'dart:convert';
import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:location/location.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:fssmarthome/Provider/DeviceProvider.dart';
import 'package:fssmarthome/Provider/RoomProvider.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Theme/StaticList.dart';
import 'package:fssmarthome/Views/Custom/GlobalFunction.dart';
import 'package:fssmarthome/Views/Home.dart';
import 'package:fssmarthome/Views/RoomDevices.dart';
import 'package:fssmarthome/main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import  'package:intl/intl.dart';

import '../Models/DeviceRealModel.dart';
import '../Models/RoomDevicesModel.dart';
class MainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<MainPage>{
  bool loading =true;
  var date;
  var day;
  var hour;
  double temp=0.0;
  DatabaseReference ref = FirebaseDatabase.instance.ref("userRoomDevices");
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
  loadData()async{
    var roomProvider= Provider.of<RoomProvider>(context, listen: false);
    var deviceProvider= Provider.of<DeviceProvider>(context, listen: false);
    var body=GlobalFunction.getBody(27, 0, "id", "ASC", "all", "false", "true", ["user_id"], ["="], ["${MyApp.user_id}"]);
    var body1=GlobalFunction.getBody(30, 0, "id", "ASC", "all", "false", "true", [], [], []);
    var bodyDevice=GlobalFunction.getBody(6, 0, "id", "ASC", "all", "false", "true", ["Field","Sort"], ["=","="], ["updated_at","DESC"]);
    await roomProvider.getUserRooms(body);
     roomProvider.getRooms(body1);
    await deviceProvider.getHomeDevices(bodyDevice);
    print("WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW");
    setState(() {
      date=DateTime.now();
      day=DateFormat('EEEE').format(DateTime.now());
      var h=DateFormat("HH").format(DateTime.now());
      hour=int.parse(h.toString());
      loading=false;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listenRoomDevices(context);
    loadData();
    getCurrentLocation();
  }
  @override
  Widget build(BuildContext context) {
    var roomProvider= Provider.of<RoomProvider>(context, listen: true);
    var deviceProvider= Provider.of<DeviceProvider>(context, listen: true);
    return WillPopScope(
      onWillPop: ()async{
        confirmCloseApp(context);
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(AppTheme.backGround),
        body: loading?Center(child: CircularProgressIndicator.adaptive(),)
            : SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height*.02
              ),
              child:Column(

                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width*.05,
                        right: MediaQuery.of(context).size.width*.05
                    ),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: MediaQuery.of(context).size.height*.025,),
                                Text(translator.translate("WelcomeHome"),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black87),),
                                Text(MyApp.user_name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                SizedBox(height: MediaQuery.of(context).size.height*.01,),
                              ],
                            ),
                            GestureDetector(
                                onTap: () => Scaffold.of(context).openDrawer(),
                                child: Icon(Icons.menu,size: 30,)),
                          ],
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height*.14,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.white
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset("assets/images/weather.png",
                                width: MediaQuery.of(context).size.width*.22,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width*.32,
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height*.012,
                                  bottom: MediaQuery.of(context).size.height*.012,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(hour<12?translator.translate("GoodMorning"):hour<4?translator.translate("GoodAfternoon"):hour<7?translator.translate("GoodEvening"):translator.translate("GoodNight"),style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
                                    Text(day.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Color(AppTheme.yellowColor)),),
                                    Text(date.toString().substring(0,11),style: TextStyle(fontSize: 10),)
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("$temp",style: TextStyle(color: Color(AppTheme.yellowColor),fontSize: 25,fontWeight: FontWeight.bold),),
                                    SizedBox(width: 5,),
                                    Padding(
                                      padding:  EdgeInsets.only(
                                          top: MediaQuery.of(context).size.height*.02
                                      ),
                                      child: Container(
                                        width: 5,height: 5,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                            border: Border.all(color: Color(AppTheme.yellowColor),width: 1),
                                            color: Colors.white
                                        ),
                                      ),
                                    ),
                                    Text("c",style: TextStyle(color: Color(AppTheme.yellowColor),fontSize: 25,fontWeight: FontWeight.bold),),
                                    SizedBox(width: 15,),
                                  ],
                                ),
                              )
                            ],),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*.02,),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(translator.translate("Rooms"),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, GlobalFunction.route(Home(index: 3)));
                                },
                                child: Row(
                                  children: [
                                    Text(translator.translate("Edit"),style: TextStyle(fontSize: 10),),
                                    SizedBox(width: 5,),
                                    Icon(Icons.edit,size: 15,)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*.005,),
                      ],
                    ),
                  ),
                  roomProvider.rooms.length==0?
                       Row(
                       children: [
                        SizedBox(width: MediaQuery.of(context).size.width*.05,),
                        GestureDetector(
                        onTap: (){
                          ChooseRoom();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width*.25,
                          height: MediaQuery.of(context).size.height*.15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.white
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: MediaQuery.of(context).size.height*.02,),
                               Icon(Icons.add,size: 50,),
                              SizedBox(height: MediaQuery.of(context).size.height*.01,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(translator.translate("AddRoom"),style: TextStyle(height: 1.4,fontSize: 12),),

                                ],
                              )
                            ],
                          ),
                        ),
                      ),

                     ],
                   )
                      :Container(
                        width: MediaQuery.of(context).size.width,
                       height: MediaQuery.of(context).size.height*.15,
                       child: ListView.builder(
                        itemCount: roomProvider.rooms.length,
                       scrollDirection: Axis.horizontal,
                       itemBuilder: (context,index){
                        return Row(
                        children: [
                          SizedBox(width: MediaQuery.of(context).size.width*.05,),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, GlobalFunction.route(RoomDivices(room_id:roomProvider.rooms[index].id,name:roomProvider.rooms[index].room.name,route: 1,)));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width*.25,
                              height: MediaQuery.of(context).size.height*.15,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: Colors.white
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                                  Image.network(roomProvider.rooms[index].room.logo,
                                    height: MediaQuery.of(context).size.height*.055,
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height*.01,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(roomProvider.rooms[index].room.name,maxLines: 1,style: TextStyle(height: 1.4,fontSize: 12),),
                                      Text("  ${translator.translate("devices")} ${roomProvider.rooms[index].devices.toString()} ",style: TextStyle(fontSize: 9),),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          index==roomProvider.rooms.length-1?
                          Row(
                            children: [
                              SizedBox(width: MediaQuery.of(context).size.width*.05,),
                              GestureDetector(
                                onTap: (){
                                  ChooseRoom();
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width*.25,
                                  height: MediaQuery.of(context).size.height*.15,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      color: Colors.white
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(height: MediaQuery.of(context).size.height*.02,),
                                      Icon(Icons.add,size: 50,),
                                      SizedBox(height: MediaQuery.of(context).size.height*.01,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(translator.translate("AddRoom"),style: TextStyle(height: 1.4,fontSize: 12),),

                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width*.05,),
                            ],
                          ):SizedBox()

                        ],
                      );
                    }),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width*.05,
                      right: MediaQuery.of(context).size.width*.05
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(translator.translate("LastedWorkedDevices"),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.01,),
                  GridView.builder(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .03,
                        right: MediaQuery.of(context).size.width * .03),
                    primary: false,
                    shrinkWrap: true,
                    itemCount: deviceProvider.roomDevices.length>6?6:deviceProvider.roomDevices.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1 / 1.4),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.black12.withOpacity(.1),width: 1),
                          color: deviceProvider.roomDevices[index].relay=="1"?Color(AppTheme.primaryColor).withOpacity(.9):Colors.white,
                        ),
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width*.02,
                          right: MediaQuery.of(context).size.width*.02,
                          bottom: MediaQuery.of(context).size.height*.01
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*.15,
                              height: MediaQuery.of(context).size.height*.08,
                              margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height*.01,
                                bottom: MediaQuery.of(context).size.height*.0
                              ),
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
                                color:deviceProvider.roomDevices[index].relay=="0"?Colors.white: Color(AppTheme.backGround2).withOpacity(.18),
                              ),
                              padding: EdgeInsets.all(12),
                              child: Image.network(deviceProvider.roomDevices[index].device==""?"https://3.bp.blogspot.com/-oNPnxNGgBN8/U0bMAOL-PWI/AAAAAAAAAYM/ZctpMD6CjD0/s1600/sensor.jpg":deviceProvider.roomDevices[index].device.logo??"https://3.bp.blogspot.com/-oNPnxNGgBN8/U0bMAOL-PWI/AAAAAAAAAYM/ZctpMD6CjD0/s1600/sensor.jpg",color: deviceProvider.roomDevices[index].relay=="1"?Colors.white:Colors.black,),

                            ),
                            Text(deviceProvider.roomDevices[index].userRoom==""?"Room Name":deviceProvider.roomDevices[index].userRoom["room"]["name"]??"Room Name",style: TextStyle(color:deviceProvider.roomDevices[index].relay=="1"?Colors.white:Colors.black,fontSize: 9.5,fontWeight: FontWeight.bold,height: 1.4),),
                            Text(deviceProvider.roomDevices[index].device==""?"Device Name":deviceProvider.roomDevices[index].device.name??"Device Name",style: TextStyle(color:deviceProvider.roomDevices[index].relay=="1"?Colors.white:Colors.black,fontSize: 9.5,fontWeight: FontWeight.bold,height: 1.4),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(deviceProvider.roomDevices[index].relay=="1"?translator.translate("On"):translator.translate("off"),style: TextStyle(color:deviceProvider.roomDevices[index].relay=="1"?Colors.white:Colors.black,fontSize: 12,height: 1.5),),
                                FlutterSwitch(
                                  height: 15.0,
                                  width: 35.0,
                                  padding: 4.0,
                                  toggleSize: 9.0,
                                  borderRadius: 10.0,
                                  inactiveColor: Color(AppTheme.backGround2).withOpacity(.18),
                                  inactiveToggleColor: Colors.black26,
                                  activeColor: Color(AppTheme.primaryColor),
                                  value: deviceProvider.roomDevices[index].relay=="1"?true:false,
                                  onToggle: (value) {
                                   if(deviceProvider.roomDevices[index].relay=="1"){
                                    setState(() {
                                      deviceProvider.roomDevices[index].relay="0";
                                    });
                                   }else{
                                      setState(() {
                                        deviceProvider.roomDevices[index].relay="1";
                                      });
                                   }
                                   deviceProvider.UpdateDeviceData(deviceProvider.roomDevices[index]);
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  )

                ],
              ),
          ),
            ),
      ),
    );

  }
  confirmCloseApp(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
          child:  Container(
            padding: EdgeInsets.only(
                left: 10,
                right: 10
            ),
            height: 150.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(0)),
                border: Border.all(color: Colors.black12,width: 2.0),
                color: Colors.white
            ),
            child: Stack(children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center
                ,crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(alignment: Alignment.center,child: Column(
                    children: [
                      Icon(Icons.warning_amber_sharp,size: 50,),
                      SizedBox(height: 3,),
                      Text(translator.translate("AreYouSureCloseApp"),style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                      // Text("${title}",textAlign: TextAlign.center,)
                    ],
                  )),
                  SizedBox(height: 10,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          child: Container(

                            decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black38,width: 1.0),
                                color:Colors.white
                            ),
                            height: MediaQuery.of(context).size.height*.04,
                            width: MediaQuery.of(context).size.width*.32,
                            alignment: Alignment.center,
                            child:   Text(translator.translate("Cancel"),style: TextStyle(color:Colors.black,fontSize: 13),),
                          ),
                          onTap: (){
                            Navigator.pop(context);
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color:Color(AppTheme.primaryColor)
                            ),
                            height: MediaQuery.of(context).size.height*.04,
                            width: MediaQuery.of(context).size.width*.32,
                            alignment: Alignment.center,
                            child:   Text(translator.translate("Confirm"),style: TextStyle(color:Colors.white,fontSize: 13),),
                          ),
                          onTap: () async {
                            SystemNavigator.pop();
                            Navigator.pop(context);
                          },
                        ),

                      ],
                    ),
                  )
                ],
              ),


            ],),
          ),
        ));
  }
  ChooseRoom(){
    var roomProvider= Provider.of<RoomProvider>(context, listen: false);
    int select=-1;
    showDialog(
        context: context,
        builder: (BuildContext context) =>StatefulBuilder(
          builder: (BuildContext context, StateSetter setState)=> Scaffold(
            backgroundColor: Colors.black87.withOpacity(.75),
            body: Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width*.05,
                  right: MediaQuery.of(context).size.width*.05,
                  top: MediaQuery.of(context).size.height*.1,
                  bottom: MediaQuery.of(context).size.height*.1
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white
              ),
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width*.05,
                  right: MediaQuery.of(context).size.width*.05,
                  top: MediaQuery.of(context).size.height*.025,
                  bottom: MediaQuery.of(context).size.height*.025
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(translator.translate('ChooseNewRoom'),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Color(AppTheme.yellowColor)),),
                  SizedBox(height:  MediaQuery.of(context).size.height*.025),
                  Expanded(
                    child: ListView.builder(
                        itemCount: roomProvider.allRooms.length,
                        itemBuilder: (context,index){
                          return GestureDetector(
                            onTap: () {
                              setState((){
                                select=roomProvider.allRooms[index].id;
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      bottom: MediaQuery.of(context).size.height*.03
                                  ),
                                  child: Row(
                                    children: [
                                      select==roomProvider.allRooms[index].id? Icon(Icons.check_circle_outline,color: Color(AppTheme.yellowColor),):Icon(Icons.circle_outlined,color: Color(AppTheme.primaryColor),)
                                      , SizedBox(width: 15,),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(color: Colors.black26,width: 1)
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.network(roomProvider.allRooms[index].logo,
                                            width: MediaQuery.of(context).size.width*.15,
                                            height: MediaQuery.of(context).size.height*.05,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15,),
                                      Text(roomProvider.allRooms[index].name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)

                                    ],
                                  ),
                                ),
                                index==roomProvider.allRooms.length-1?GestureDetector(
                                  onTap: (){
                                    AddOther();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context).size.height*.02
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Icons.add,size: 30,),
                                        SizedBox(width: 10,),
                                        Text(translator.translate('AddAnother'),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                  ),
                                ):SizedBox()
                              ],
                            ),
                          );
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: ()async{
                          if(select==-1){
                            FlutterToastr.show(translator.translate('pleaseSelectRoom'), context, duration: FlutterToastr.lengthLong, position:  FlutterToastr.center);
                          }
                          else{
                            await roomProvider.addRoomToUser(MyApp.user_id, select);
                            if(roomProvider.connection==200){
                              FlutterToastr.show(translator.translate('RoomAddedSuccessfully'), context, duration: FlutterToastr.lengthLong, position:  FlutterToastr.center);
                              loadData();
                              Navigator.pop(context);
                            }
                            else{
                              FlutterToastr.show(roomProvider.responceInfo["errors"], context, duration: FlutterToastr.lengthLong, position:  FlutterToastr.center);
                            }
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width*.35,
                          height: MediaQuery.of(context).size.height*.06,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              border: Border.all(color: Color(AppTheme.yellowColor),width: 1),
                              color: Colors.white
                          ),
                          alignment: Alignment.center,
                          child: Text(translator.translate('Add'),style: TextStyle(color: Color(AppTheme.yellowColor),fontSize: 16,fontWeight: FontWeight.bold),),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width*.35,
                          height: MediaQuery.of(context).size.height*.06,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              border: Border.all(color: Colors.black,width: 1),
                              color: Colors.white
                          ),
                          alignment: Alignment.center,
                          child: Text(translator.translate('Back'),style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
  late File selectedImage;
  int image=0;
  pickImage(BuildContext context ) async {
    setState(() {
    });
    var imagePicker = new  ImagePicker();
    var profileImage=await imagePicker.pickImage(source:  ImageSource.gallery);
    setState(() {
      selectedImage = File(profileImage!.path);
      image=1;
    });
  }
  AddOther(){
    var roomProvider= Provider.of<RoomProvider>(context, listen: false);
    TextEditingController name_en =new TextEditingController();
    TextEditingController name_ar =new TextEditingController();
    final formKey=GlobalKey<FormState>();
    FocusNode name_arNode =new FocusNode();
    bool loading =false;
    showDialog(
        context: context,
        builder: (BuildContext context) =>StatefulBuilder(
          builder: (BuildContext context, StateSetter setState)=> Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.black87.withOpacity(.75),
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width*.05,
                  right: MediaQuery.of(context).size.width*.05,
                  top: MediaQuery.of(context).size.height*.1,
                  bottom: MediaQuery.of(context).size.height*.1
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white
              ),
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width*.05,
                  right: MediaQuery.of(context).size.width*.05,
                  top: MediaQuery.of(context).size.height*.08,
                  bottom: MediaQuery.of(context).size.height*.08
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(translator.translate('AddOtherRoom'),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Color(AppTheme.yellowColor)),),
                    SizedBox(height:  MediaQuery.of(context).size.height*.025),
                    Padding(
                      padding:  EdgeInsets.only(
                        left: MediaQuery.of(context).size.width*.05,
                        right: MediaQuery.of(context).size.width*.05,
                      ),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextFormField(
                              onFieldSubmitted: (value){
                                FocusScope.of(context).requestFocus(name_arNode);
                              },
                              validator: (value){
                                if(value!.isEmpty){
                                  return translator.translate('Entername');
                                }
                                return null;
                              },
                              controller: name_en,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 10,right: 10),
                                  hintText: "Room Name"
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*.02,),
                            TextFormField(
                              focusNode: name_arNode,
                              onFieldSubmitted: (value){
                                FocusScope.of(context).requestFocus(FocusNode());
                              },
                              validator: (value){
                                if(value!.isEmpty){
                                  return translator.translate('Entername');
                                }
                                return null;
                              },
                              controller: name_ar,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 10,right: 10),
                                  hintText: "الاسم بالعربية"
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*.08,),
                            image==0? GestureDetector(
                              onTap: ()=>pickImage(context),
                              child: Stack(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height*.16,
                                    width: MediaQuery.of(context).size.height*.16,
                                    child: Container(
                                      height: MediaQuery.of(context).size.height*.14,
                                      width: MediaQuery.of(context).size.height*.14,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(1000),
                                          color: Colors.black26
                                      ),
                                      padding: EdgeInsets.all(MediaQuery.of(context).size.height*.045),
                                      child: Image.asset("assets/images/upload icon.png"),
                                    ),
                                  ),
                                  Positioned(
                                      top: MediaQuery.of(context).size.height*.1,
                                      left: MediaQuery.of(context).size.height*.115,
                                      child: Container(
                                        height: MediaQuery.of(context).size.height*.045,
                                        width: MediaQuery.of(context).size.height*.045,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(1000),
                                            color: Color(AppTheme.primaryColor)
                                        ),
                                        child: Icon(Icons.add,size: 28,color: Colors.white,),
                                      ))

                                ],
                              ),
                            ):Text(translator.translate('OneImageSelected'),style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.red),),
                            SizedBox(height: MediaQuery.of(context).size.height*.05,),
                          ],
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: ()async{
                            if(formKey.currentState!.validate()&&image!=0){
                              setState((){
                                loading=true;
                              });
                              await roomProvider.AddRoom(selectedImage, context, name_en.text, name_ar.text);

                              loadData();
                              if(roomProvider.connection==200){
                                await roomProvider.addRoomToUser(MyApp.user_id, roomProvider.responceInfo["data"]["id"]);
                                if(roomProvider.connection==200){
                                  Navigator.pushNamedAndRemoveUntil(context, "/rooms", (route) => false);
                                  FlutterToastr.show(translator.translate('RoomAddedSucceffuly'), context, duration: FlutterToastr.lengthLong, position:  FlutterToastr.center);
                                  setState((){
                                    loading=false;
                                  });
                                  loadData();
                                }
                                else{
                                  FlutterToastr.show(roomProvider.responceInfo["errors"], context, duration: FlutterToastr.lengthLong, position:  FlutterToastr.center);
                                }
                              }
                              else{
                                FlutterToastr.show(roomProvider.responceInfo["errors"], context, duration: FlutterToastr.lengthLong, position:  FlutterToastr.center);
                              }

                            }
                            else{
                              print("fffffffffffffffffffffffffffff");
                              FlutterToastr.show(translator.translate('PleaseEnterTheNameAndSelectImageOfRoom'), context, duration: FlutterToastr.lengthLong, position:  FlutterToastr.center);
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width*.35,
                            height: MediaQuery.of(context).size.height*.06,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                border: Border.all(color: Color(AppTheme.yellowColor),width: 1),
                                color: loading?Colors.black12:Colors.white
                            ),
                            alignment: Alignment.center,
                            child: Text(translator.translate('Add'),style: TextStyle(color: Color(AppTheme.yellowColor),fontSize: 16,fontWeight: FontWeight.bold),),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width*.35,
                            height: MediaQuery.of(context).size.height*.06,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                border: Border.all(color: Colors.black,width: 1),
                                color: Colors.white
                            ),
                            alignment: Alignment.center,
                            child: Text(translator.translate('Back'),style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
  Future<void> getMyLocationWeatherBy( latitude, longitude) async{
    print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
    try {
      var url = 'https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=6bcb24935e1347781776a47ff9f8ea2b';
      print("Url is =${url}");
      final response = await http.get(Uri.parse(url));

      if(response.statusCode==200){
        print("response.body is =${response.body}");
        temp=double.parse((double.parse(json.decode(response.body)["list"][0]["main"]["temp"].toString())-273.15).toStringAsFixed(1));
        setState((){
        });
        print("weather weather weather weather weather weather weather weather");
      //  return Weatherforecast5Model.fromJson(json.decode(response.body));
      }else{
        throw Exception("Can not find $this location Weather");
      }
    } catch (e) {print(e.toString());}
  }
  Future<void> getCurrentLocation() async {
    print("locationnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn");
    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    this.getMyLocationWeatherBy(_locationData.latitude!, _locationData.longitude!);
  }
}