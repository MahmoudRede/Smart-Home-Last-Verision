import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fssmarthome/Provider/DeviceProvider.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

class SwitchDevice extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<SwitchDevice>{
  @override
  Widget build(BuildContext context) {
    var deviceProvider= Provider.of<DeviceProvider>(context, listen: true);
    return Directionality(
      textDirection:translator.currentLanguage == 'ar' ?  TextDirection.rtl : TextDirection.ltr,
      child: Container(
        width: MediaQuery.of(context).size.width,
         padding: EdgeInsets.only(
           left: MediaQuery.of(context).size.width*.05,
           right: MediaQuery.of(context).size.width*.05,
         ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(translator.translate('Switch')+" ${deviceProvider.roomDevices[deviceProvider.SelectedIndex].reading} Channel",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
             SizedBox(height: MediaQuery.of(context).size.height*.03,),
             GridView.builder(
               padding: EdgeInsets.only(
                   left: MediaQuery.of(context).size.width * .03,
                   right: MediaQuery.of(context).size.width * .03),
               primary: false,
               shrinkWrap: true,
               itemCount: int.parse(deviceProvider.roomDevices[deviceProvider.SelectedIndex].reading),
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 2,
                   mainAxisSpacing: 10,
                   crossAxisSpacing: 10,
                   childAspectRatio: 1 / .6),
               itemBuilder: (context, index) {
                 return Container(
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.all(Radius.circular(10)),
                     color: Colors.white,
                   ),
                   padding: EdgeInsets.only(
                       left: MediaQuery.of(context).size.width*.02,
                       right: MediaQuery.of(context).size.width*.02,
                       bottom: MediaQuery.of(context).size.height*.01
                   ),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       SizedBox(height: 5,),
                       Text(translator.translate('device')+(index+1).toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           Text(translator.translate('On'),style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,height: 1.5),),
                           SizedBox(width: MediaQuery.of(context).size.width*.05,),
                           FlutterSwitch(
                             height: 15.0,
                             width: 35.0,
                             padding: 4.0,
                             toggleSize: 9.0,
                             borderRadius: 10.0,
                             activeColor: Color(AppTheme.yellowColor),
                             value: index==0?deviceProvider.roomDevices[deviceProvider.SelectedIndex].relay=="1"?true:false:index==1?deviceProvider.roomDevices[deviceProvider.SelectedIndex].relay2=="1"?true:false:index==2?deviceProvider.roomDevices[deviceProvider.SelectedIndex].relay3=="1"?true:false:deviceProvider.roomDevices[deviceProvider.SelectedIndex].relay4=="1"?true:false,
                             onToggle: (value) {
                               if(index==0){
                                 print("0000000000000000000000000000000000000000000000000000000000000000");
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
                               }
                               else if(index==1){
                                 print("11111111111111111111111111111111111111111111");
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
                               }else if(index==2){
                                 print("222222222222222222222222222222222222222222222222222");
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
                               }else {
                                 print("33333333333333333333333333333333333333333333333333333333");
                                 if(deviceProvider.roomDevices[deviceProvider.SelectedIndex].relay4=="1"){
                                   deviceProvider.roomDevices[deviceProvider.SelectedIndex].relay4="0";
                                   setState(() {
                                   });
                                 }
                                 else{
                                   deviceProvider.roomDevices[deviceProvider.SelectedIndex].relay4="1";
                                   setState(() {
                                   });
                                 }
                                 deviceProvider.UpdateDeviceData(deviceProvider.roomDevices[deviceProvider.SelectedIndex]);
                               }
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
    );
  }
}