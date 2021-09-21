import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';

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
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width*.05,
        right: MediaQuery.of(context).size.width*.05,
      ),
      child: Column(
        children: [
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
               Text("Door",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
               SizedBox(height: MediaQuery.of(context).size.height*.01,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                   Column(
                     children: [
                       GestureDetector(
                         onTap: (){
                           setState(() {
                             openDoor=true;
                           });
                         },
                         child: Row(
                           children: [
                             openDoor?Icon(Icons.check_circle_outline,size: 21,color: Color(AppTheme.yellowColor),):Icon(Icons.circle_outlined,color: Colors.black26,size: 21),
                             SizedBox(width: 8,),
                             Text("Open",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)
                           ],
                         ),
                       ),
                       SizedBox(height: 8,),
                       GestureDetector(
                         onTap: (){
                           setState(() {
                             openDoor=false;
                           });
                         },
                         child: Row(
                           children: [
                            openDoor? Icon(Icons.circle_outlined,color: Colors.black26,size: 21):
                            Icon(Icons.check_circle_outline,size: 21,color: Color(AppTheme.yellowColor),),
                             SizedBox(width: 8,),
                             Text("Close",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)
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
                     Text("Safe mode is active"),
                     FlutterSwitch(
                       height: 15.0,
                       width: 35.0,
                       padding: 4.0,
                       toggleSize: 9.0,
                       borderRadius: 10.0,
                       activeColor: Color(AppTheme.primaryColor),
                       value: true,
                       onToggle: (value) {
                         setState(() {

                         });
                       },
                     )
                   ],
                 ),
               )
             ],
           ),
         ),
          SizedBox(height: 10,),
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
                Text("Window",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                SizedBox(height: MediaQuery.of(context).size.height*.01,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              openWindow=true;
                            });
                          },
                          child: Row(
                            children: [
                              openWindow?Icon(Icons.check_circle_outline,size: 21,color: Color(AppTheme.yellowColor),)
                                  :Icon(Icons.circle_outlined,color: Colors.black26,size: 21),
                              SizedBox(width: 8,),
                              Text("Open",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                        SizedBox(height: 8,),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              openWindow=false;
                            });
                          },
                          child: Row(
                            children: [
                              openWindow? Icon(Icons.circle_outlined,color: Colors.black26,size: 21):Icon(Icons.check_circle_outline,size: 21,color: Color(AppTheme.yellowColor),),
                              SizedBox(width: 8,),
                              Text("Close",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)
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
                      Text("Safe mode is active"),
                      FlutterSwitch(
                        height: 15.0,
                        width: 35.0,
                        padding: 4.0,
                        toggleSize: 9.0,
                        borderRadius: 10.0,
                        activeColor: Color(AppTheme.primaryColor),
                        value: true,
                        onToggle: (value) {
                          setState(() {

                          });
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}