import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';

class SwitchDevice extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<SwitchDevice>{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
       padding: EdgeInsets.only(
         left: MediaQuery.of(context).size.width*.05,
         right: MediaQuery.of(context).size.width*.05,
       ),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text("Switch 4 Channel",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
           SizedBox(height: MediaQuery.of(context).size.height*.03,),
           GridView.builder(
             padding: EdgeInsets.only(
                 left: MediaQuery.of(context).size.width * .03,
                 right: MediaQuery.of(context).size.width * .03),
             primary: false,
             shrinkWrap: true,
             itemCount: 4,
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
                 mainAxisSpacing: 10,
                 crossAxisSpacing: 10,
                 childAspectRatio: 1 / 1.1),
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
                     Container(
                       width: MediaQuery.of(context).size.width*.15,
                       height: MediaQuery.of(context).size.height*.08,
                       margin: EdgeInsets.only(
                           top: MediaQuery.of(context).size.height*.01,
                           bottom: MediaQuery.of(context).size.height*.01
                       ),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.all(Radius.circular(10)),
                         border: Border.all(color: Colors.black12,width: 1),
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
                         color: Colors.white,
                       ),
                       padding: EdgeInsets.all(8),
                       child: Image.asset("assets/images/TV.png"),

                     ),
                     Text("TV",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,height: 1.4),),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         Text("On",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,height: 1.5),),
                         SizedBox(width: MediaQuery.of(context).size.width*.05,),
                         FlutterSwitch(
                           height: 15.0,
                           width: 35.0,
                           padding: 4.0,
                           toggleSize: 9.0,
                           borderRadius: 10.0,
                           activeColor: Color(AppTheme.yellowColor),
                           value: true,
                           onToggle: (value) {
                             setState(() {

                             });
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
    );
  }
}