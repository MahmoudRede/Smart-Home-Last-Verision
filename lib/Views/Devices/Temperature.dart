import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fssmarthome/Provider/DeviceProvider.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class Temperature extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<Temperature>{
  @override
  Widget build(BuildContext context) {
    var deviceProvider= Provider.of<DeviceProvider>(context, listen: true);
    return Directionality(
      textDirection:translator.currentLanguage == 'ar' ?  TextDirection.rtl : TextDirection.ltr,
      child: Column(
        children: [
         Container(
           height: MediaQuery.of(context).size.height*.3,
           width: MediaQuery.of(context).size.width*.9,
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(10),
             border: Border.all(color: Colors.black12,width: 1),
             color: Color(0xffecedf2)
           ),
           padding: EdgeInsets.only(
             left: MediaQuery.of(context).size.width*.02,
             right: MediaQuery.of(context).size.width*.02,
           ),
           child: Column(
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(translator.translate('Temperature & Humidity Switch'),style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                   Switch(value:deviceProvider.roomDevices[deviceProvider.SelectedIndex].relay==null?false:deviceProvider.roomDevices[deviceProvider.SelectedIndex].relay=="1"?true:false,
                        onChanged: (value) {
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
                        },)
                 ],
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                   Container(
                     height: MediaQuery.of(context).size.height*.21,
                     width: MediaQuery.of(context).size.width*.38,
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         color: Colors.white,
                       boxShadow: [
                         BoxShadow(
                           color: Colors.grey.withOpacity(0.05),
                           spreadRadius: 1,
                           blurRadius:1,
                           offset: Offset(3, 3), // changes position of shadow
                         ),
                         BoxShadow(
                           color: Colors.grey.withOpacity(0.05),
                           spreadRadius: 1,
                           blurRadius: 1,
                           offset: Offset(-3, -3), // changes position of shadow
                         ),
                       ],
                     ),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         Container(
                             padding: EdgeInsets.only(
                                 top: MediaQuery.of(context).size.height*.01
                             ),
                             child: Text(translator.translate('Temperature'),style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,),)),
                         Container(
                           padding: EdgeInsets.only(
                             bottom: MediaQuery.of(context).size.height*.01
                           ),
                           child: RotatedBox(
                             quarterTurns: 1,
                             child: ClipRRect(
                               borderRadius: BorderRadius.all(Radius.circular(1000)),
                               child: new CircularPercentIndicator(
                                 radius: MediaQuery.of(context).size.height*.12,
                                 lineWidth: 7,
                                 percent: 0.5,
                                 center: RotatedBox(quarterTurns: -1,child: Column(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Image.asset("assets/images/devices/temp degree.png"
                                     ,height: MediaQuery.of(context).size.height*.035,
                                     ),
                                     SizedBox(height: 3,),
                                     Text("${deviceProvider.roomDevices[deviceProvider.SelectedIndex].switch1} C",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)
                                   ],
                                 )),
                                 backgroundColor: Colors.black12,
                                 fillColor: Colors.white,
                                 progressColor: Colors.black12,
                                 arcBackgroundColor: Color(AppTheme.yellowColor),
                                 arcType: ArcType.FULL,

                               ),
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                   Container(
                     height: MediaQuery.of(context).size.height*.21,
                     width: MediaQuery.of(context).size.width*.38,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       color: Colors.white,
                       boxShadow: [
                         BoxShadow(
                           color: Colors.grey.withOpacity(0.05),
                           spreadRadius: 1,
                           blurRadius:1,
                           offset: Offset(3, 3), // changes position of shadow
                         ),
                         BoxShadow(
                           color: Colors.grey.withOpacity(0.05),
                           spreadRadius: 1,
                           blurRadius: 1,
                           offset: Offset(-3, -3), // changes position of shadow
                         ),
                       ],
                     ),
                     child:  Column(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         Container(
                             padding: EdgeInsets.only(
                                 top: MediaQuery.of(context).size.height*.01
                             ),
                             child: Text(translator.translate('Humidity'),style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,),)),
                         Container(
                           padding: EdgeInsets.only(
                               bottom: MediaQuery.of(context).size.height*.01
                           ),
                           child: RotatedBox(
                             quarterTurns: 1,
                             child: ClipRRect(
                               borderRadius: BorderRadius.all(Radius.circular(1000)),
                               child: new CircularPercentIndicator(
                                 radius: MediaQuery.of(context).size.height*.12,
                                 lineWidth: 7,
                                 percent: 0.5,
                                 center: RotatedBox(quarterTurns: -1,child: Column(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Image.asset("assets/images/Vector.png"
                                       ,height: MediaQuery.of(context).size.height*.035,
                                     ),
                                     SizedBox(height: 3,),
                                     Text("${deviceProvider.roomDevices[deviceProvider.SelectedIndex].switch2} %",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)
                                   ],
                                 )),
                                 backgroundColor: Colors.black12,
                                 fillColor: Colors.white,
                                 progressColor: Colors.black12,
                                 arcBackgroundColor: Color(AppTheme.primaryColor),
                                 arcType: ArcType.FULL,

                               ),
                             ),
                           ),
                         ),
                       ],
                     ),
                   )
                 ],
               )
             ],
           ),
         ),
          SizedBox(height: MediaQuery.of(context).size.height*.02,),
          Container(
            height: MediaQuery.of(context).size.height*.32,
            width: MediaQuery.of(context).size.width*.9,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black12,width: 1),
                color: Color(0xffecedf2)
            ),
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width*.02,
              right: MediaQuery.of(context).size.width*.02,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(translator.translate('Temperature & Humidity Event'),style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                    Switch(value:deviceProvider.roomDevices[deviceProvider.SelectedIndex].eventAction==null?false:deviceProvider.roomDevices[deviceProvider.SelectedIndex].eventAction=="1"?true:false,
                      onChanged: (value)
                      {
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
                      },)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*.24,
                      width: MediaQuery.of(context).size.width*.38,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.05),
                            spreadRadius: 1,
                            blurRadius:1,
                            offset: Offset(3, 3), // changes position of shadow
                          ),
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.05),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(-3, -3), // changes position of shadow
                          ),
                        ],
                      ),
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width*.03,
                        right: MediaQuery.of(context).size.width*.03,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*.00,top: MediaQuery.of(context).size.height*.02 ),
                              child: Text(translator.translate('Temperatur'),style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),)),
                          Container(
                            height: MediaQuery.of(context).size.height*.06,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(translator.translate('Switch'),style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                                SizedBox(width: 10,),
                                Container(
                                  height: MediaQuery.of(context).size.height*.06,
                                  child:  FlutterSwitch(
                                      height: 15.0,
                                      width: 35.0,
                                      padding: 4.0,
                                      toggleSize: 9.0,
                                      borderRadius: 10.0,
                                      activeColor: Color(AppTheme.primaryColor),
                                      value: deviceProvider.roomDevices[deviceProvider.SelectedIndex].relay2==null?false:deviceProvider.roomDevices[deviceProvider.SelectedIndex].relay2=="1"?true:false,
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
                                      }
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  if(int.parse(deviceProvider.roomDevices[deviceProvider.SelectedIndex].eventValue)>0){
                                    setState(() {
                                      deviceProvider.roomDevices[deviceProvider.SelectedIndex].eventValue=(int.parse( deviceProvider.roomDevices[deviceProvider.SelectedIndex].eventValue)-1).toString();
                                    });
                                  //  deviceProvider.UpdateDeviceData(deviceProvider.roomDevices[deviceProvider.SelectedIndex]);
                                  }
                                },
                                child: Container(
                                  height: 23,width:26,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color(AppTheme.yellowColor)
                                  ),
                                  alignment: Alignment.center,
                                  child: Image.asset("assets/images/bottom.png",
                                    height: 13,width:18,fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Text(deviceProvider.roomDevices[deviceProvider.SelectedIndex].eventValue,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,height: 1.4),),
                              GestureDetector(
                                onTap: (){

                                    setState(() {
                                      deviceProvider.roomDevices[deviceProvider.SelectedIndex].eventValue=(int.parse( deviceProvider.roomDevices[deviceProvider.SelectedIndex].eventValue)+1).toString();
                                    });
                                    //deviceProvider.UpdateDeviceData(deviceProvider.roomDevices[deviceProvider.SelectedIndex]);
                                  },
                                child: Container(
                                  height: 23,width:26,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color(AppTheme.yellowColor)
                                  ),
                                  alignment: Alignment.center,
                                  child: Image.asset("assets/images/top.png",
                                    height: 13,width:18,fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          GestureDetector(
                            onTap: (){
                              deviceProvider.UpdateDeviceData(deviceProvider.roomDevices[deviceProvider.SelectedIndex]);
                            },
                            child: Container(
                              width: 45,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(AppTheme.yellowColor)
                              ),
                              alignment: Alignment.center,
                              child: Text(translator.translate('Ok'),style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
                            ),
                          ),
                          SizedBox(height: 10,),

                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*.24,
                      width: MediaQuery.of(context).size.width*.38,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.05),
                            spreadRadius: 1,
                            blurRadius:1,
                            offset: Offset(3, 3), // changes position of shadow
                          ),
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.05),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(-3, -3), // changes position of shadow
                          ),
                        ],
                      ),
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width*.03,
                        right: MediaQuery.of(context).size.width*.03,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*.00,top: MediaQuery.of(context).size.height*.02 ),
                              child: Text(translator.translate('Humidity'),style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),)),
                          Container(
                            height: MediaQuery.of(context).size.height*.06,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(translator.translate('Switch'),style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                                SizedBox(width: 10,),
                                Container(
                                  height: MediaQuery.of(context).size.height*.06,
                                  child:  FlutterSwitch(
                                      height: 15.0,
                                      width: 35.0,
                                      padding: 4.0,
                                      toggleSize: 9.0,
                                      borderRadius: 10.0,
                                      activeColor: Color(AppTheme.primaryColor),
                                      value: deviceProvider.roomDevices[deviceProvider.SelectedIndex].relay3==null?false:deviceProvider.roomDevices[deviceProvider.SelectedIndex].relay3=="1"?true:false,
                                      onToggle: (value) {
                                        if(deviceProvider.roomDevices[deviceProvider.SelectedIndex].relay3=="1"){
                                          deviceProvider.roomDevices[deviceProvider.SelectedIndex].relay3="0";
                                          setState(() {
                                          });
                                        }
                                        else{
                                          deviceProvider.roomDevices[deviceProvider.SelectedIndex].relay3="1";
                                          setState(() {
                                          });
                                        }
                                        deviceProvider.UpdateDeviceData(deviceProvider.roomDevices[deviceProvider.SelectedIndex]);
                                      }
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  if(int.parse(deviceProvider.roomDevices[deviceProvider.SelectedIndex].eventValue2)>0){
                                    setState(() {
                                      deviceProvider.roomDevices[deviceProvider.SelectedIndex].eventValue2=(int.parse(deviceProvider.roomDevices[deviceProvider.SelectedIndex].eventValue2)-1).toString();
                                    });

                                   // deviceProvider.UpdateDeviceData(deviceProvider.roomDevices[deviceProvider.SelectedIndex]);
                                  }
                                },
                                child: Container(
                                  height: 23,width:26,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color(AppTheme.yellowColor)
                                  ),
                                  alignment: Alignment.center,
                                  child: Image.asset("assets/images/bottom.png",
                                    height: 13,width:18,fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Text(deviceProvider.roomDevices[deviceProvider.SelectedIndex].eventValue2??"0",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,height: 1.4),),
                              GestureDetector(
                                onTap: (){

                                  setState(() {
                                    deviceProvider.roomDevices[deviceProvider.SelectedIndex].eventValue2=(int.parse( deviceProvider.roomDevices[deviceProvider.SelectedIndex].eventValue2??"0")+1).toString();
                                  });
                                  //deviceProvider.UpdateDeviceData(deviceProvider.roomDevices[deviceProvider.SelectedIndex]);
                                },
                                child: Container(
                                  height: 23,width:26,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color(AppTheme.yellowColor)
                                  ),
                                  alignment: Alignment.center,
                                  child: Image.asset("assets/images/top.png",
                                    height: 13,width:18,fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          GestureDetector(
                            onTap: (){
                              deviceProvider.UpdateDeviceData(deviceProvider.roomDevices[deviceProvider.SelectedIndex]);
                            },
                            child: Container(
                              width: 45,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(AppTheme.yellowColor)
                              ),
                              alignment: Alignment.center,
                              child: Text(translator.translate('Ok'),style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
                            ),
                          ),
                          SizedBox(height: 10,),

                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}