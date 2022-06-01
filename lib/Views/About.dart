import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/Custom/CustomAppBar.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class About extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<About>{
  @override
  Widget build(BuildContext context) {
     return SafeArea(child: Scaffold(
      backgroundColor: Color(AppTheme.backGround),
      body: Directionality(
        textDirection:translator.currentLanguage == 'ar' ?  TextDirection.rtl : TextDirection.ltr,
        child: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width*.05,
              right: MediaQuery.of(context).size.width*.05
               ),
            child: Column(
              children: [
                CustomAppBar(title:translator.translate('About')),
                SizedBox(height: MediaQuery.of(context).size.height*.01,),
                Image.asset("assets/images/logo/logo2.png",
                  height: MediaQuery.of(context).size.height*.23,
                  fit: BoxFit.cover,
                ),
                Text("Future Scrollation",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                SizedBox(height: MediaQuery.of(context).size.height*.03,),
                Container(
                  width: MediaQuery.of(context).size.width*.9,
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height*.04,
                    bottom: MediaQuery.of(context).size.height*.03,
                    left: MediaQuery.of(context).size.width*.035,
                    right: MediaQuery.of(context).size.width*.035,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                  ),
                  child: Column(
                    children: [
                     Text("We always strive to advance in the field of technology and keep pace with the times and strive for luxury and prosperity and make life easier for users and make their lives better by controlling their homes or places with ease by just pressing a button. Our system can be applied in homes, institutions and every place that contains electrical devices to facilitate the process Control and provide security and safety for them and help the elderly and people with diseases to control easily in their home while they are in their places and protect people and institutions from accidents and disasters, not only providing them with well-being, but also providing safety for users, so our motto is comfort.",
                         textAlign: TextAlign.center,),
                      SizedBox(height: MediaQuery.of(context).size.height*.04,),
                      Icon(Icons.phone,size: 30,color: Color(AppTheme.yellowColor)),
                      Text("01000458785",style: TextStyle(color: Color(AppTheme.yellowColor)),)
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*.05,),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}