import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/Custom/GlobalFunction.dart';
import 'package:fssmarthome/Views/Devices/AddAlarm.dart';

class Alarm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<Alarm>{
  @override
  Widget build(BuildContext context) {
    return Container(
     width: MediaQuery.of(context).size.width*.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white
      ),
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width*.05,
        right: MediaQuery.of(context).size.width*.05
      ),
      child: Column(
        children: [
          SizedBox( height: MediaQuery.of(context).size.height*.01),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text("Alerm Clock",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
               Switch(value: true, onChanged: (val){})
             ],
           ),
          SizedBox( height: MediaQuery.of(context).size.height*.01),
          Container(
            child: ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            primary: false
            ,itemBuilder: (context,index){
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xffededed)
                ),
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width*.03,
                  right: MediaQuery.of(context).size.width*.03,
                  top: MediaQuery.of(context).size.height*.01,
                  bottom: MediaQuery.of(context).size.height*.01
                ),
                margin: EdgeInsets.only(
                  bottom: 10
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                   children: [
                     Container(
                       height: 35,width: 35,
                       padding: EdgeInsets.all(7),
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(100),
                           color: Colors.white
                       ),
                       child:index==0? Image.asset("assets/images/alarm 1.png"):Image.asset("assets/images/disable-alarm 1.png"),
                     ),
                     SizedBox(width: 7,),
                     Text("7:40 Am",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                   ],
                 ),
                    FlutterSwitch(
                      height: 15.0,
                      width: 35.0,
                      padding: 4.0,
                      toggleSize: 9.0,
                      borderRadius: 10.0,
                      inactiveColor: Colors.white,
                      inactiveToggleColor: Colors.black26,
                      activeColor: Color(AppTheme.yellowColor),
                      value: index==0?true:false,
                      onToggle: (value) {
                        setState(() {

                        });
                      },
                    )
                  ],
                ),
              );

            }),
          ),
          SizedBox( height: MediaQuery.of(context).size.height*.03),
          GestureDetector(
            onTap: (){
              Navigator.push(
                  context, GlobalFunction.routeBottom(AddAlarm()));
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(1000)),
                color: Color(AppTheme.yellowColor)
              ),
              child: Icon(Icons.add,size: 30,color: Colors.white,),
            ),
          ),
          SizedBox( height: MediaQuery.of(context).size.height*.03),
        ],
      ),
    );
  }
}