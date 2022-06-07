import 'dart:convert';
import 'package:http/http.dart'as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fssmarthome/Base/shared_preference_manger.dart';
import 'package:fssmarthome/Provider/DeviceProvider.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/Custom/CustomAppBar.dart';
import 'package:fssmarthome/Views/Custom/GlobalFunction.dart';
import 'package:fssmarthome/Views/Devices/User_Device/user_device.dart';
import 'package:fssmarthome/main.dart';
import 'package:intl/intl.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import '../Provider/AuthProvider.dart';
import '../Provider/RoomProvider.dart';


class UserScreenContainer extends StatefulWidget {
  @override
  State<UserScreenContainer> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreenContainer> {
  bool loading =true;

  var date;

  var day;

  var hour;

  double temp=0.0;
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
    loadData();
    getCurrentLocation();
  }
  Widget build(BuildContext context) {
    var roomProvider= Provider.of<RoomProvider>(context, listen: true);
    var deviceProvider= Provider.of<DeviceProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            SharedPreferenceManager.logout();
            Navigator.pushNamedAndRemoveUntil(context,"/login", (route) => false);
          },
          icon: Icon(
            Icons.arrow_back_ios,color: Color(AppTheme.primaryColor),
          ),
        ),
        titleSpacing: 0.0,
        title: Text(translator.translate("WelcomeHome"),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black87)),
        toolbarHeight: 35,
          iconTheme: IconThemeData(
            color: Colors.black
          ),
        backgroundColor: Color(AppTheme.backGround),
        elevation: 0,
      ),
      // drawer: Drawer(
      //   backgroundColor:  Color(AppTheme.primaryColor),
      //   child: Container(
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.end,
      //       children: [
      //         SizedBox(height: 110,),
      //         Container(
      //         margin:const EdgeInsets.all(5.0),
      //         child: Material(
      //         color:  Color(AppTheme.primaryColor),
      //         shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(10)
      //         ),
      //         child: Container(
      //         padding: const EdgeInsets.all(18.0),
      //         child:
      //         Row(
      //           children: [
      //             SizedBox(width: 10,),
      //             ImageIcon(AssetImage("assets/images/barIcons/user (1).png"),color: Colors.white,size: 22),
      //
      //             SizedBox(width: 20,),
      //             InkWell(
      //
      //               child: Text('Profile',style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 18,
      //               )),
      //               onTap: (){
      //
      //               },
      //             ),
      //
      //
      //
      //           ],
      //         ),),),),
      //
      //         Container(
      //         margin:const EdgeInsets.all(5.0),
      //         child: Material(
      //         color:  Color(AppTheme.primaryColor),
      //         shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(10)
      //         ),
      //         child: Container(
      //         padding: const EdgeInsets.all(18.0),
      //         child:Row(
      //           children: [
      //             SizedBox(width: 10,),
      //             Icon(
      //               Icons.roofing,
      //               color: Colors.white,
      //             ),
      //             SizedBox(width: 20,),
      //             InkWell(
      //
      //               child: Text('Rooms',style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 18,
      //               )),
      //               onTap: (){
      //
      //               },
      //             ),
      //
      //           ],
      //         ),
      //         ),),),
      //
      //         Container(
      //           margin:const EdgeInsets.all(10.0),
      //           child: Material(
      //             color:  Color(AppTheme.primaryColor),
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(10)
      //             ),
      //             child: Container(
      //               padding: const EdgeInsets.all(18.0),
      //               child: Row(
      //                 children: [
      //                   SizedBox(width: 10,),
      //                   Icon(
      //                     Icons.important_devices_sharp,
      //                     color: Colors.white,
      //                   ),
      //                   SizedBox(width: 20,),
      //                   InkWell(
      //                     child: Text('Devices',style: TextStyle(
      //                       color: Colors.white,
      //                       fontSize: 18,
      //                     )),
      //                     onTap: (){
      //
      //                     },
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //         Spacer(),
      //         Container(
      //           margin: EdgeInsets.all(70),
      //           child: MaterialButton(
      //             padding: EdgeInsets.all(10),
      //             color: Colors.amber,
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(25),
      //             ),
      //             onPressed: (){
      //
      //             },
      //             child:  Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 SizedBox(width: 10,),
      //                 Icon(
      //                   Icons.login,
      //                   color: Colors.white,
      //                 ),
      //                 SizedBox(width: 10,),
      //                 InkWell(
      //                   child: Text('Log out',style: TextStyle(
      //                     color: Colors.white,
      //                     fontSize: 18,
      //                   )),
      //                   onTap: (){
      //
      //                   },
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //
      //         SizedBox(height: 20,),
      //
      //
      //       ],
      //     ),
      //   ),
      // ),

      resizeToAvoidBottomInset: false,
        backgroundColor: Color(AppTheme.backGround),
    body:  Padding(
        padding: const EdgeInsets.only(top:0),
        child: Container(
        child: loading?Center(child: CircularProgressIndicator.adaptive(),)
            :SingleChildScrollView(
        physics: BouncingScrollPhysics(),
                child: Container(
                padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height*.02
                ),
                child: Column(
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
                        Text(MyApp.user_name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        SizedBox(height: MediaQuery.of(context).size.height*.01,),
                      ],
                ),
                // GestureDetector(
                //   onTap: () => Scaffold.of(context).openDrawer(),
                //   child: Icon(Icons.menu,size: 30,)),
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
                      Text(hour<12?translator.translate("GoodMorning"):
                      hour<4?translator.translate("GoodAfternoon")
                          :hour<7?translator.translate("GoodEvening")
                          :translator.translate("GoodNight"),
                        style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
                      Text(day.toString(),style:
                      TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Color(AppTheme.yellowColor)),),
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
                        padding: EdgeInsets.only(
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
                // GestureDetector(
                //   onTap: (){
                //
                //   },
                //   child: Row(
                //     children: [
                //       Text(translator.translate("Edit"),style: TextStyle(fontSize: 10),),
                //       SizedBox(width: 5,),
                //       Icon(Icons.edit,size: 15,)
                //     ],
                //   ),
                // )
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*.005,),

        ],
        ),
        ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*.15,
            child: ListView.builder(
                itemCount: roomProvider.userRooms.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width*.05,),
                      GestureDetector(
                        onTap: (){
                          roomProvider.getUserDevice(roomProvider.userRooms[index].roomId);
                          Navigator.push(context, GlobalFunction.route(UserRoomDivices(room_id:(roomProvider.userRooms[index].roomId)!,name:translator.currentLanguage == 'ar' ?(roomProvider.userRooms[index].roomNameAr)!:(roomProvider.userRooms[index].roomName)!,route: 1,)));

                          // Navigator.push(context, MaterialPageRoute(builder: (_){
                          //   return UserDevices();
                          // }));
                          print('555');
                         // Navigator.push(context, GlobalFunction.route(UserDivices(room_id:roomProvider.rooms[index].id,name:roomProvider.rooms[index].room.name,route: 1,)));
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
                              Image.network((roomProvider.userRooms[index].roomLogo)!,
                                height: MediaQuery.of(context).size.height*.055,
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height*.01,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(translator.currentLanguage == 'ar' ?(roomProvider.userRooms[index].roomNameAr)!:(roomProvider.userRooms[index].roomName)!,maxLines: 1,style: TextStyle(height: 1.4,fontSize: 12),),
                                  // Text("  ${translator.translate("devices")} ${roomProvider.rooms[index].devices.toString()} ",style: TextStyle(fontSize: 9),),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      index==roomProvider.allRooms.length-1?
                      Row(
                        children: [
                          SizedBox(width: MediaQuery.of(context).size.width*.05,),
                          GestureDetector(
                            onTap: (){
                            //  ChooseRoom();
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
                    Text(deviceProvider.roomDevices[index].userRoom==""?"Room Name":translator.currentLanguage == 'ar' ?deviceProvider.roomDevices[index].userRoom["room"]["name_ar"]:deviceProvider.roomDevices[index].userRoom["room"]["name_en"]??"Room Name",style: TextStyle(color:deviceProvider.roomDevices[index].relay=="1"?Colors.white:Colors.black,fontSize: 9.5,fontWeight: FontWeight.bold,height: 1.4),),
                    Text(deviceProvider.roomDevices[index].device==""?"Device Name":translator.currentLanguage == 'ar' ?deviceProvider.roomDevices[index].device.nameAr:deviceProvider.roomDevices[index].device.name??"Device Name",style: TextStyle(color:deviceProvider.roomDevices[index].relay=="1"?Colors.white:Colors.black,fontSize: 9.5,fontWeight: FontWeight.bold,height: 1.4),),
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
        )
        ,
        ),
      ),
    );
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
}
