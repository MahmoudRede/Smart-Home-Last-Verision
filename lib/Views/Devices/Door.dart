import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fssmarthome/Provider/DeviceProvider.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

class Door extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<Door>{
  bool openDoor=true;
  bool openWindow=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var deviceProvider= Provider.of<DeviceProvider>(context, listen: false);
    print(deviceProvider.roomDevices[deviceProvider.SelectedIndex].device.id);
    print(deviceProvider.roomDevices[deviceProvider.SelectedIndex].id);
    print(deviceProvider.roomDevices[deviceProvider.SelectedIndex].active);
    print(deviceProvider.roomDevices[deviceProvider.SelectedIndex].reading);
  print(    deviceProvider.roomDevices[deviceProvider.SelectedIndex].doorType);
    print("ssssssssssssssssssssssssssssssssssssssssssssssss");
  }
  @override
  Widget build(BuildContext context) {
    var deviceProvider= Provider.of<DeviceProvider>(context, listen: true);
    return Directionality(
      textDirection:translator.currentLanguage == 'ar' ?  TextDirection.rtl : TextDirection.ltr,
      child: Container(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width*.05,
          right: MediaQuery.of(context).size.width*.05,
        ),
        child: Column(
          children: [
            deviceProvider.roomDevices[deviceProvider.SelectedIndex].doorType=="0"?
            Container(
             width: MediaQuery.of(context).size.width*.9,
             height: MediaQuery.of(context).size.height*.33,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.all(Radius.circular(10)),
               color: Colors.white,
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
             ),
             padding: EdgeInsets.only(
               left: MediaQuery.of(context).size.width*.05,
               right: MediaQuery.of(context).size.width*.05
             ),
             child: Column(
               children: [
                 SizedBox(height: MediaQuery.of(context).size.height*.02,),
                 Text(translator.translate('door'),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                 SizedBox(height: MediaQuery.of(context).size.height*.01,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     Column(
                       children: [
                         GestureDetector(
                           onTap: (){
                             deviceProvider.roomDevices[deviceProvider.SelectedIndex].reading="1";
                             setState(() {
                             });
                             deviceProvider.UpdateDeviceData(deviceProvider.roomDevices[deviceProvider.SelectedIndex]);
                           },
                           child: Row(
                             children: [
                               deviceProvider.roomDevices[deviceProvider.SelectedIndex].reading=="1"?Icon(Icons.check_circle_outline,size: 21,color: Color(AppTheme.yellowColor),):Icon(Icons.circle_outlined,color: Colors.black26,size: 21),
                               SizedBox(width: 8,),
                               Text(translator.translate('Open'),style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)
                             ],
                           ),
                         ),
                         SizedBox(height: 8,),
                         GestureDetector(
                           onTap: (){
                             deviceProvider.roomDevices[deviceProvider.SelectedIndex].reading="0";
                             setState(() {
                             });
                             deviceProvider.UpdateDeviceData(deviceProvider.roomDevices[deviceProvider.SelectedIndex]);
                           },
                           child: Row(
                             children: [
                               deviceProvider.roomDevices[deviceProvider.SelectedIndex].reading!="0"? Icon(Icons.circle_outlined,color: Colors.black26,size: 21):
                              Icon(Icons.check_circle_outline,size: 21,color: Color(AppTheme.yellowColor),),
                               SizedBox(width: 8,),
                               Text(translator.translate('Close'),style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)
                             ],
                           ),
                         )
                       ],
                     ),
                     Image.asset("assets/images/Door.png",
                     width: MediaQuery.of(context).size.width*.35,
                     height: MediaQuery.of(context).size.height*.2,
                     )
                   ],
                 ),
                 SizedBox(height: MediaQuery.of(context).size.height*.01,),
                 Container(
                   height: MediaQuery.of(context).size.height*.04,
                   padding: EdgeInsets.only(
                       left:MediaQuery.of(context).size.width*.05,
                       right: MediaQuery.of(context).size.width*.05
                   ),
                   width: MediaQuery.of(context).size.width,
                   child:  Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(translator.translate('Safemodeisactive')),
                       FlutterSwitch(
                         height: 15.0,
                         width: 35.0,
                         padding: 4.0,
                         toggleSize: 9.0,
                         borderRadius: 10.0,
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
           ):SizedBox(),
            SizedBox(height: 10,),
            deviceProvider.roomDevices[deviceProvider.SelectedIndex].doorType=="1"?
            Container(
              width: MediaQuery.of(context).size.width*.9,
              height: MediaQuery.of(context).size.height*.33,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
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
              ),
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width*.05,
                  right: MediaQuery.of(context).size.width*.05
              ),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  Text(translator.translate('Window'),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                  SizedBox(height: MediaQuery.of(context).size.height*.01,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: (){
                              deviceProvider.roomDevices[deviceProvider.SelectedIndex].reading="1";
                              setState(() {
                              });
                              deviceProvider.UpdateDeviceData(deviceProvider.roomDevices[deviceProvider.SelectedIndex]);
                            },
                            child: Row(
                              children: [
                                deviceProvider.roomDevices[deviceProvider.SelectedIndex].reading=="1"?Icon(Icons.check_circle_outline,size: 21,color: Color(AppTheme.yellowColor),):Icon(Icons.circle_outlined,color: Colors.black26,size: 21),
                                SizedBox(width: 8,),
                                Text(translator.translate('Open'),style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                          SizedBox(height: 8,),
                          GestureDetector(
                            onTap: (){
                              deviceProvider.roomDevices[deviceProvider.SelectedIndex].reading="0";
                              setState(() {
                              });
                              deviceProvider.UpdateDeviceData(deviceProvider.roomDevices[deviceProvider.SelectedIndex]);
                            },
                            child: Row(
                              children: [
                                deviceProvider.roomDevices[deviceProvider.SelectedIndex].reading!="0"? Icon(Icons.circle_outlined,color: Colors.black26,size: 21):
                                Icon(Icons.check_circle_outline,size: 21,color: Color(AppTheme.yellowColor),),
                                SizedBox(width: 8,),
                                Text(translator.translate('Close'),style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)
                              ],
                            ),
                          )
                        ],
                      ),
                      Image.asset("assets/images/windows.png",
                        width: MediaQuery.of(context).size.width*.35,
                        height: MediaQuery.of(context).size.height*.2,
                      )
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.01,),
                  Container(
                    height: MediaQuery.of(context).size.height*.04,
                    padding: EdgeInsets.only(
                        left:MediaQuery.of(context).size.width*.05,
                        right: MediaQuery.of(context).size.width*.05
                    ),
                    width: MediaQuery.of(context).size.width,
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(translator.translate('Safemodeisactive')),
                        FlutterSwitch(
                          height: 15.0,
                          width: 35.0,
                          padding: 4.0,
                          toggleSize: 9.0,
                          borderRadius: 10.0,
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
            ):SizedBox(),
          ],
        ),
      ),
    );
  }
}