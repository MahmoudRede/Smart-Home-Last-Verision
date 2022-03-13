import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:fssmarthome/Provider/DeviceProvider.dart';
import 'package:fssmarthome/Provider/RoomProvider.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/Custom/CustomAppBar.dart';
import 'package:fssmarthome/Views/Custom/GlobalFunction.dart';
import 'package:fssmarthome/Views/ListOfVoice.dart';
import 'package:fssmarthome/main.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

import '../Models/VoiceModel.dart';

class EditVoice extends StatefulWidget{
  VoiceModel voiceModel;
  EditVoice({required this.voiceModel});
  @override
  State<StatefulWidget> createState() {
    return _state(voiceModel: this.voiceModel);
  }
}
class _state extends State<EditVoice>{
  VoiceModel voiceModel;
  _state({required this.voiceModel});
  TextEditingController device_number=new TextEditingController();
  TextEditingController phrase=new TextEditingController();
  TextEditingController phrase_open=new TextEditingController();
  TextEditingController phrase_close=new TextEditingController();
  TextEditingController room_id=new TextEditingController();
  final formKey=GlobalKey<FormState>();
  FocusNode phraseNode=new FocusNode();
  FocusNode openNode=new FocusNode();
  FocusNode closeNode =new FocusNode();
  bool loading2 =false;
  loadData()async{
    var roomProvider= Provider.of<RoomProvider>(context, listen: false);
    var deviceProvider= Provider.of<DeviceProvider>(context, listen: false);
    var body=GlobalFunction.getBody(27, 0, "id", "ASC", "all", "false", "true", ["user_id"], ["="], ["${MyApp.user_id}"]);
      roomProvider.getUserRooms(body);
    setState((){
      device_number.text=voiceModel.userRoomDeviceId.toString();
      phrase.text=voiceModel.phrase;
      phrase_open.text=voiceModel.phraseOpen;
      phrase_close.text=voiceModel.phraseClose;
    });
    print("-----------------------------------------------------------------------");
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  @override
  Widget build(BuildContext context) {
    var deviceProvider= Provider.of<DeviceProvider>(context, listen: false);
    return SafeArea(child: Scaffold(
      backgroundColor: Color(AppTheme.backGround),
      body: Directionality(
        textDirection:translator.currentLanguage == 'ar' ?  TextDirection.rtl : TextDirection.ltr,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width*.05,
              right: MediaQuery.of(context).size.width*.05,
            ),
            child: Column(
              children: [
                CustomAppBar(title: translator.translate('VoiceControlPhrase')),
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
                        loading2?Container(
                            height: 50,
                             child: Center(child: CircularProgressIndicator.adaptive(),)):Container(
                             height: MediaQuery.of(context).size.height*.06,
                             child: TextFormField(
                             onFieldSubmitted: (value){
                               FocusScope.of(context).requestFocus(FocusNode());
                             },
                          /*   validator: (value){
                              if(value!.isEmpty){
                                return '';
                              }
                              return null;
                            },*/
                             controller: room_id,
                             readOnly: true,
                             onTap: ()=>SelectRoom(context),
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
                                hintText: translator.translate('RoomNumber'),
                                hintStyle: TextStyle(fontSize: 14,color: Colors.black)
                            ),
                          ),
                        ),
                        SizedBox(height:MediaQuery.of(context).size.height*.02),
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
                            readOnly: true,
                            onTap: ()=>SelectDevice(context),
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
                                hintText: translator.translate('DeviceNumber'),
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
                                hintText: translator.translate('Phrase'),
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
                                hintText: translator.translate('Phrase_Open'),
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
                                hintText: translator.translate('Phrase_Close'),
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
                      onTap: ()async{
                        if(formKey.currentState!.validate()){
                          await deviceProvider.UpdateVoice(voiceModel.id,phrase.text, device_number.text, phrase_open.text, phrase_close.text);
                          if(deviceProvider.connection==200)
                          {
                            FlutterToastr.show(translator.translate('DataHasBeenUpdated'), context, duration: FlutterToastr.lengthLong, position:  FlutterToastr.center);

                            Navigator.push(context, GlobalFunction.route(ListOfVoice()));
                          }
                          else
                          {
                            FlutterToastr.show(translator.translate('Errorr'), context, duration: FlutterToastr.lengthLong, position:  FlutterToastr.center);
                          }
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
                        child: Text(translator.translate('Edit'),style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    SizedBox(height:MediaQuery.of(context).size.height*.02),

                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
  SelectRoom(BuildContext context) {
    var roomProvider= Provider.of<RoomProvider>(context, listen: false);
    var deviceProvider= Provider.of<DeviceProvider>(context, listen: false);
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
                  roomProvider.rooms.length==0? Container(
                    height: 100,
                    alignment: Alignment.center,
                    child: Text("No Room Added For You"),
                  ): ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount:  roomProvider.rooms.length,
                    itemBuilder: (context,index){
                      return InkWell(
                          onTap: ()async{
                            setState(() {
                              loading2=true;
                            });
                            setState(() {
                              room_id.text=roomProvider.rooms[index].id.toString();
                            });
                            Navigator.pop(context);
                            await deviceProvider.getRoomDevices(roomProvider.rooms[index].id);
                            setState(() {
                              loading2=false;
                            });

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
                                  child: Text( roomProvider.rooms[index].room.name,style: TextStyle(color: Colors.black),)),
                              roomProvider.rooms.length-1==index?SizedBox():Container(height: 1,width: MediaQuery.of(context).size.width)
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
  SelectDevice(BuildContext context) {
    var deviceProvider= Provider.of<DeviceProvider>(context, listen: false);
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
                  deviceProvider.roomDevices.length==0? Container(
                    height: 100,
                    alignment: Alignment.center,
                    child: Text("لا يوجد اجهزه"),
                  ): ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount:  deviceProvider.roomDevices.length,
                    itemBuilder: (context,index){
                      return InkWell(
                          onTap: (){
                            setState(() {
                              device_number.text= deviceProvider.roomDevices[index].id.toString();
                            });
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
                                  child: Text(deviceProvider.roomDevices[index].device.name,style: TextStyle(color: Colors.black),)),
                              deviceProvider.roomDevices.length-1==index?SizedBox():Container(height: 1,width: MediaQuery.of(context).size.width,)
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