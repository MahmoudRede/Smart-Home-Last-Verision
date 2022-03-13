import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/Custom/CustomAppBar.dart';
import 'package:fssmarthome/Views/Custom/GlobalFunction.dart';
import 'package:fssmarthome/Views/ListOfSignals.dart';
import 'package:fssmarthome/Views/ListOfVoice.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class CreateSignal extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<CreateSignal>{
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Color(AppTheme.backGround),
      body: Directionality(
        textDirection:translator.currentLanguage == 'ar' ?  TextDirection.rtl : TextDirection.ltr,
        child: Container(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width*.05,
            right: MediaQuery.of(context).size.width*.05,
          ),
          child: Column(
            children: [
              CustomAppBar(title:translator.translate('CrateSignals')),
              SizedBox(height:MediaQuery.of(context).size.height*.05),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(color: Colors.black12.withOpacity(.08),width: 1)
                ),
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width*.05,
                    right: MediaQuery.of(context).size.width*.05,
                    top: MediaQuery.of(context).size.height*.04,
                    bottom: MediaQuery.of(context).size.height*.04
                ),
                child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*.06,
                        decoration: BoxDecoration(
                          border:Border.all(color: Colors.black12,width: 1)
                        ),
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width*.025,
                          right: MediaQuery.of(context).size.width*.025
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.add,size: 25,),
                            SizedBox(width: 3,),
                            Text(translator.translate('signal'))
                          ],
                        ),
                      ),
                      SizedBox(height:MediaQuery.of(context).size.height*.02),
                      Container(
                        height: MediaQuery.of(context).size.height*.06,
                        decoration: BoxDecoration(
                            border:Border.all(color: Colors.black12,width: 1)
                        ),
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width*.025,
                            right: MediaQuery.of(context).size.width*.025
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.arrow_back,size: 25,),
                            SizedBox(width: 3,),
                            Text(translator.translate('signal'))
                          ],
                        ),
                      ),
                      SizedBox(height:MediaQuery.of(context).size.height*.02),
                      Container(
                        height: MediaQuery.of(context).size.height*.06,
                        decoration: BoxDecoration(
                            border:Border.all(color: Colors.black12,width: 1)
                        ),
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width*.025,
                            right: MediaQuery.of(context).size.width*.025
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.arrow_drop_up,size: 25,),
                            SizedBox(width: 3,),
                            Text(translator.translate('signal'))
                          ],
                        ),
                      ),
                      SizedBox(height:MediaQuery.of(context).size.height*.02),
                      Container(
                        height: MediaQuery.of(context).size.height*.06,
                        decoration: BoxDecoration(
                            border:Border.all(color: Colors.black12,width: 1)
                        ),
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width*.025,
                            right: MediaQuery.of(context).size.width*.025
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.arrow_drop_down,size: 25,),
                            SizedBox(width: 3,),
                            Text(translator.translate('signal'))
                          ],
                        ),
                      ),
                      SizedBox(height:MediaQuery.of(context).size.height*.02),
                      Container(
                        height: MediaQuery.of(context).size.height*.06,
                        decoration: BoxDecoration(
                            border:Border.all(color: Colors.black12,width: 1)
                        ),
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width*.025,
                            right: MediaQuery.of(context).size.width*.025
                        ),
                        child: Row(
                          children: [
                             ImageIcon(AssetImage("assets/images/shutdown.png"),size: 22,),
                            SizedBox(width: 8,),
                            Text(translator.translate('signal'))
                          ],
                        ),
                      ),
                      SizedBox(height:MediaQuery.of(context).size.height*.02),
                      Container(
                        height: MediaQuery.of(context).size.height*.06,
                        decoration: BoxDecoration(
                            border:Border.all(color: Colors.black12,width: 1)
                        ),
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width*.025,
                            right: MediaQuery.of(context).size.width*.025
                        ),
                        child: Row(
                          children: [
                            Text(translator.translate('OK'),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
                            SizedBox(width: 8,),
                            Text(translator.translate('signal'))
                          ],
                        ),
                      ),
                      SizedBox(height:MediaQuery.of(context).size.height*.02),


                    ],
                  ),
              ),
              SizedBox(height:MediaQuery.of(context).size.height*.05),
              Column(
                children: [
                  GestureDetector(
                    onTap: (){
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width*.35,
                      height: MediaQuery.of(context).size.height*.06,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(AppTheme.primaryColor)
                      ),
                      alignment: Alignment.center,
                      child: Text(translator.translate('Save'),style: TextStyle(color: Colors.white),),
                    ),
                  ),
                  SizedBox(height:MediaQuery.of(context).size.height*.02),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context, GlobalFunction.route(ListOfSignals()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width*.35,
                      height: MediaQuery.of(context).size.height*.06,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color:  Color(AppTheme.primaryColor),width: 1),
                          color: Colors.white
                      ),
                      alignment: Alignment.center,
                      child: Text(translator.translate('ViewList'),style: TextStyle(color: Color(AppTheme.primaryColor)),),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}