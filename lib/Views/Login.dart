import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fssmarthome/Base/shared_preference_manger.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/Custom/GlobalFunction.dart';
import 'package:fssmarthome/Views/ForgetPassword.dart';
import 'package:fssmarthome/Views/Register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<Login>{
  TextEditingController name =new TextEditingController();
  TextEditingController password =new TextEditingController();
  bool ishidden=true;
  final formKey=GlobalKey<FormState>();
  FocusNode passwordNode =new FocusNode();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        confirmCloseApp(context);
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*.01,),
                  Image.asset("assets/images/logo/logo2.png",
                    height: MediaQuery.of(context).size.height*.23,
                    fit: BoxFit.cover,
                  ),
                  Text('Welcome Back',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
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
                      top: MediaQuery.of(context).size.height*.07
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
                                FocusScope.of(context).requestFocus(passwordNode);
                              },
                              validator: (value){
                                if(value!.isEmpty){
                                  return 'Enter Username';
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
                                hintText: "User Name",
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
                                  return 'Enter Password';
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
                                  hintText: "Password",
                                  errorStyle: TextStyle(fontSize: 12),
                                  hintStyle: TextStyle(color: Colors.white,fontSize: 14),
                                  fillColor: Colors.white
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width*.8,
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context, GlobalFunction.route(ForgetPassword()));
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height*.01,
                                  bottom: MediaQuery.of(context).size.height*.01
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("Forget Password",style: TextStyle(fontSize: 12,color: Color(AppTheme.yellowColor)),)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*.05,),
                          GestureDetector(
                            onTap: ()async{
                              if(formKey.currentState!.validate()){
                               SharedPreferenceManager.addData("UserId", "1");
                               Navigator.pushNamedAndRemoveUntil(context,"/mainPage", (route) => false);

                              }
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height*.065,
                              width: MediaQuery.of(context).size.width*.8,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.white),
                            alignment: Alignment.center,
                            child: Text("Login",style: TextStyle(fontWeight: FontWeight.bold),),
                            ),
                          ),
                          Expanded(child: SizedBox(),),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context, GlobalFunction.route(Register()));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                Text("You don’t have an account ?",style: TextStyle(fontSize: 12,color: Colors.white),),
                               Text("Sign Up",style: TextStyle(fontSize: 12,color: Color(AppTheme.yellowColor)),)
                                 ],
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
  confirmCloseApp(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
          child:  Container(
            padding: EdgeInsets.only(
                left: 10,
                right: 10
            ),
            height: 150.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(0)),
                border: Border.all(color: Colors.black12,width: 2.0),
                color: Colors.white
            ),
            child: Stack(children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center
                ,crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(alignment: Alignment.center,child: Column(
                    children: [
                      Icon(Icons.warning_amber_sharp,size: 50,),
                      SizedBox(height: 3,),
                      Text("Are You Sure Close App",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                      // Text("${title}",textAlign: TextAlign.center,)
                    ],
                  )),
                  SizedBox(height: 10,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          child: Container(

                            decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black38,width: 1.0),
                                color:Colors.white
                            ),
                            height: MediaQuery.of(context).size.height*.04,
                            width: MediaQuery.of(context).size.width*.32,
                            alignment: Alignment.center,
                            child:   Text( "Cancel",style: TextStyle(color:Colors.black,fontSize: 13),),
                          ),
                          onTap: (){
                            Navigator.pop(context);
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color:Color(AppTheme.primaryColor)
                            ),
                            height: MediaQuery.of(context).size.height*.04,
                            width: MediaQuery.of(context).size.width*.32,
                            alignment: Alignment.center,
                            child:   Text("Confirm",style: TextStyle(color:Colors.white,fontSize: 13),),
                          ),
                          onTap: () async {
                            SystemNavigator.pop();
                            Navigator.pop(context);
                          },
                        ),

                      ],
                    ),
                  )
                ],
              ),


            ],),
          ),
        ));
  }
}