import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/Custom/CustomAppBar.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import '../Provider/AuthProvider.dart';

class About extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<About>{
  @override
  Widget build(BuildContext context) {
    final authProvider= Provider.of<AuthProvider>(context, listen: true);
    return SafeArea(child: Scaffold(
      backgroundColor: Color(AppTheme.backGround),
      body: Directionality(
        textDirection:translator.currentLanguage == 'ar' ?  TextDirection.rtl : TextDirection.ltr,
        child: SingleChildScrollView(
          child: authProvider.aboutEn==null || authProvider.aboutAr ==null  ?
          Container(
            width: double.infinity,
            height: 700,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
              ],
            ),
          ):Container(
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
                      // MaterialButton(
                      //     onPressed: (){
                      //      authProvider.getAbout();
                      //      print('fffffffff');
                      // },
                      //   child: Text('test'),
                      // ),
                      Text(translator.currentLanguage == 'ar' ?authProvider.aboutAr:authProvider.aboutEn,
                        textAlign: TextAlign.center,),
                      SizedBox(height: MediaQuery.of(context).size.height*.04,),
                      Icon(Icons.phone,size: 30,color: Color(AppTheme.yellowColor)),
                      SizedBox(height: MediaQuery.of(context).size.height*.01,),
                      Text(authProvider.aboutPhone,style: TextStyle(color: Color(AppTheme.yellowColor)),),
                      SizedBox(height: MediaQuery.of(context).size.height*.02,),
                      Icon(Icons.web_outlined,size: 30,color: Color(AppTheme.yellowColor)),
                      SizedBox(height: MediaQuery.of(context).size.height*.01,),
                      Text(authProvider.aboutWebSite,style: TextStyle(color: Color(AppTheme.yellowColor)),)
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