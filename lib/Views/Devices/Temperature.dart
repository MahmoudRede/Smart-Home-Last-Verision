import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Temperature extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<Temperature>{
  @override
  Widget build(BuildContext context) {
    return Column(
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
                 Text("Temperature & Humidity degrees",style: TextStyle(fontSize: 12),),
                 Switch(value: true, onChanged: (val){})
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
                           child: Text("Temperature",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,),)),
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
                                   Text("22 C",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)
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
                           child: Text("Humidity",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,),)),
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
                                   Text("40 %",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)
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
          height: MediaQuery.of(context).size.height*.28,
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
                  Text("Temperature & Humidity Event",style: TextStyle(fontSize: 12),),
                  Switch(value: true, onChanged: (val){})
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*.19,
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
                            padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*.02,top: MediaQuery.of(context).size.height*.02 ),
                            child: Text("Temperatur",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
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
                            Text("45",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,height: 1.4),),
                            Container(
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
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                height: MediaQuery.of(context).size.height*.07,
                                child:  FlutterSwitch(
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
                                ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*.19,
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
                            padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*.02,top: MediaQuery.of(context).size.height*.02 ),
                            child: Text("Humidity",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
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
                            Text("45",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,height: 1.4),),
                            Container(
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
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height*.07,
                              child:  FlutterSwitch(
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
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),

      ],
    );
  }
}