import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:fssmarthome/Base/shared_preference_manger.dart';
import 'package:fssmarthome/Bloc/AppCubit.dart';
import 'package:fssmarthome/Provider/AuthProvider.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/AdminRegister.dart';
import 'package:fssmarthome/Views/Custom/GlobalFunction.dart';
import 'package:fssmarthome/Views/ForgetPassword.dart';
import 'package:fssmarthome/Views/Register.dart';
import 'package:fssmarthome/main.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../Provider/DeviceProvider.dart';
import '../Provider/RoomProvider.dart';
class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<Login>{
  TextEditingController name =new TextEditingController();
  TextEditingController password =new TextEditingController();
  bool loading =false;
  bool ishidden=true;
  final formKey=GlobalKey<FormState>();
  FocusNode passwordNode =new FocusNode();
  String message="";
  @override
  Widget build(BuildContext context) {
  final authProvider= Provider.of<AuthProvider>(context, listen: false);
  var roomProvider= Provider.of<RoomProvider>(context, listen: true);
  var deviceProvider= Provider.of<DeviceProvider>(context, listen: true);
    return WillPopScope(
      onWillPop: ()async{
        confirmCloseApp(context);
        return true;
      },
      child: SafeArea(
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
                    Text(translator.translate("Welcome Back"),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                    SizedBox(height: MediaQuery.of(context).size.height*.05,),
                    SingleChildScrollView(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height:MediaQuery.of(context).size.height*.7,
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
                                      return translator.translate("EnterUsername");
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
                                    hintText: translator.translate("UserName"),
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
                                      return translator.translate("EnterPassword");
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
                                      hintText: translator.translate("Password"),
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
                                        Text(translator.translate("ForgetPassword"),style: TextStyle(fontSize: 12,color: Color(AppTheme.yellowColor)),)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height*.02,),
                              message==""?SizedBox():Container(
                                  width: MediaQuery.of(context).size.width*.5,
                                  child: Text(message,textAlign: TextAlign.center,style: TextStyle(fontSize: 12,color: Colors.red,fontWeight: FontWeight.bold),)),
                              SizedBox(height: MediaQuery.of(context).size.height*.025,),
                              GestureDetector
                                (
                                onTap: ()async{
                                  if(formKey.currentState!.validate()){
                                    setState(() {
                                      loading=true;
                                    });
                                    await authProvider.LoginServices(name.text, password.text,context);
                                    if(authProvider.statusCodeConnection==200){
                                      SharedPreferenceManager.addData("token",authProvider.LoginInfo["access_token"]);
                                      SharedPreferenceManager.addData("id",authProvider.LoginInfo["data"]["id"].toString());
                                      SharedPreferenceManager.addData("name",authProvider.LoginInfo["data"]["name"]);
                                      setState((){
                                        MyApp.user_id=authProvider.LoginInfo["data"]["id"];
                                        print('*******************///////////////////***********');
                                        print(authProvider.LoginInfo["data"]["id"]);
                                        print('*******************///////////////////***********');
                                        roomProvider.getUserRoom(authProvider.LoginInfo["data"]["id"]);
                                        MyApp.user_name=authProvider.LoginInfo["data"]["name"];
                                      });
                                    }
                                    else{
                                     setState(() {
                                       loading=false;
                                       message=authProvider.LoginInfo["message"][0].toString();
                                     });
                                      }


                                  }
                                },
                                child: Container(
                                  height: MediaQuery.of(context).size.height*.08,
                                  width: MediaQuery.of(context).size.width*.6,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
                                      color:loading?Colors.black12:Colors.white),
                                alignment: Alignment.center,
                                child: Text(translator.translate("Login"),style: TextStyle(fontWeight: FontWeight.bold),),
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height*.03,),
                              Text(translator.translate("OR"),style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                              SizedBox(height: MediaQuery.of(context).size.height*.01,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: ()=>_handleSignIn(),
                                    child: Image.asset("assets/images/google.png",width: 28,height: 28,),
                                  ),
                                  SizedBox(width: 30,),
                                  GestureDetector(
                                    onTap: ()=>faceLogin(),
                                    child: Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.blue),
                                        child: Image.asset("assets/images/fb.png",width: 23,height: 23,color: Colors.white,)),
                                  ),

                                ],
                              ),
                                SizedBox(height: 30,),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, GlobalFunction.route(Register()));
                                   // _handleSignIn();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                    Text(translator.translate("Youdonthaveanaccount?"),style: TextStyle(fontSize: 14,color: Colors.white),),
                                     SizedBox(width: 10,),
                                     Text(translator.translate("SignUp"),style: TextStyle(fontSize: 15,color: Color(AppTheme.yellowColor)),)
                                     ],
                         ),
                                ),


                              SizedBox(height: 15,),

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
                      Text(translator.translate("AreYouSureCloseApp"),style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
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
                            child:   Text(translator.translate("Cancel"),style: TextStyle(color:Colors.black,fontSize: 13),),
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
                            child:   Text(translator.translate("Confirm"),style: TextStyle(color:Colors.white,fontSize: 13),),
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
  GoogleSignIn _googleSignIn = GoogleSignIn(
  );
  Future<void> _handleSignIn() async {
    final loginProvider= Provider.of<AuthProvider>(context, listen: false);
    // GoogleSignInAccount? googleSignInAccount  = await _googleSignIn.signIn();
    // print(googleSignInAccount?.email);
    try {
      setState(() {
        loading=true;
        FirebaseFirestore.instance.collection('Test').add({
          'test':'ok'
        });
         print('hi');
      });
      await _googleSignIn.signIn();
      print(_googleSignIn.currentUser );
      print(_googleSignIn.hashCode);
      if (_googleSignIn.currentUser != null) {
        GoogleSignInAccount? user = await _googleSignIn.signIn();
        GoogleSignInAuthentication googleSignInAuthentication = await user!.authentication;
        print(_googleSignIn.currentUser!.serverAuthCode);
        print('''name:${_googleSignIn.currentUser!.email}''');
        print(googleSignInAuthentication.idToken);
        print(googleSignInAuthentication.accessToken);


         await loginProvider.LoginSocial(_googleSignIn.currentUser!.id, _googleSignIn.currentUser!.displayName, _googleSignIn.currentUser!.email);
        print(loginProvider.statusCodeConnection);
        print("ssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
        if(loginProvider.statusCodeConnection==200){
          SharedPreferenceManager.addData("token",loginProvider.LoginInfo["access_token"]);
          SharedPreferenceManager.addData("id",loginProvider.LoginInfo["data"]["id"].toString());
          SharedPreferenceManager.addData("name",loginProvider.LoginInfo["data"]["name"]);
          Navigator.pushNamedAndRemoveUntil(context,"/mainPage", (route) => false);
          setState(() {
            MyApp.user_id=loginProvider.LoginInfo["data"]["id"];
            MyApp.user_name=loginProvider.LoginInfo["data"]["name"];
          });
        }
        else{
          setState(() {
            loading=false;
            message=loginProvider.LoginInfo["message"][0].toString();
          });
        }

        setState(() {
          loading=false;
        });
      }}
    catch (error) {
      FlutterToastr.show(error.toString(), context,
          duration: FlutterToastr.lengthShort, position: FlutterToastr.bottom);
      setState(() {
        loading=false;
      });
    }
  }
  faceLogin()async{

    final loginProvider= Provider.of<AuthProvider>(context, listen: false);
    setState(() {
      loading=true;
    });
    await FacebookAuth.instance.logOut();
    final LoginResult result = await FacebookAuth.instance
        .login(permissions: ['public_profile', 'email']);
    if (result.status == LoginStatus.success) {
      final userData = await FacebookAuth.instance.getUserData();
      print("userData ${userData.toString()}");
      final firstName = userData['name'].toString().split(" ");
      print("GAMAL" + LoginStatus.values.toString());
      print(userData['name'].toString().split(" "));
      print(userData["id"]);
      print(userData["email"]);
      print("---------------------------------------------------------------------");
      await loginProvider.LoginSocial(userData["id"], userData['name'].toString().split(" ")[0].toString(), userData["email"]);
      print(loginProvider.statusCodeConnection);
      print("ssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
      if(loginProvider.statusCodeConnection==200){
        SharedPreferenceManager.addData("token",loginProvider.LoginInfo["access_token"]);
        SharedPreferenceManager.addData("id",loginProvider.LoginInfo["data"]["id"].toString());
        SharedPreferenceManager.addData("name",loginProvider.LoginInfo["data"]["name"]);
        Navigator.pushNamedAndRemoveUntil(context,"/mainPage", (route) => false);
        setState(() {
          MyApp.user_id=loginProvider.LoginInfo["data"]["id"];

          MyApp.user_name=loginProvider.LoginInfo["data"]["name"];
        });
      }
      else{
        setState(() {
          loading=false;
          message=loginProvider.LoginInfo["message"][0].toString();
        });
      }
      setState(() {
        loading=false;
      });
      // you are logged`
    }
  }
}