import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/Custom/CustomAppBar.dart';
import 'package:fssmarthome/Views/Custom/GlobalFunction.dart';
import 'package:fssmarthome/Views/ListOfVoice.dart';

class ConnectDevice extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<ConnectDevice>{
  TextEditingController device_number=new TextEditingController();
  TextEditingController wifiUser=new TextEditingController();
  TextEditingController wifiPassword=new TextEditingController();
  final formKey=GlobalKey<FormState>();
  FocusNode wifiPasswordNode=new FocusNode();
  FocusNode device_numberNode=new FocusNode();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Color(AppTheme.backGround),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width*.05,
            right: MediaQuery.of(context).size.width*.05,
          ),
          child: Column(
            children: [
              CustomAppBar(title: "Voice Control Phrase"),
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
                child: Form(
                  key: formKey,
                  child:Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*.06,
                        child: TextFormField(
                          onFieldSubmitted: (value){
                            FocusScope.of(context).requestFocus(wifiPasswordNode);
                          },
                          validator: (value){
                            if(value!.isEmpty){
                              return '';
                            }
                            return null;
                          },
                          controller: wifiUser,
                          decoration: InputDecoration(
                              errorStyle: TextStyle(fontSize: 0,height: 0),
                              contentPadding: EdgeInsets.only(left: 10,right: 10),
                              enabledBorder: new OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black12)
                              ),
                              focusedBorder:  new OutlineInputBorder(

                                  borderSide: BorderSide(color: Colors.black12)
                              ),
                              focusedErrorBorder:new OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black12)
                              ),
                              errorBorder:new OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.red)
                              ),
                              hintText: "Wifi user name",
                              hintStyle: TextStyle(fontSize: 14,color: Colors.black)
                          ),
                        ),
                      ),
                      SizedBox(height:MediaQuery.of(context).size.height*.02),
                      Container(
                        height: MediaQuery.of(context).size.height*.06,
                        child: TextFormField(
                          onFieldSubmitted: (value){
                            FocusScope.of(context).requestFocus(device_numberNode);
                          },
                          validator: (value){
                            if(value!.isEmpty){
                              return '';
                            }
                            return null;
                          },
                          focusNode: wifiPasswordNode,
                          controller: wifiPassword,
                          decoration: InputDecoration(
                              errorStyle: TextStyle(fontSize: 0,height: 0),
                              contentPadding: EdgeInsets.only(left: 10,right: 10),
                              enabledBorder: new OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black12)
                              ),
                              focusedBorder:  new OutlineInputBorder(

                                  borderSide: BorderSide(color: Colors.black12)
                              ),
                              focusedErrorBorder:new OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black12)
                              ),
                              errorBorder:new OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.red)
                              ),
                              hintText: "Wifi Password",
                              hintStyle: TextStyle(fontSize: 14,color: Colors.black)
                          ),
                        ),
                      ),
                      SizedBox(height:MediaQuery.of(context).size.height*.02),
                      Container(
                        height: MediaQuery.of(context).size.height*.06,
                        child: TextFormField(
                          onFieldSubmitted: (value){
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                          validator: (value){
                            if(value!.isEmpty){
                              return '';
                            }
                            return null;
                          },
                          focusNode: device_numberNode,
                          controller: device_number,
                          decoration: InputDecoration(
                              errorStyle: TextStyle(fontSize: 0,height: 0),
                              contentPadding: EdgeInsets.only(left: 10,right: 10),
                              enabledBorder: new OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black12)
                              ),
                              focusedBorder:  new OutlineInputBorder(

                                  borderSide: BorderSide(color: Colors.black12)
                              ),
                              focusedErrorBorder:new OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black12)
                              ),
                              errorBorder:new OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.red)
                              ),
                              hintText: "Device Number",
                              hintStyle: TextStyle(fontSize: 14,color: Colors.black)
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(height:MediaQuery.of(context).size.height*.05),
              Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      if(formKey.currentState!.validate()){
                        Navigator.pushNamedAndRemoveUntil(context, "/mainPage", (route) => false);
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width*.35,
                      height: MediaQuery.of(context).size.height*.06,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(AppTheme.primaryColor)
                      ),
                      alignment: Alignment.center,
                      child: Text("Save",style: TextStyle(color: Colors.white),),
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