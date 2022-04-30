import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:fssmarthome/Provider/AuthProvider.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/Custom/CustomAppBar.dart';
import 'package:fssmarthome/Views/Users.dart';
import 'package:fssmarthome/main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

import 'Custom/GlobalFunction.dart';

class More extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<More>{
  TextEditingController name =new TextEditingController();
  TextEditingController email =new TextEditingController();
  TextEditingController phone =new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  bool loading=true;
  bool loadingBtn=false;
  loadData()async{
    var userProvider=Provider.of<AuthProvider>(context, listen: false);
      await  userProvider.getUserInfo();
    setState(() {
      name.text=userProvider.userInfo["name"]??"";
      phone.text=userProvider.userInfo["phone"]??"";
      email.text=userProvider.userInfo["email"]??"";
      loading=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    var userProvider=Provider.of<AuthProvider>(context, listen: false);
    return loading?Center(
      child: CircularProgressIndicator.adaptive(),
    ): WillPopScope(
      onWillPop: ()async{
        Navigator.pushNamedAndRemoveUntil(context,"/mainPage", (route) => false);
        return true;
      },
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () => Scaffold.of(context).openDrawer(),
                          child: Padding(
                            padding:  EdgeInsets.only(top: 10),
                            child: Icon(Icons.menu,size: 25,),
                          )),

                      Container(
                        height: MediaQuery.of(context).size.height*.13,
                        width: MediaQuery.of(context).size.width*.55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(1000),
                                bottomRight: Radius.circular(1000)
                            ),
                            color: Colors.white
                        ),
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width*.02,
                          right: MediaQuery.of(context).size.width*.02,
                        ),
                        child: Text(translator.translate("Profile"),textAlign: TextAlign.center,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Color(AppTheme.yellowColor)),),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamedAndRemoveUntil(context,"/mainPage", (route) => false);
                        },
                        child: Padding(
                          padding:  EdgeInsets.only(top: 8),
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.035,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                   // height: MediaQuery.of(context).size.height*.65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                    ),
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height*.02,
                      bottom: MediaQuery.of(context).size.height*.03,
                      left: MediaQuery.of(context).size.width*.05,
                      right:  MediaQuery.of(context).size.width*.05
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height*.015,),
                        Text("${translator.translate("Name")} :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                        SizedBox(height: 3,),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black12
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 10,right: 10)
                            ),
                            controller: name,
                          ),
                        ),
                        //////////////////////
                        SizedBox(height: MediaQuery.of(context).size.height*.04,),
                        Text(translator.translate("Email")+":",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                        SizedBox(height: 3,),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black12
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10,right: 10)
                            ),
                            controller: email,
                          ),
                        ),
                        ////////////////////
                        SizedBox(height: MediaQuery.of(context).size.height*.04,),
                        Text(translator.translate("Phone")+":",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                        SizedBox(height: 3,),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black12
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10,right: 10)
                            ),
                            controller: phone,
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*.05,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: ()async{
                                setState(() {
                                  loadingBtn=true;
                                });
                                await  userProvider.editProfile(name.text, email.text, phone.text);
                                FlutterToastr.show(translator.translate("DataHasBeenUpdated"), context, duration: FlutterToastr.lengthShort, position:  FlutterToastr.center);
                                setState(() {
                                  MyApp.user_name=name.text;
                                  loadingBtn=false;
                                });
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height*.065,
                                width: MediaQuery.of(context).size.width*.8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color:loadingBtn? Colors.black12:Color(AppTheme.primaryColor)
                                ),
                                alignment: Alignment.center,
                                child:Text(translator.translate("Edit"),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),)
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*.02,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: ()async{
                                Navigator.push(context, GlobalFunction.route(Users()));
                              },
                              child: Container(
                                  height: MediaQuery.of(context).size.height*.065,
                                  width: MediaQuery.of(context).size.width*.8,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color:loadingBtn? Colors.black12:Color(AppTheme.primaryColor)
                                  ),
                                  alignment: Alignment.center,
                                  child:Text(translator.translate("users"),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),)
                              ),
                            )
                          ],
                        )
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
  bool loadingImage=false;
  late File selectedImage;
  pickImage(BuildContext context ) async {
    setState(() {
      loadingImage=true;
    });
    final userProvider= Provider.of<AuthProvider>(context, listen: false);
    var imagePicker = new  ImagePicker();
    var profileImage=await imagePicker.pickImage(source:  ImageSource.gallery);

    setState(() {
      selectedImage = File(profileImage!.path);
    });
    await  userProvider.sendImagePick(selectedImage,context);
    setState(() {
      loadingImage=false;
    });

  }
}
