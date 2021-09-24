import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/Custom/CustomAppBar.dart';

class ChangePassword extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<ChangePassword>{
  TextEditingController oldPassword =new TextEditingController();
  TextEditingController password =new TextEditingController();
  TextEditingController password2 =new TextEditingController();
  final formKey=GlobalKey<FormState>();
  FocusNode passwordNode =new FocusNode();
  FocusNode passwordNode2 =new FocusNode();
  bool ishidden1=true;
  bool ishidden2=true;
  bool ishidden3=true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Color(AppTheme.backGround),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width*.05,
              right: MediaQuery.of(context).size.width*.05
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(title: "Change Password"),
              SizedBox(height:MediaQuery.of(context).size.height*.05,),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*.8,
                      child: TextFormField(
                        onFieldSubmitted: (value){
                          FocusScope.of(context).requestFocus(passwordNode);
                        },
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Enter Old Password';
                          }
                          return null;
                        },
                        style: TextStyle(color:Color(AppTheme.primaryColor)),
                        controller: oldPassword,
                        obscureText: ishidden1,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(AppTheme.primaryColor), width: 1.0),
                            ),
                            prefixIcon: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    ishidden1=!ishidden1;
                                  });
                                },
                                child: Icon(ishidden1?Icons.lock:Icons.lock_open,color: Color(AppTheme.primaryColor),)),
                            contentPadding: EdgeInsets.only(
                                left: 10,right: 10,top: 10,bottom: 10
                            ),
                            hintText: "Old Password",
                            errorStyle: TextStyle(fontSize: 12),
                            hintStyle: TextStyle(color: Color(AppTheme.primaryColor),fontSize: 14),
                            fillColor: Color(AppTheme.primaryColor)
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      width: MediaQuery.of(context).size.width*.8,
                      child: TextFormField(
                        focusNode: passwordNode,
                        onFieldSubmitted: (value){
                          FocusScope.of(context).requestFocus(passwordNode2);
                        },
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Enter Password';
                          }
                          return null;
                        },
                        style: TextStyle(color: Color(AppTheme.primaryColor)),
                        controller: password,
                        obscureText: ishidden2,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color:Color(AppTheme.primaryColor), width: 1.0),
                            ),
                            prefixIcon: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    ishidden2=!ishidden2;
                                  });
                                },
                                child: Icon(ishidden2?Icons.lock:Icons.lock_open,color:Color(AppTheme.primaryColor),)),
                            contentPadding: EdgeInsets.only(
                                left: 10,right: 10,top: 10,bottom: 10
                            ),
                            hintText: "New  Password",
                            errorStyle: TextStyle(fontSize: 12),
                            hintStyle: TextStyle(color: Color(AppTheme.primaryColor),fontSize: 14),
                            fillColor: Color(AppTheme.primaryColor)
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      width: MediaQuery.of(context).size.width*.8,
                      child: TextFormField(
                        focusNode: passwordNode2,
                        onFieldSubmitted: (value){
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Confirm Old Password';
                          }
                          return null;
                        },
                        style: TextStyle(color: Color(AppTheme.primaryColor)),
                        controller: password2,
                        obscureText: ishidden3,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color:Color(AppTheme.primaryColor), width: 1.0),
                            ),
                            prefixIcon: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    ishidden3=!ishidden3;
                                  });
                                },
                                child: Icon(ishidden3?Icons.lock:Icons.lock_open,color: Color(AppTheme.primaryColor),)),
                            contentPadding: EdgeInsets.only(
                                left: 10,right: 10,top: 10,bottom: 10
                            ),
                            hintText: "Confirm Old Password",
                            errorStyle: TextStyle(fontSize: 12),
                            hintStyle: TextStyle(color:Color(AppTheme.primaryColor),fontSize: 14),
                            fillColor: Color(AppTheme.primaryColor)
                        ),
                      ),
                    ),


                  ],
                ),
              ),
              SizedBox(height:MediaQuery.of(context).size.height*.03,),
              GestureDetector(
                onTap: (){
                  if(formKey.currentState!.validate()){
                    Navigator.pushNamedAndRemoveUntil(context, "/mainPage", (route) => false);
                  }
                },
                child: Container(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width*.05,
                      right: MediaQuery.of(context).size.width*.05
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text("Languaage",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                      SizedBox(height:MediaQuery.of(context).size.height*.02,),
                      Container(
                        width: MediaQuery.of(context).size.width*.8,
                        height: MediaQuery.of(context).size.height*.065,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(AppTheme.primaryColor)
                        ),
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width*.05,
                            right: MediaQuery.of(context).size.width*.05
                        ),
                        alignment: Alignment.center,
                        child:  Text("Confirm",style: TextStyle(color: Colors.white),)
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}