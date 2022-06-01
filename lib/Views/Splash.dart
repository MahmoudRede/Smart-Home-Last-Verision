import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fssmarthome/Base/Cash_Helper/cash_helper.dart';
import 'package:fssmarthome/Base/shared_preference_manger.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/Login.dart';
import 'package:fssmarthome/Views/user_screen.dart';
import 'package:fssmarthome/main.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Provider/AuthProvider.dart';

class Splash extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<Splash>{
   String? user_id;
   String? lang;
  loadData()async{
   user_id=await SharedPreferenceManager.getData("id");
   lang=await SharedPreferenceManager.getData("lang");
   MyApp.user_name=(await SharedPreferenceManager.getData("name"))??"";
   setState(() {
     MyApp.user_id=int.parse(user_id!);
   });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeLang("en");
    loadData();
  }

   void changeLang(String lang) async {
     SharedPreferences pref =await SharedPreferences.getInstance();
     setState(() {
       translator.setNewLanguage(
         context,
         newLanguage: '${lang}',
         remember: true,
         restart: false,
       );
       //StaticData.language = lang == 'ar' ? 'العربية' : 'English';
     });
     pref.setString("lang", lang);
     MyApp.setLocale(context, Locale('${lang}'));

   }

  @override
  Widget build(BuildContext context) {
    final authProvider= Provider.of<AuthProvider>(context, listen: false);

    Timer(Duration(seconds: 3), (){
      if(CashHelper.getData(key: 'isUser')==null){
        Navigator.of(context)

            .pushNamedAndRemoveUntil(user_id!=null?"/mainPage":"/login",
                (Route<dynamic> route) => false);
      }
      else{
        if(user_id!=null){
          Navigator.push(context, MaterialPageRoute(builder: (_){
            return UserScreen();

          }));
        }
        else{
          Navigator.push(context, MaterialPageRoute(builder: (_){
            return Login();

          }));
        }
      }


      // Phoenix.rebirth(context);
    });
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
        elevation: 0,
        backwardsCompatibility: false,
         systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
           statusBarColor: Color(AppTheme.primaryColor)
         ),

      ),
      backgroundColor: Color(AppTheme.primaryColor),
      body: Container(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width*.2,
          right: MediaQuery.of(context).size.width*.2,
        ),
        child: Center(
          child:Image.asset("assets/images/logo/logo2.png",
            width: MediaQuery.of(context).size.width*.7,
            fit: BoxFit.cover,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}