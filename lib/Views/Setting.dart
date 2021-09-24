import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/ChangePassword.dart';
import 'package:fssmarthome/Views/Custom/CustomAppBar.dart';
import 'package:fssmarthome/Views/Custom/GlobalFunction.dart';

class Setting extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return _state();
  }
}
class _state extends State<Setting>{
  List<String>languages=["Arabic","English"];
  String SelectedLanguage="en";
  @override
  Widget build(BuildContext context) {
   return SafeArea(child: Scaffold(
     backgroundColor: Color(AppTheme.backGround),
     body: Container(
       padding: EdgeInsets.only(
         left: MediaQuery.of(context).size.width*.05,
         right: MediaQuery.of(context).size.width*.05
       ),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           CustomAppBar(title: "Setting"),
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
                         Text("Change Password",style: TextStyle(color: Colors.white),)
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
                           setState(() {
                             SelectedLanguage="en";
                           });
                         }else{
                           setState(() {
                             SelectedLanguage="ar";
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
}