import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Base/Cash_Helper/cash_helper.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/Custom/GlobalFunction.dart';
import 'package:fssmarthome/Views/Devices/ResetPassword.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

import '../../Provider/AuthProvider.dart';

class OTP extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<OTP>{
  final formKey=GlobalKey<FormState>();
  TextEditingController n1=new TextEditingController();
  TextEditingController n2=new TextEditingController();
  TextEditingController n3=new TextEditingController();
  TextEditingController n4=new TextEditingController();
  // TextEditingController n5=new TextEditingController();
  // TextEditingController n6=new TextEditingController();

  final nod0 = FocusNode();
  final nod1 = FocusNode();
  final nod2 = FocusNode();
  final nod3 = FocusNode();
  final nod4 = FocusNode();
  final nod5 = FocusNode();

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
                        top: MediaQuery.of(context).size.height*.1,
                      left: MediaQuery.of(context).size.width*.05,
                      right: MediaQuery.of(context).size.width*.05,
                    ),
                    child:  Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * .125,
                                child: TextFormField(

                                  autofocus: true,
                                  focusNode: nod0,
                                  maxLength: 1,
                                  onChanged:(val) {
                                    if(val.isEmpty){

                                    }else
                                      FocusScope.of(context).requestFocus(nod1);
                                  },
                                  //  onFieldSubmitted:
                                  validator: (value) {
                                    if (value!.isEmpty) return '';
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  style:  TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    errorStyle: TextStyle(fontSize: 0),
                                    contentPadding: EdgeInsets.only(top: 0, bottom: 0),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                                    ),
                                    counterStyle: TextStyle(fontSize: 0),
                                  ),
                                  controller: n1,

                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .125,
                                child: TextFormField(
                                  maxLength: 1,
                                  onChanged: (val) {
                                    if(val.isEmpty){
                                      print("00000000000000000000000000000000");
                                      FocusScope.of(context).requestFocus(nod0);
                                    }else
                                      FocusScope.of(context).requestFocus(nod2);
                                  },
                                  focusNode: nod1,
                                  validator: (value) {
                                    if (value!.isEmpty) return '';
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  style:  TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    errorStyle: TextStyle(fontSize: 0),
                                    counterStyle: TextStyle(fontSize: 0),
                                    contentPadding: EdgeInsets.only(top: 0, bottom: 0),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                                    ),
                                  ),
                                  controller: n2,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .125,
                                child: TextFormField(
                                  maxLength: 1,
                                  onChanged: (val) {
                                    if(val.isEmpty){
                                      FocusScope.of(context).requestFocus(nod1);
                                    }else
                                      FocusScope.of(context).requestFocus(nod3);
                                  },
                                  focusNode: nod2,
                                  validator: (value) {
                                    if (value!.isEmpty) return '';
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  style:  TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    counterStyle: TextStyle(fontSize: 0),
                                    errorStyle: TextStyle(fontSize: 0),
                                    contentPadding: EdgeInsets.only(top: 0, bottom: 0),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                                    ),
                                  ),
                                  controller: n3,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .125,
                                child: TextFormField(
                                  maxLength: 1,
                                  validator: (value) {
                                    if (value!.isEmpty) return '';
                                    return null;
                                  },
                                  focusNode: nod3,
                                  onChanged: (val) {
                                    if(val.isEmpty){
                                      FocusScope.of(context).requestFocus(nod2);
                                    }else
                                      FocusScope.of(context).requestFocus(FocusNode());
                                  },
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    errorStyle: TextStyle(fontSize: 0),
                                    counterStyle: TextStyle(fontSize: 0),
                                    contentPadding: EdgeInsets.only(top: 0, bottom: 0),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                                    ),
                                  ),
                                  controller: n4,
                                ),
                              ),
                              // Container(
                              //   width: MediaQuery.of(context).size.width * .125,
                              //   child: TextFormField(
                              //     maxLength: 1,
                              //     validator: (value) {
                              //       if (value!.isEmpty) return '';
                              //       return null;
                              //     },
                              //     focusNode: nod4,
                              //     onChanged: (val) {
                              //       if(val.isEmpty){
                              //         FocusScope.of(context).requestFocus(nod2);
                              //       }else
                              //         FocusScope.of(context).requestFocus(FocusNode());
                              //     },
                              //     textAlign: TextAlign.center,
                              //     style: TextStyle(
                              //         fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                              //     keyboardType: TextInputType.number,
                              //     decoration: InputDecoration(
                              //       errorStyle: TextStyle(fontSize: 0),
                              //       counterStyle: TextStyle(fontSize: 0),
                              //       contentPadding: EdgeInsets.only(top: 0, bottom: 0),
                              //       enabledBorder: UnderlineInputBorder(
                              //         borderSide: BorderSide(color: Colors.white, width: 1.0),
                              //       ),
                              //       focusedBorder: UnderlineInputBorder(
                              //         borderSide: BorderSide(color: Colors.white, width: 1.0),
                              //       ),
                              //     ),
                              //     controller: n5,
                              //   ),
                              // ),
                              // Container(
                              //   width: MediaQuery.of(context).size.width * .125,
                              //   child: TextFormField(
                              //     maxLength: 1,
                              //     validator: (value) {
                              //       if (value!.isEmpty) return '';
                              //       return null;
                              //     },
                              //     focusNode: nod5,
                              //     onChanged: (val) {
                              //       if(val.isEmpty){
                              //         FocusScope.of(context).requestFocus(nod2);
                              //       }else
                              //         FocusScope.of(context).requestFocus(FocusNode());
                              //     },
                              //     textAlign: TextAlign.center,
                              //     style: TextStyle(
                              //         fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                              //     keyboardType: TextInputType.number,
                              //     decoration: InputDecoration(
                              //       errorStyle: TextStyle(fontSize: 0),
                              //       counterStyle: TextStyle(fontSize: 0),
                              //       contentPadding: EdgeInsets.only(top: 0, bottom: 0),
                              //       enabledBorder: UnderlineInputBorder(
                              //         borderSide: BorderSide(color: Colors.white, width: 1.0),
                              //       ),
                              //       focusedBorder: UnderlineInputBorder(
                              //         borderSide: BorderSide(color: Colors.white, width: 1.0),
                              //       ),
                              //     ),
                              //     controller: n6,
                              //   ),
                              // ),
                            ],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*.08,),
                          GestureDetector(
                            onTap: ()async{
                              if(formKey.currentState!.validate()){
                                CashHelper.saveData(key: 'code',value: n1.text+n2.text+n3.text+n4.text);
                                authProvider.checkCode(CashHelper.getData(key: 'emailCheck'), n1.text+n2.text+n3.text+n4.text);
                                // authProvider.verifyOtp(n1.text+n2.text+n3.text+n4.text+n5.text+n6.text);
                                Navigator.push(
                                    context, GlobalFunction.route(ResetPassword()));

                              }
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height*.065,
                              width: MediaQuery.of(context).size.width*.7,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.white),
                              alignment: Alignment.center,
                              child: Text(translator.translate("Confirm"),style: TextStyle(fontWeight: FontWeight.bold),),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}