import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/Custom/CustomAppBar.dart';
import 'package:fssmarthome/Views/Custom/GlobalFunction.dart';
import 'package:fssmarthome/Views/ListOfVoice.dart';

class AddVoice extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<AddVoice>{
  TextEditingController device_number=new TextEditingController();
  TextEditingController phrase=new TextEditingController();
  TextEditingController phrase_open=new TextEditingController();
  TextEditingController phrase_close=new TextEditingController();
  final formKey=GlobalKey<FormState>();
  FocusNode phraseNode=new FocusNode();
  FocusNode openNode=new FocusNode();
  FocusNode closeNode =new FocusNode();
  @override
  Widget build(BuildContext context) {
     return SafeArea(child: Scaffold(
       backgroundColor: Color(AppTheme.backGround),
       body: Container(
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
                           FocusScope.of(context).requestFocus(phraseNode);
                         },
                         validator: (value){
                           if(value!.isEmpty){
                             return '';
                           }
                           return null;
                         },
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
                     SizedBox(height:MediaQuery.of(context).size.height*.02),
                     Container(
                       height: MediaQuery.of(context).size.height*.06,
                       child: TextFormField(
                         onFieldSubmitted: (value){
                           FocusScope.of(context).requestFocus(openNode);
                         },
                         validator: (value){
                           if(value!.isEmpty){
                             return '';
                           }
                           return null;
                         },
                         focusNode: phraseNode,
                         controller: phrase,
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
                             hintText: "Phrase",
                             hintStyle: TextStyle(fontSize: 14,color: Colors.black)
                         ),
                       ),
                     ),
                     SizedBox(height:MediaQuery.of(context).size.height*.02),
                     Container(
                       height: MediaQuery.of(context).size.height*.06,
                       child: TextFormField(
                         onFieldSubmitted: (value){
                           FocusScope.of(context).requestFocus(closeNode);
                         },
                         validator: (value){
                           if(value!.isEmpty){
                             return '';
                           }
                           return null;
                         },
                         focusNode: openNode,
                         controller: phrase_open,
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
                             hintText: "Phrase Open",
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
                         focusNode: closeNode,
                         controller: phrase_close,
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
                             hintText: "Phrase Close",
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
                 SizedBox(height:MediaQuery.of(context).size.height*.02),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context, GlobalFunction.route(ListOfVoice()));
                  },
                   child: Container(
                     width: MediaQuery.of(context).size.width*.35,
                     height: MediaQuery.of(context).size.height*.06,
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20),
                         border: Border.all(color:  Color(AppTheme.primaryColor),width: 1),
                         color: Colors.white
                     ),
                     alignment: Alignment.center,
                     child: Text("View List",style: TextStyle(color: Color(AppTheme.primaryColor)),),
                   ),
                 ),
               ],
             )
           ],
         ),
       ),
     ));
  }
}