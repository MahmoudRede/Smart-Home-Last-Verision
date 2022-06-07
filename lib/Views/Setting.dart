import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Provider/RoomProvider.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/ChangePassword.dart';
import 'package:fssmarthome/Views/Custom/CustomAppBar.dart';
import 'package:fssmarthome/Views/Custom/GlobalFunction.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Provider/AuthProvider.dart';
import '../Provider/DeviceProvider.dart';
import '../main.dart';

class Setting extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return _state();
  }
}
class _state extends State<Setting>{
  List<String>languages=["العربية","English"];
  String SelectedLanguage="en";

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
      // name.text=userProvider.userInfo["name"]??"";
      // phone.text=userProvider.userInfo["phone"]??"";
      // email.text=userProvider.userInfo["email"]??"";
      loading=false;
    });
  }
  @override
  Widget build(BuildContext context) {


    return SafeArea(child: Scaffold(
     backgroundColor: Color(AppTheme.backGround),
     body: Directionality(
       textDirection:translator.currentLanguage == 'ar' ?  TextDirection.rtl : TextDirection.ltr,
       child: Container(
         padding: EdgeInsets.only(
           left: MediaQuery.of(context).size.width*.05,
           right: MediaQuery.of(context).size.width*.05
         ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             CustomAppBar(title:translator.translate('Setting')),
             SizedBox(height:MediaQuery.of(context).size.height*.05,),
             Container(
               padding: EdgeInsets.only(
                   left: MediaQuery.of(context).size.width*.05,
                   right: MediaQuery.of(context).size.width*.05
               ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                  // Text("Languaage",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                   SizedBox(height:MediaQuery.of(context).size.height*.02,),
                   GestureDetector(
                     onTap: (){
                       SelectLanguage(context);
                     },
                     child: Container(
                       width: MediaQuery.of(context).size.width*.8,
                       height: MediaQuery.of(context).size.height*.065,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           border: Border.all(color: Colors.black12,width: 1)
                       ),
                       padding: EdgeInsets.only(
                           left: MediaQuery.of(context).size.width*.05,
                           right: MediaQuery.of(context).size.width*.05
                       ),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text(SelectedLanguage=="en"?"English":"Arabic"),
                           Icon(Icons.arrow_drop_down)
                         ],
                       ),
                     ),
                   ),
                   SizedBox(height:MediaQuery.of(context).size.height*.03,),
                   GestureDetector(
                     onTap: (){
                       Navigator.push(context, GlobalFunction.route(ChangePassword()));
                     },
                     child: Container(
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
                       child: Row(
                         children: [
                           Text(translator.translate('changepassword'),style: TextStyle(color: Colors.white),)
                         ],
                       ),
                     ),
                   )
                 ],
               ),
             )
           ],
         ),
       ),
     ),
   ));
  }
  SelectLanguage(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
          child:  Container(
            width: MediaQuery.of(context).size.width*.4,
            decoration: BoxDecoration(color: Colors.white,
              // borderRadius: BorderRadius.all(Radius.circular(20))
              // border: Border.all(color: Colors.black12,width: 2.0)
            )
            ,padding: EdgeInsets.only(
            top:  MediaQuery.of(context).size.height*0.01,
            bottom: MediaQuery.of(context).size.height*0.01,
            left: MediaQuery.of(context).size.width*0.05,
            right: MediaQuery.of(context).size.width*0.05,
          ),


            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: languages.length,
                    itemBuilder: (context,index){
                      return GestureDetector(
                          onTap: (){
                         if(index==0){
                           changeLang("ar");
                           setState(() {
                             SelectedLanguage="ar";
                           });
                         }else{
                           changeLang("en");
                           setState(() {
                             SelectedLanguage="en";
                           });
                         }
                            Navigator.pop(context);
                          },
                          child:Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*.005,top: MediaQuery.of(context).size.height*.005),
                                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*.005,top: MediaQuery.of(context).size.height*.005),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    //color: Color(h.mainColor)
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(languages[index],style: TextStyle(color: Colors.black),)),
                              languages.length-1==index?SizedBox():Container(height: 1,width: MediaQuery.of(context).size.width,color:Color(AppTheme.primaryColor),)
                            ],
                          )
                      );
                    },
                  ),
                ],
              ),
            ),

          ),
        ));
  }
  void changeLang(String lang) async {
    SharedPreferences pref =await SharedPreferences.getInstance();
    setState(() {
      translator.setNewLanguage(
        context,
        newLanguage: '${lang}',
        remember: true,
        restart: false,
      );
      //StaticData.language = lang == 'ar' ? 'العربية' : 'English';
    });
    pref.setString("lang", lang);
    MyApp.setLocale(context, Locale('${lang}'));

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

