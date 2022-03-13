import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Base/shared_preference_manger.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/About.dart';
import 'package:fssmarthome/Views/Home.dart';
import 'package:fssmarthome/Views/Setting.dart';
import 'package:fssmarthome/Views/Timing.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import 'Custom/GlobalFunction.dart';

class MyDrawer extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<MyDrawer>{
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:translator.currentLanguage == 'ar' ?  TextDirection.rtl : TextDirection.ltr,
      child: Container(
        width: MediaQuery.of(context).size.width*.7,
        height: MediaQuery.of(context).size.height,
        color: Color(AppTheme.primaryColor),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*.12,),
            GestureDetector(
              onTap: (){
                Navigator.pushNamedAndRemoveUntil(context,"/profile", (route) => false);
              },
              child: Container(
                width: MediaQuery.of(context).size.width*.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ImageIcon(AssetImage("assets/images/barIcons/user (1).png"),color: Colors.white,size: 22),
                    SizedBox(width: 10,),
                    Padding(
                      padding:  EdgeInsets.only(top: 7),
                      child: Text(translator.translate('Profile'),style: TextStyle(color: Colors.white),),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.05,),
            Container(
              width: MediaQuery.of(context).size.width*.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImageIcon(AssetImage("assets/images/barIcons/inside 1.png"),color: Colors.white,size: 22,),
                  SizedBox(width: 10,),
                  Padding(
                    padding:  EdgeInsets.only(top: 7),
                    child: Text(translator.translate('InsideControl'),style: TextStyle(color: Colors.white),),
                  )
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.05,),
            Container(
              width: MediaQuery.of(context).size.width*.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImageIcon(AssetImage("assets/images/barIcons/outside 1.png"),color: Colors.white,size: 22,),
                  SizedBox(width: 10,),
                  Padding(
                    padding:  EdgeInsets.only(top: 7),
                    child: Text(translator.translate('OutsideControl'),style: TextStyle(color: Colors.white),),
                  )
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.05,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, GlobalFunction.route(Timing()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width*.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ImageIcon(AssetImage("assets/images/barIcons/timing.png"),color: Colors.white,size: 22,),
                    SizedBox(width: 10,),
                    Padding(
                      padding:  EdgeInsets.only(top: 7),
                      child: Text(translator.translate('Timing'),style: TextStyle(color: Colors.white),),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.05,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, GlobalFunction.route(About()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width*.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ImageIcon(AssetImage("assets/images/barIcons/about.png"),color: Colors.white,size: 22,),
                    SizedBox(width: 10,),
                    Padding(
                      padding:  EdgeInsets.only(top: 7),
                      child: Text(translator.translate("About"),style: TextStyle(color: Colors.white),),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.05,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, GlobalFunction.route(Setting()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width*.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.settings,color: Colors.white,),
                    SizedBox(width: 10,),
                    Padding(
                      padding:  EdgeInsets.only(top: 7),
                      child: Text(translator.translate('Setting'),style: TextStyle(color: Colors.white),),
                    )
                  ],
                ),
              ),
            ),
            Expanded(child: SizedBox()),
            GestureDetector(
              onTap: (){
                SharedPreferenceManager.logout();
                Navigator.pushNamedAndRemoveUntil(context,"/login", (route) => false);
              },
              child: Container(
                width: MediaQuery.of(context).size.width*.5,
                height: MediaQuery.of(context).size.height*.065,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(AppTheme.yellowColor)
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ImageIcon(AssetImage("assets/images/barIcons/logout.png"),color: Colors.white,size: 22,),
                    SizedBox(width: 15,),
                    Padding(
                      padding:  EdgeInsets.only(top: 7),
                      child: Text(translator.translate('Logout'),style: TextStyle(color: Colors.white),),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.07,),
          ],
        ),
      ),
    );
  }
}