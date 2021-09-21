import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';

class AddAlarm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<AddAlarm>{
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.transparent.withOpacity(.5),
       body: Container(
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
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Row(
               children: [
                 Container(
                   width: MediaQuery.of(context).size.width*.2,
                   child: Column(
                     children: [
                       Divider(color: Color(AppTheme.yellowColor),thickness: 2,),
                       Container(
                         height: MediaQuery.of(context).size.height*.06,
                       ),
                       Divider(color: Color(AppTheme.yellowColor),thickness: 2,),
                     ],
                   ),
                 ),
                 Container(
                  height: MediaQuery.of(context).size.height*.4,
                 )
               ],
             )
           ],
         ),
       ),
     );
  }
}