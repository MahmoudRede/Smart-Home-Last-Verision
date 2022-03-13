import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class ResetPassword extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _state();
  }
}
class _state extends State<ResetPassword>{
  TextEditingController password2 =new TextEditingController();
  TextEditingController password =new TextEditingController();
  bool ishidden=true;
  bool ishidden2=true;
  final formKey=GlobalKey<FormState>();
  FocusNode passwordNode =new FocusNode();
  @override
  Widget build(BuildContext context) {
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
                  Text(translator.translate("ResetPassword"),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
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
                              onFieldSubmitted: (value){
                                FocusScope.of(context).requestFocus(passwordNode);
                              },
                              validator: (value){
                                if(value!.isEmpty){
                                  return  translator.translate("EnterPassword");
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
                                  return translator.translate("EnterConfirmPassword");
                                }
                                return null;
                              },
                              style: TextStyle(color: Colors.white),
                              controller: password2,
                              obscureText: ishidden2,
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white, width: 1.0),
                                  ),
                                  prefixIcon: GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          ishidden2=!ishidden2;
                                        });
                                      },
                                      child: Icon(ishidden2?Icons.lock:Icons.lock_open,color: Colors.white,)),
                                  contentPadding: EdgeInsets.only(
                                      left: 10,right: 10,top: 10,bottom: 10
                                  ),
                                  hintText: translator.translate("ConfirmPassword"),
                                  errorStyle: TextStyle(fontSize: 12),
                                  hintStyle: TextStyle(color: Colors.white,fontSize: 14),
                                  fillColor: Colors.white
                              ),
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*.05,),
                          GestureDetector(
                            onTap: ()async{
                              if(formKey.currentState!.validate()){
                                Navigator.pushNamedAndRemoveUntil(context,"/login", (route) => false);

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