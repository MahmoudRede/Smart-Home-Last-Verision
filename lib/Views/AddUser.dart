import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:fssmarthome/Views/Custom/CustomAppBar.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

import '../Provider/AuthProvider.dart';
import '../Theme/AppTheme.dart';

class AddUser extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<AddUser> {
  TextEditingController name =new TextEditingController();
  TextEditingController password =new TextEditingController();
  TextEditingController phone  =new TextEditingController();
  TextEditingController email =new TextEditingController();
  bool ishidden=true;
  final formKey=GlobalKey<FormState>();
  FocusNode passwordNode =new FocusNode();
  FocusNode phoneNode =new FocusNode();
  FocusNode emailNode =new FocusNode();
  String message="";
  bool loading=false;
  @override
  Widget build(BuildContext context) {
    final authProvider= Provider.of<AuthProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(AppTheme.backGround),
        body:Directionality(
          textDirection:translator.currentLanguage == 'ar' ?  TextDirection.rtl : TextDirection.ltr,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width*.05,
                  right: MediaQuery.of(context).size.width*.05
              ),
              child: Column(
                children: [
                  CustomAppBar(title: translator.translate("adduser")),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*.8,
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            controller: name,
                            onFieldSubmitted: (value){
                              FocusScope.of(context).requestFocus(emailNode);
                            },
                            validator: (value){
                              if(value!.isEmpty){
                                return translator.translate('EnterUsername');
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                errorStyle: TextStyle(fontSize: 12),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide( width: 1.0,color: Colors.black),
                                ),
                                prefixIcon: Icon(Icons.person,color: Colors.black),
                                contentPadding: EdgeInsets.only(
                                    left: 10,right: 10,top: 10,bottom: 10
                                ),
                                hintText: translator.translate('UserName'),
                                hintStyle: TextStyle(fontSize: 14,color: Colors.black),
                                fillColor: Colors.black
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Container(
                          width: MediaQuery.of(context).size.width*.8,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            focusNode: emailNode,
                            style: TextStyle(color: Colors.black),
                            controller: email,
                            onFieldSubmitted: (value){
                              FocusScope.of(context).requestFocus(phoneNode);
                            },
                            validator: (value){
                              if(value!.isEmpty){
                                return translator.translate('EnterEmail');
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                errorStyle: TextStyle(fontSize: 12),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                                ),
                                prefixIcon: Icon(Icons.email,color: Colors.black,),
                                contentPadding: EdgeInsets.only(
                                    left: 10,right: 10,top: 10,bottom: 10
                                ),
                                hintText: translator.translate('Email'),
                                hintStyle: TextStyle(color: Colors.black,fontSize: 14),
                                fillColor: Colors.black
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Container(
                          width: MediaQuery.of(context).size.width*.8,
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            focusNode: phoneNode,
                            style: TextStyle(color: Colors.black),
                            controller: phone,
                            onFieldSubmitted: (value){
                              FocusScope.of(context).requestFocus(passwordNode);
                            },
                            validator: (value){
                              if(value!.isEmpty){
                                return translator.translate('EnterPhone');
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                errorStyle: TextStyle(fontSize: 12),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                                ),
                                prefixIcon: Icon(Icons.phone,color: Colors.black,),
                                contentPadding: EdgeInsets.only(
                                    left: 10,right: 10,top: 10,bottom: 10
                                ),
                                hintText: translator.translate('Phone'),
                                hintStyle: TextStyle(color: Colors.black,fontSize: 14),
                                fillColor: Colors.black
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Container(
                          width: MediaQuery.of(context).size.width*.8,
                          child: TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            focusNode: passwordNode,
                            onFieldSubmitted: (value){
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                            validator: (value){
                              if(value!.isEmpty){
                                return translator.translate('EnterPassword');
                              }
                              return null;
                            },
                            style: TextStyle(color: Colors.black),
                            controller: password,
                            obscureText: ishidden,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                                ),
                                prefixIcon: GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        ishidden=!ishidden;
                                      });
                                    },
                                    child: Icon(ishidden?Icons.lock:Icons.lock_open,color: Colors.black,)),
                                contentPadding: EdgeInsets.only(
                                    left: 10,right: 10,top: 10,bottom: 10
                                ),
                                hintText: translator.translate('Password'),
                                errorStyle: TextStyle(fontSize: 12),
                                hintStyle: TextStyle(color: Colors.black,fontSize: 14),
                                fillColor: Colors.black
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*.025,),
                        message==""?SizedBox():Container(
                            width: MediaQuery.of(context).size.width*.8,
                            child: Text(message,textAlign: TextAlign.center,style: TextStyle(fontSize: 12,color: Colors.red,fontWeight: FontWeight.bold),)),
                        SizedBox(height: MediaQuery.of(context).size.height*.025,),
                        GestureDetector(
                          onTap: ()async{
                            if(formKey.currentState!.validate()){
                              setState(() {
                                loading=true;
                              });
                              await authProvider.AddUser(name.text, phone.text, email.text, password.text, password.text);
                              if(authProvider.statusCodeConnection==200){
                                FlutterToastr.show(authProvider.RegisterInfo["message"], context, duration: FlutterToastr.lengthShort, position:  FlutterToastr.center);
                                Navigator.pop(context);
                              }
                              else{
                                FlutterToastr.show(authProvider.RegisterInfo["message"], context, duration: FlutterToastr.lengthShort, position:  FlutterToastr.center);
                              }
                              setState(() {
                                loading=false;
                              });

                            }
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height*.065,
                            width: MediaQuery.of(context).size.width*.8,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                                color:loading? Colors.black12:Color(AppTheme.primaryColor)
                            ),
                            alignment: Alignment.center,
                            child: Text(translator.translate('adduser'),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*.02,),


                      ],
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
