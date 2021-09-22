import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';

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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*.01,),
                Image.asset("assets/images/logo/logo2.png",
                  height: MediaQuery.of(context).size.height*.21,
                  fit: BoxFit.cover,
                ),
                Text("Create New Account",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                SizedBox(height: MediaQuery.of(context).size.height*.02,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
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
                            focusNode: emailNode,
                            style: TextStyle(color: Colors.white),
                            controller: email,
                            onFieldSubmitted: (value){
                              FocusScope.of(context).requestFocus(phoneNode);
                            },
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Enter Email';
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
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.white,fontSize: 14),
                                fillColor: Colors.white
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Container(
                          width: MediaQuery.of(context).size.width*.8,
                          child: TextFormField(
                            focusNode: phoneNode,
                            style: TextStyle(color: Colors.white),
                            controller: phone,
                            onFieldSubmitted: (value){
                              FocusScope.of(context).requestFocus(passwordNode);
                            },
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Enter Phone';
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
                                hintText: "Phone",
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
                        SizedBox(height: MediaQuery.of(context).size.height*.05,),
                        GestureDetector(
                          onTap: (){
                            if(formKey.currentState!.validate()){

                            }
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height*.065,
                            width: MediaQuery.of(context).size.width*.8,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.white),
                            alignment: Alignment.center,
                            child: Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*.02,),
                        Text("OR",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                        SizedBox(height: MediaQuery.of(context).size.height*.01,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/google.png",width: 30,height: 30,),
                            SizedBox(width: 30,),
                            Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.blue),
                                child: Image.asset("assets/images/fb.png",width: 25,height: 25,color: Colors.white,)),

                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*.03,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("You don’t have an account ?",style: TextStyle(fontSize: 12,color: Colors.white),),
                            Text("Sign Up",style: TextStyle(fontSize: 12,color: Color(AppTheme.yellowColor)),)
                          ],
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
    );
  }
}