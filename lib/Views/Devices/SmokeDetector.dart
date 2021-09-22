import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SmokeDetector extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<SmokeDetector>{
  int degree=5;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                            child: Text("Smoke detector value",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)),
                        FlutterSwitch(
                          height: 15.0,
                          width: 30.0,
                          padding: 4.0,
                          toggleSize: 9.0,
                          borderRadius: 10.0,
                          inactiveColor: Colors.white,
                          inactiveToggleColor: Colors.black26,
                          activeColor: Color(AppTheme.primaryColor),
                          value:true,
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
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*.43,
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width*.43-30,
                            child: Text("Smoke detector Event",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)),
                        FlutterSwitch(
                          height: 15.0,
                          width: 30.0,
                          padding: 4.0,
                          toggleSize: 9.0,
                          borderRadius: 10.0,
                          inactiveColor: Colors.white,
                          inactiveToggleColor: Colors.black26,
                          activeColor: Color(AppTheme.primaryColor),
                          value:true,
                          onToggle: (value) {
                            setState(() {

                            });
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
                      Image.asset("assets/images/devices/smoke-degree.png"
                        ,height: MediaQuery.of(context).size.height*.035,
                      ),
                      SizedBox(height: 5,),
                      Text("40%",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)
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
                    SizedBox(height:MediaQuery.of(context).size.height*.055,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            if(degree>0){
                              setState(() {
                                degree--;
                              });
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
                        Text(degree.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,height: 1.4),),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              degree++;
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FlutterSwitch(
                          height: 15.0,
                          width: 30.0,
                          padding: 4.0,
                          toggleSize: 9.0,
                          borderRadius: 10.0,
                          inactiveColor: Colors.white,
                          inactiveToggleColor: Colors.black26,
                          activeColor: Color(AppTheme.primaryColor),
                          value:true,
                          onToggle: (value) {
                            setState(() {

                            });
                          },
                        )
                      ],),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}