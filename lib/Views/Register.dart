import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Base/shared_preference_manger.dart';
import 'package:fssmarthome/Provider/AuthProvider.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class Register extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<Register>{
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
        backgroundColor: Colors.white,
        body:Directionality(
          textDirection:translator.currentLanguage == 'ar' ?  TextDirection.rtl : TextDirection.ltr,
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*.01,),
                  Image.asset("assets/images/logo/logo2.png",
                    height: MediaQuery.of(context).size.height*.21,
                    fit: BoxFit.cover,
                  ),
                  Text(translator.translate('Create New Account'),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  SingleChildScrollView(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              topLeft: Radius.circular(50)
                          ),
                          color: Color(AppTheme.primaryColor)
                      ),
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height*.04
                      ),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*.8,
                              child: TextFormField(
                                style: TextStyle(color: Colors.white),
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
                                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                                    ),
                                    prefixIcon: Icon(Icons.person,color: Colors.white,),
                                    contentPadding: EdgeInsets.only(
                                        left: 10,right: 10,top: 10,bottom: 10
                                    ),
                                    hintText: translator.translate('User Name'),
                                    hintStyle: TextStyle(color: Colors.white,fontSize: 14),
                                    fillColor: Colors.white
                                ),
                              ),
                            ),
                            SizedBox(height: 15,),
                            Container(
                              width: MediaQuery.of(context).size.width*.8,
                              child: TextFormField(
                                focusNode: emailNode,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(color: Colors.white),
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
                                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                                    ),
                                    prefixIcon: Icon(Icons.email,color: Colors.white,),
                                    contentPadding: EdgeInsets.only(
                                        left: 10,right: 10,top: 10,bottom: 10
                                    ),
                                    hintText: translator.translate('Email'),
                                    hintStyle: TextStyle(color: Colors.white,fontSize: 14),
                                    fillColor: Colors.white
                                ),
                              ),
                            ),
                            SizedBox(height: 15,),
                            Container(
                              width: MediaQuery.of(context).size.width*.8,
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                focusNode: phoneNode,
                                style: TextStyle(color: Colors.white),
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
                                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                                    ),
                                    prefixIcon: Icon(Icons.phone,color: Colors.white,),
                                    contentPadding: EdgeInsets.only(
                                        left: 10,right: 10,top: 10,bottom: 10
                                    ),
                                    hintText: translator.translate('Phone'),
                                    hintStyle: TextStyle(color: Colors.white,fontSize: 14),
                                    fillColor: Colors.white
                                ),
                              ),
                            ),
                            SizedBox(height: 15,),
                            Container(
                              width: MediaQuery.of(context).size.width*.8,
                              child: TextFormField(
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
                                style: TextStyle(color: Colors.white),
                                controller: password,
                                obscureText: ishidden,
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                                    ),
                                    prefixIcon: GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            ishidden=!ishidden;
                                          });
                                        },
                                        child: Icon(ishidden?Icons.lock:Icons.lock_open,color: Colors.white,)),
                                    contentPadding: EdgeInsets.only(
                                        left: 10,right: 10,top: 10,bottom: 10
                                    ),
                                    hintText: translator.translate('Password'),
                                    errorStyle: TextStyle(fontSize: 12),
                                    hintStyle: TextStyle(color: Colors.white,fontSize: 14),
                                    fillColor: Colors.white
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
                                  await authProvider.RegisterServices(name.text, phone.text, email.text, password.text,password.text);
                                  if(authProvider.statusCodeConnection==200){
                                 //   SharedPreferenceManager.addData("token",authProvider.RegisterInfo["access_token"]);
                                    SharedPreferenceManager.addData("id",authProvider.RegisterInfo["data"]["id"].toString());
                                    SharedPreferenceManager.addData("name",authProvider.RegisterInfo["data"]["name"]);
                                    setState(() {
                                      MyApp.user_id=authProvider.RegisterInfo["data"]["id"];
                                      MyApp.user_name=authProvider.RegisterInfo["data"]["name"];
                                    });
                                    Navigator.pushNamedAndRemoveUntil(context,"/login", (route) => false);
                                  }
                                  else{
                                    setState(() {
                                      loading=false;
                                      message=authProvider.RegisterInfo["message"];
                                    });
                                  }
                                }
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height*.065,
                                width: MediaQuery.of(context).size.width*.8,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                                    color:loading? Colors.black12:Colors.white
                                ),
                                alignment: Alignment.center,
                                child: Text(translator.translate('SignUp'),style: TextStyle(fontWeight: FontWeight.bold),),
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*.02,),
                            Text(translator.translate('OR'),style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                            SizedBox(height: MediaQuery.of(context).size.height*.01,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/images/google.png",width: 28,height: 28,),
                                SizedBox(width: 30,),
                                Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.blue),
                                    child: Image.asset("assets/images/fb.png",width: 25,height: 25,color: Colors.white,)),

                              ],
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*.03,),
                            GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(translator.translate('You have an account?'),style: TextStyle(fontSize: 14,color: Colors.white),),
                                  SizedBox(width: 10,),
                                  Text(translator.translate('SignIn?'),style: TextStyle(fontSize: 16,color: Color(AppTheme.yellowColor)),)
                                ],
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*.1,),

                          ],
                        ),
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