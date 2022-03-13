import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Provider/DeviceProvider.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
class AddAlarm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<AddAlarm>{
  var _dateTime;
  bool loading=false;
  @override
  Widget build(BuildContext context) {
    var deviceProvider= Provider.of<DeviceProvider>(context, listen: true);
     return Scaffold(
       backgroundColor: Colors.transparent.withOpacity(.5),
       body: Directionality(
         textDirection:translator.currentLanguage == 'ar' ?  TextDirection.rtl : TextDirection.ltr,
         child: Container(
           height: MediaQuery.of(context).size.height*.6,
           width: MediaQuery.of(context).size.width*.9,
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(10),
             color: Colors.white,
           ),
           margin: EdgeInsets.only(
             top: MediaQuery.of(context).size.height*.2,
             bottom: MediaQuery.of(context).size.height*.02,
             left: MediaQuery.of(context).size.width*.05,
             right: MediaQuery.of(context).size.width*.05
           ),
           padding: EdgeInsets.only(
               left: MediaQuery.of(context).size.width*.05,
               right: MediaQuery.of(context).size.width*.05
           ),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               TimePickerSpinner(
                 is24HourMode: false,
                 normalTextStyle: TextStyle(
                     fontSize: 24,
                     color: Colors.black
                 ),
                 highlightedTextStyle: TextStyle(
                     fontSize: 24,
                     color: Color(AppTheme.yellowColor)
                 ),
                 spacing: 50,
                 itemHeight: 80,
                 isForce2Digits: true,
                 onTimeChange: (time) {
                   setState(() {
                     _dateTime = time;
                   });
                 },
               ),
               GestureDetector(
                 onTap: ()async{
                   print(_dateTime);
                   setState(() {
                     loading=true;
                   });
                 await  deviceProvider.addAlarm(deviceProvider.roomDevices[deviceProvider.SelectedIndex].id, _dateTime.toString().substring(11,16), "1");
                 deviceProvider.getAlarms(deviceProvider.roomDevices[deviceProvider.SelectedIndex].id);
                   setState(() {
                     loading=false;
                   });
                   Navigator.pop(context);
                 },
                 child: Container(
                   height: MediaQuery.of(context).size.height*.06,
                   width:MediaQuery.of(context).size.width*.5,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(20),
                     color:loading?Colors.black12: Color(AppTheme.yellowColor)
                   ),
                   alignment: Alignment.center,
                   child: Text(translator.translate('Add'),style: TextStyle(color: Colors.white),),
                 ),
               )
             ],
           ),
         ),
       ),
     );
  }
}