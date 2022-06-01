import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/Custom/CustomAppBar.dart';
import 'package:fssmarthome/Views/Custom/GlobalFunction.dart';
import 'package:fssmarthome/Views/ListOfSignals.dart';
import 'package:fssmarthome/Views/ListOfVoice.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

import '../Provider/DeviceProvider.dart';
import '../Provider/RoomProvider.dart';
import '../main.dart';

class CreateSignal extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<CreateSignal>{
  TextEditingController plusbtn=new TextEditingController();
  TextEditingController minusbtn=new TextEditingController();
  TextEditingController upbtn=new TextEditingController();
  TextEditingController downbtn=new TextEditingController();
  TextEditingController powerbtn=new TextEditingController();
  TextEditingController okbtn=new TextEditingController();
  TextEditingController name=new TextEditingController();
  FocusNode plusbtnNode=new FocusNode();
  FocusNode minusbtnNode=new FocusNode();
  FocusNode upbtnNode=new FocusNode();
  FocusNode downbtnNode=new FocusNode();
  FocusNode powerbtnNode=new FocusNode();
  FocusNode okbtnNode=new FocusNode();
  final formKey=GlobalKey<FormState>();
  bool loading =true;
  bool loading2 =false;
  String message="";
  loadData()async{
    var roomProvider= Provider.of<RoomProvider>(context, listen: false);
    var deviceProvider= Provider.of<DeviceProvider>(context, listen: false);
    var body=GlobalFunction.getBody(27, 0, "id", "ASC", "all", "false", "true", ["user_id"], ["="], ["${MyApp.user_id}"]);
    await roomProvider.getUserRooms(body);
    setState(() {
      loading=false;
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
    var deviceProvider= Provider.of<DeviceProvider>(context, listen: true);
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
                CustomAppBar(title:translator.translate('CrateSignals')),
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
                        SizedBox(height:MediaQuery.of(context).size.height*.02),
                        Container(
                          height: MediaQuery.of(context).size.height*.06,
                          child: TextFormField(
                            onFieldSubmitted: (value){
                              FocusScope.of(context).requestFocus(plusbtnNode);
                            },
                            validator: (value){
                              if(value!.isEmpty){
                                return '';
                              }
                              return null;
                            },
                            controller: name,
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
                                hintText: translator.translate('Name'),
                                hintStyle: TextStyle(fontSize: 14,color: Colors.black)
                            ),
                          ),
                        ),
                        SizedBox(height:MediaQuery.of(context).size.height*.02),
                        Container(
                          height: MediaQuery.of(context).size.height*.06,
                          child: TextFormField(
                            onFieldSubmitted: (value){
                              FocusScope.of(context).requestFocus(minusbtnNode);
                            },
                            validator: (value){
                              if(value!.isEmpty){
                                return '';
                              }
                              return null;
                            },
                            focusNode: plusbtnNode,
                            controller: plusbtn,
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
                                prefixIcon: Icon(Icons.add,size: 25,),
                                hintText: "",
                                hintStyle: TextStyle(fontSize: 14,color: Colors.black)
                            ),
                          ),
                        ),
                        SizedBox(height:MediaQuery.of(context).size.height*.02),
                        Container(
                          height: MediaQuery.of(context).size.height*.06,
                          child: TextFormField(
                            onFieldSubmitted: (value){
                              FocusScope.of(context).requestFocus(upbtnNode);
                            },
                            validator: (value){
                              if(value!.isEmpty){
                                return '';
                              }
                              return null;
                            },
                            focusNode: minusbtnNode,
                            controller: minusbtn,
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
                                prefixIcon: Icon(Icons.remove,size: 25,),
                                hintText: "",
                                hintStyle: TextStyle(fontSize: 14,color: Colors.black)
                            ),
                          ),
                        ),
                        SizedBox(height:MediaQuery.of(context).size.height*.02),
                        Container(
                          height: MediaQuery.of(context).size.height*.06,
                          child: TextFormField(
                            onFieldSubmitted: (value){
                              FocusScope.of(context).requestFocus(downbtnNode);
                            },
                            validator: (value){
                              if(value!.isEmpty){
                                return '';
                              }
                              return null;
                            },
                            focusNode: upbtnNode,
                            controller: upbtn,
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
                                prefixIcon: Icon(Icons.arrow_drop_up_rounded,size: 25,),
                                hintText: "",
                                hintStyle: TextStyle(fontSize: 14,color: Colors.black)
                            ),
                          ),
                        ),
                        SizedBox(height:MediaQuery.of(context).size.height*.02),
                        Container(
                          height: MediaQuery.of(context).size.height*.06,
                          child: TextFormField(
                            onFieldSubmitted: (value){
                              FocusScope.of(context).requestFocus(okbtnNode);
                            },
                            validator: (value){
                              if(value!.isEmpty){
                                return '';
                              }
                              return null;
                            },
                            focusNode: downbtnNode,
                            controller: downbtn,
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
                                hintText: "",
                                prefixIcon: Icon(Icons.arrow_drop_down_rounded,size: 25,),
                                hintStyle: TextStyle(fontSize: 14,color: Colors.black)
                            ),
                          ),
                        ),
                        SizedBox(height:MediaQuery.of(context).size.height*.02),
                        Container(
                          height: MediaQuery.of(context).size.height*.06,
                          child: TextFormField(
                            onFieldSubmitted: (value){
                              FocusScope.of(context).requestFocus(plusbtnNode);
                            },
                            validator: (value){
                              if(value!.isEmpty){
                                return '';
                              }
                              return null;
                            },
                            focusNode: okbtnNode,
                            controller: okbtn,
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
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(translator.translate('OK'),style: TextStyle(color: Colors.black38,fontSize: 16,fontWeight: FontWeight.bold,),),
                                ),
                                hintText:"",
                                hintStyle: TextStyle(fontSize: 14,color: Colors.black)
                            ),
                          ),
                        ),
                        SizedBox(height:MediaQuery.of(context).size.height*.02),
                        Container(
                          height: MediaQuery.of(context).size.height*.06,
                          child: TextFormField(
                            onFieldSubmitted: (value){
                              FocusScope.of(context).requestFocus(downbtnNode);
                            },
                            validator: (value){
                              if(value!.isEmpty){
                                return '';
                              }
                              return null;
                            },
                            focusNode: powerbtnNode,
                            controller: powerbtn,
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
                                prefixIcon:Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ImageIcon(AssetImage("assets/images/shutdown.png"),size: 22,),
                                ),
                                hintText: "",
                                hintStyle: TextStyle(fontSize: 14,color: Colors.black)
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height:MediaQuery.of(context).size.height*.02),
                message==""?SizedBox():Container(
                    width: MediaQuery.of(context).size.width*.8,
                    child: Text(message,textAlign: TextAlign.center,style: TextStyle(fontSize: 12,color: Colors.red,fontWeight: FontWeight.bold),)),
                SizedBox(height:MediaQuery.of(context).size.height*.03),
                Column(
                  children: [
                    GestureDetector(
                      onTap: ()async{
                        if(formKey.currentState!.validate()){
                         await  deviceProvider.addRemote(name.text, plusbtn.text, minusbtn.text, upbtn.text, downbtn.text, powerbtn.text, okbtn.text);
                         if(deviceProvider.connection==200){
                           Navigator.push(
                               context, GlobalFunction.route(ListOfSignals()));
                         }else{
                           setState(() {
                             message=deviceProvider.info["errors"].toString();
                           });
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
                        child: Text(translator.translate('Save'),style: TextStyle(color: Colors.white),),
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
/*  SelectRoom(BuildContext context) {
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
  }*/
}