import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fssmarthome/Provider/DeviceProvider.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class WaterLeak extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<WaterLeak>{
  int degree=5;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var deviceProvider= Provider.of<DeviceProvider>(context, listen: false);
    print(deviceProvider.roomDevices[deviceProvider.SelectedIndex].device.id);
    print(deviceProvider.roomDevices[deviceProvider.SelectedIndex].id);
    print(deviceProvider.roomDevices[deviceProvider.SelectedIndex].active);
    print(deviceProvider.roomDevices[deviceProvider.SelectedIndex].reading);
    print("ssssssssssssssssssssssssssssssssssssssssssssssss");
  }
  @override
  Widget build(BuildContext context) {
    var deviceProvider= Provider.of<DeviceProvider>(context, listen: true);
    return Directionality(
      textDirection:translator.currentLanguage == 'ar' ?  TextDirection.rtl : TextDirection.ltr,
      child: Container(
        width: MediaQuery.of(context).size.width*.95,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black12.withOpacity(.05),width: 1),
            color: Color(AppTheme.backGround2).withOpacity(.18)
        ),
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height*.02,
        ),
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width*.03,
          right: MediaQuery.of(context).size.width*.03,
          top: MediaQuery.of(context).size.height*.03,
          bottom: MediaQuery.of(context).size.height*.03,
        ),
        child:Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*.43,
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width*.43-30,
                              child: Text(translator.translate('WaterLeakvalue'),style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)),
                          FlutterSwitch(
                            height: 15.0,
                            width: 30.0,
                            padding: 4.0,
                            toggleSize: 9.0,
                            borderRadius: 10.0,
                            inactiveColor: Colors.white,
                            inactiveToggleColor: Colors.black26,
                            activeColor: Color(AppTheme.primaryColor),
                            value:deviceProvider.roomDevices[deviceProvider.SelectedIndex].relay==null?false:deviceProvider.roomDevices[deviceProvider.SelectedIndex].relay=="1"?true:false,
                            onToggle: (value) {
                              if(deviceProvider.roomDevices[deviceProvider.SelectedIndex].relay=="1"){
                                deviceProvider.roomDevices[deviceProvider.SelectedIndex].relay="0";
                                setState(() {
                                });
                              }
                              else{
                                deviceProvider.roomDevices[deviceProvider.SelectedIndex].relay="1";
                                setState(() {
                                });
                              }
                              deviceProvider.UpdateDeviceData(deviceProvider.roomDevices[deviceProvider.SelectedIndex]);
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*.43,
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width*.43-30,
                              child: Text(translator.translate('WaterLeakEvent'),style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)),
                          FlutterSwitch(
                            height: 15.0,
                            width: 30.0,
                            padding: 4.0,
                            toggleSize: 9.0,
                            borderRadius: 10.0,
                            inactiveColor: Colors.white,
                            inactiveToggleColor: Colors.black26,
                            activeColor: Color(AppTheme.primaryColor),
                            value:deviceProvider.roomDevices[deviceProvider.SelectedIndex].eventAction==null?false:deviceProvider.roomDevices[deviceProvider.SelectedIndex].eventAction=="1"?true:false,
                            onToggle: (value) {
                              if(deviceProvider.roomDevices[deviceProvider.SelectedIndex].eventAction=="1"){
                                deviceProvider.roomDevices[deviceProvider.SelectedIndex].eventAction="0";
                                setState(() {
                                });
                              }
                              else{
                                deviceProvider.roomDevices[deviceProvider.SelectedIndex].eventAction="1";
                                setState(() {
                                });
                              }
                              deviceProvider.UpdateDeviceData(deviceProvider.roomDevices[deviceProvider.SelectedIndex]);
                            },
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(  height: MediaQuery.of(context).size.height*.03,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*.42,
                  height: MediaQuery.of(context).size.height*.27,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                  ),
                  alignment: Alignment.center,
                  child: CircularPercentIndicator(
                    radius: MediaQuery.of(context).size.height*.14,
                    lineWidth: 7,
                    percent: 0.5,
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/devices/water leak.png"
                          ,height: MediaQuery.of(context).size.height*.035,
                        ),
                        SizedBox(height: 5,),
                        Text("${deviceProvider.roomDevices[deviceProvider.SelectedIndex].reading==null?"0":deviceProvider.roomDevices[deviceProvider.SelectedIndex].reading}%",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)
                      ],
                    ),
                    backgroundColor: Colors.black12,
                    fillColor: Colors.white,
                    progressColor: Colors.black12,
                    arcBackgroundColor: Color(AppTheme.primaryColor),
                    arcType: ArcType.FULL,

                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*.42,
                  height: MediaQuery.of(context).size.height*.22,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                  ),
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width*.03,
                    right: MediaQuery.of(context).size.width*.03,
                    top: MediaQuery.of(context).size.height*.03,
                    bottom: MediaQuery.of(context).size.height*.02,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(translator.translate('Switch'),style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                          SizedBox(width: 10,),
                          FlutterSwitch(
                            height: 15.0,
                            width: 30.0,
                            padding: 4.0,
                            toggleSize: 9.0,
                            borderRadius: 10.0,
                            inactiveColor: Colors.black12,
                            inactiveToggleColor: Colors.black26,
                            activeColor: Color(AppTheme.primaryColor),
                            value:deviceProvider.roomDevices[deviceProvider.SelectedIndex].relay2==null?false:deviceProvider.roomDevices[deviceProvider.SelectedIndex].relay2=="1"?true:false,
                            onToggle: (value) {
                              if(deviceProvider.roomDevices[deviceProvider.SelectedIndex].relay2=="1"){
                                deviceProvider.roomDevices[deviceProvider.SelectedIndex].relay2="0";
                                setState(() {
                                });
                              }
                              else{
                                deviceProvider.roomDevices[deviceProvider.SelectedIndex].relay2="1";
                                setState(() {
                                });
                              }
                              deviceProvider.UpdateDeviceData(deviceProvider.roomDevices[deviceProvider.SelectedIndex]);
                            },
                          )
                        ],),
                      SizedBox(height:MediaQuery.of(context).size.height*.03,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                              if(int.parse(deviceProvider.roomDevices[deviceProvider.SelectedIndex].eventValue)>0){
                                setState(() {
                                  deviceProvider.roomDevices[deviceProvider.SelectedIndex].eventValue=(int.parse( deviceProvider.roomDevices[deviceProvider.SelectedIndex].eventValue)-1).toString();
                                });
                                // deviceProvider.UpdateDeviceData(deviceProvider.roomDevices[deviceProvider.SelectedIndex]);
                              }
                            },
                            child: Container(
                              height: 23,width:26,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(AppTheme.primaryColor)
                              ),
                              alignment: Alignment.center,
                              child: Image.asset("assets/images/bottom.png",
                                height: 13,width:18,fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Text(deviceProvider.roomDevices[deviceProvider.SelectedIndex].eventValue.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,height: 1.4),),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                deviceProvider.roomDevices[deviceProvider.SelectedIndex].eventValue=(int.parse( deviceProvider.roomDevices[deviceProvider.SelectedIndex].eventValue)+1).toString();
                              });

                            },
                            child: Container(
                              height: 23,width:26,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(AppTheme.primaryColor)
                              ),
                              alignment: Alignment.center,
                              child: Image.asset("assets/images/top.png",
                                height: 13,width:18,fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      GestureDetector(
                        onTap: (){
                          deviceProvider.UpdateDeviceData(deviceProvider.roomDevices[deviceProvider.SelectedIndex]);
                        },
                        child: Container(
                          width: 45,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(AppTheme.primaryColor)
                          ),
                          alignment: Alignment.center,
                          child: Text(translator.translate('Ok'),style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
                        ),
                      ),
                      SizedBox(height:MediaQuery.of(context).size.height*.01,),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}