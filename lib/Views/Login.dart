import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<Login>{
  TextEditingController name =new TextEditingController();
  TextEditingController password =new TextEditingController();
  FocusNode passwordNode =new FocusNode();
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
                  height: MediaQuery.of(context).size.height*.23,
                  fit: BoxFit.cover,
                ),
                Text("Welcome Back",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                SizedBox(height: MediaQuery.of(context).size.height*.015,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*.7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50)
                    ),
                    color: Color(AppTheme.primaryColor)
                  ),
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height*.03
                  ),
                  child: Form(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*.8,
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: name,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)
                              ),
                              prefixIcon: Icon(Icons.person,color: Colors.white,),
                              contentPadding: EdgeInsets.only(
                                left: 15,right: 15,top: 10,bottom: 10
                              ),
                              hintText: "User Name",
                              hintStyle: TextStyle(color: Colors.white),
                              fillColor: Colors.white
                            ),
                          ),
                        )
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