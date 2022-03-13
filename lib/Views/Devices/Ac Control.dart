import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';

class AcControl extends StatefulWidget {
  @override
  _AcControlState createState() => _AcControlState();
}
class _AcControlState extends State<AcControl> {
  @override
  Widget build(BuildContext context) {
    return  Container(
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
              Text("Ac Control",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Color(AppTheme.yellowColor)),),
              SizedBox(width:MediaQuery.of(context).size.width*.05 ,),
              Switch(value: true, onChanged: (val){})
            ],
          ),
          SizedBox( height: MediaQuery.of(context).size.height*.035),
          SizedBox( height: MediaQuery.of(context).size.height*.02),

        ],
      ),
    );
  }
}
