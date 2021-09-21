import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';

class Motion extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<Motion>{
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
          SizedBox( height: MediaQuery.of(context).size.height*.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Event Action",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Color(AppTheme.yellowColor)),),
              SizedBox(width:MediaQuery.of(context).size.width*.05 ,),
              Switch(value: true, onChanged: (val){})
            ],
          ),
          SizedBox( height: MediaQuery.of(context).size.height*.035),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width*.06,
                height: MediaQuery.of(context).size.width*.06,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  color: Color(AppTheme.primaryColor)
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*.045,
                height: MediaQuery.of(context).size.width*.045,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Color(AppTheme.primaryColor).withOpacity(.5)
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*.04,
                height: MediaQuery.of(context).size.width*.04,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Color(AppTheme.primaryColor).withOpacity(.2)
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*.42,
                height: MediaQuery.of(context).size.width*.42,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Color(AppTheme.primaryColor),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(3, 3), // changes position of shadow
                    ),
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(-3, -3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/devices/motion-yes.png",
                      width: MediaQuery.of(context).size.width*.12,
                      height: MediaQuery.of(context).size.width*.12,
                    ),
                    SizedBox(height:MediaQuery.of(context).size.width*.02,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Moverment : ",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
                        Text("Yes",style: TextStyle(color: Color(AppTheme.yellowColor),fontSize: 12,fontWeight: FontWeight.bold))
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*.04,
                height: MediaQuery.of(context).size.width*.04,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Color(AppTheme.primaryColor).withOpacity(.2)
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*.045,
                height: MediaQuery.of(context).size.width*.045,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Color(AppTheme.primaryColor).withOpacity(.5),

                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*.06,
                height: MediaQuery.of(context).size.width*.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Color(AppTheme.primaryColor)
                ),
              ),
            ],
          ),
          SizedBox( height: MediaQuery.of(context).size.height*.035),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Device Action",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              SizedBox(width:MediaQuery.of(context).size.width*.05 ,),
              FlutterSwitch(
                height: 16.0,
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
          ),
          SizedBox( height: MediaQuery.of(context).size.height*.02),

        ],
      ),
    );
  }
}