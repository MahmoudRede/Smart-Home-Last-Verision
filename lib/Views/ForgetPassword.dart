import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Base/Cash_Helper/cash_helper.dart';
import 'package:fssmarthome/Base/shared_preference_manger.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/Custom/GlobalFunction.dart';
import 'package:fssmarthome/Views/Devices/OTP.dart';
import 'package:fssmarthome/Views/Register.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Provider/AuthProvider.dart';

class ForgetPassword extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<ForgetPassword>{
  TextEditingController email =new TextEditingController();

  final formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final authProvider= Provider.of<AuthProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Directionality(
          textDirection:translator.currentLanguage == 'ar' ?  TextDirection.rtl : TextDirection.ltr,
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*.01,),
                  Image.asset("assets/images/logo/logo2.png",
                    height: MediaQuery.of(context).size.height*.23,
                    fit: BoxFit.cover,
                  ),
                  Text(translator.translate("ForgetPassword"),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                  SizedBox(height: MediaQuery.of(context).size.height*.05,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*.67,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            topLeft: Radius.circular(50)
                        ),
                        color: Color(AppTheme.primaryColor)
                    ),
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height*.1
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width*.8,
                            child: TextFormField(
                              style: TextStyle(color: Colors.white),
                              controller: email,
                              onFieldSubmitted: (value){
                                FocusScope.of(context).requestFocus(FocusNode());
                              },
                              validator: (value){
                                if(value!.isEmpty){
                                  return translator.translate("EnterYourEmail");
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  errorStyle: TextStyle(fontSize: 12),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white, width: 1.0),
                                  ),
                                  prefixIcon: Icon(Icons.email,color: Colors.white,),
                                  contentPadding: EdgeInsets.only(
                                      left: 10,right: 10,top: 10,bottom: 10
                                  ),
                                  hintText: translator.translate("Email"),
                                  hintStyle: TextStyle(color: Colors.white,fontSize: 14),
                                  fillColor: Colors.white
                              ),
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*.05,),
                          GestureDetector(
                            onTap: ()async{
                              if(formKey.currentState!.validate()){
                                // authProvider.sendOtp(email.text);
                                CashHelper.saveData(key: 'emailCheck',value: email.text);
                                authProvider.forgetpassword(email.text);
                                  Navigator.push(
                                      context, GlobalFunction.route(OTP())
                                  );
                              }
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height*.065,
                              width: MediaQuery.of(context).size.width*.8,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.white),
                              alignment: Alignment.center,
                              child: Text(translator.translate("Confirm"),style: TextStyle(fontWeight: FontWeight.bold),),
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*.07,),

                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}