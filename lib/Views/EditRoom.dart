import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:fssmarthome/Views/Custom/CustomAppBar.dart';
import 'package:fssmarthome/main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

import '../Models/UserRoomModel.dart';
import '../Provider/DeviceProvider.dart';
import '../Provider/RoomProvider.dart';
import '../Theme/AppTheme.dart';

class EditRoom extends StatefulWidget {
  UserRoomModel userRoomModel;
  EditRoom({required this.userRoomModel});
  @override
  _EditRoomState createState() => _EditRoomState(userRoomModel: this.userRoomModel);
}

class _EditRoomState extends State<EditRoom> {
  UserRoomModel userRoomModel;
  _EditRoomState({required this.userRoomModel});
  TextEditingController name_en =new TextEditingController();
  TextEditingController name_ar =new TextEditingController();
  final formKey=GlobalKey<FormState>();
  FocusNode name_arNode =new FocusNode();
  bool loading=false;
  bool loadingData=true;
  loadData()async{
    var deviceProvider= Provider.of<DeviceProvider>(context, listen: false);
    await deviceProvider.getRoomDevices(this.userRoomModel.id);
    print(this.userRoomModel.user.id==MyApp.user_id);
    print(this.userRoomModel.user.id);
    print(MyApp.user_id);
    print("ssssssssssssssssssssssssssssss");
    setState(() {
      name_ar.text=this.userRoomModel.room.nameAr;
      name_en.text=this.userRoomModel.room.nameEn;
      loadingData=false;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  @override
  Widget build(BuildContext context) {
    var roomProvider= Provider.of<RoomProvider>(context, listen: true);
    var deviceProvider= Provider.of<DeviceProvider>(context, listen: true);
    return WillPopScope(
      onWillPop: ()async{
        Navigator.pushNamedAndRemoveUntil(context, "/rooms", (route) => false);
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          body:loadingData? Center(child: CircularProgressIndicator.adaptive(),):Directionality(
            textDirection:translator.currentLanguage == 'ar' ?  TextDirection.rtl : TextDirection.ltr,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width*.05,
                    right: MediaQuery.of(context).size.width*.05,
                    ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamedAndRemoveUntil(context, "/rooms", (route) => false);
                          },
                          child: Padding(
                            padding:  EdgeInsets.only(top: 8),
                            child: Icon(Icons.arrow_back_ios),
                          ),
                        ),
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
                            left: MediaQuery.of(context).size.width*.03,
                            right: MediaQuery.of(context).size.width*.03,
                          ),
                          child: Text( translator.translate('EditRoom'),textAlign: TextAlign.center,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Color(AppTheme.yellowColor)),),
                        ),
                        Icon(Icons.arrow_back_ios,color: Color(AppTheme.backGround),)
                      ],
                    ),
                    this.userRoomModel.room.userId!=null&&this.userRoomModel.room.userId==MyApp.user_id?  Column(
                       children: [
                         Padding(
                           padding:  EdgeInsets.only(
                             left: MediaQuery.of(context).size.width*.05,
                             right: MediaQuery.of(context).size.width*.05,
                           ),
                           child: Form(
                             key: formKey,
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
                                 TextFormField(
                                   onFieldSubmitted: (value){
                                     FocusScope.of(context).requestFocus(name_arNode);
                                   },
                                   validator: (value){
                                     if(value!.isEmpty){
                                       return translator.translate('Entername');
                                     }
                                     return null;
                                   },
                                   controller: name_en,
                                   decoration: InputDecoration(
                                       contentPadding: EdgeInsets.only(left: 10,right: 10),
                                       hintText: "Room Name"
                                   ),
                                 ),
                                 SizedBox(height: MediaQuery.of(context).size.height*.02,),
                                 TextFormField(
                                   focusNode: name_arNode,
                                   onFieldSubmitted: (value){
                                     FocusScope.of(context).requestFocus(FocusNode());
                                   },
                                   validator: (value){
                                     if(value!.isEmpty){
                                       return translator.translate('Entername');
                                     }
                                     return null;
                                   },
                                   controller: name_ar,
                                   decoration: InputDecoration(
                                       contentPadding: EdgeInsets.only(left: 10,right: 10),
                                       hintText: "الاسم بالعربية"
                                   ),
                                 ),
                                 SizedBox(height: MediaQuery.of(context).size.height*.08,),
                                 image==0? GestureDetector(
                                   onTap: ()=>pickImage(context),
                                   child: Stack(
                                     children: [
                                       Container(
                                         height: MediaQuery.of(context).size.height*.16,
                                         width: MediaQuery.of(context).size.height*.16,
                                         child: Container(
                                           height: MediaQuery.of(context).size.height*.14,
                                           width: MediaQuery.of(context).size.height*.14,
                                           decoration: BoxDecoration(
                                               borderRadius: BorderRadius.circular(1000),
                                               color: Colors.black26
                                           ),
                                           padding: EdgeInsets.all(MediaQuery.of(context).size.height*.045),
                                           child: Image.network(this.userRoomModel.room.logo),
                                         ),
                                       ),
                                       Positioned(
                                           top: MediaQuery.of(context).size.height*.1,
                                           left: MediaQuery.of(context).size.height*.115,
                                           child: Container(
                                             height: MediaQuery.of(context).size.height*.045,
                                             width: MediaQuery.of(context).size.height*.045,
                                             decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(1000),
                                                 color: Color(AppTheme.primaryColor)
                                             ),
                                             child: Icon(Icons.add,size: 28,color: Colors.white,),
                                           ))

                                     ],
                                   ),
                                 ):Text(translator.translate('OneImageSelected'),style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.red),),
                                 SizedBox(height: MediaQuery.of(context).size.height*.05,),
                               ],
                             ),
                           ),
                         ),

                         GestureDetector(
                           onTap: ()async{
                             if(formKey.currentState!.validate()){
                               setState((){
                                 loading=true;
                               });
                          if(image==0){
                            await roomProvider.updateUserRoom2(this.userRoomModel.id, context, name_en.text, name_ar.text,this.userRoomModel.room.id,MyApp.user_id);
                            await roomProvider.updateRoom2(this.userRoomModel.room.id, context, name_en.text, name_ar.text,this.userRoomModel.room.id,MyApp.user_id);
                          }
                          else{
                            await roomProvider.updateUserRoom(this.userRoomModel.id, selectedImage, context, name_en.text, name_ar.text,this.userRoomModel.room.id,MyApp.user_id);
                            await roomProvider.updateRoom(this.userRoomModel.room.id, selectedImage, context, name_en.text, name_ar.text,this.userRoomModel.room.id,MyApp.user_id);
                          }

                               if(roomProvider.connection==200){
                                 if(roomProvider.connection==200){
                                 //  Navigator.pushNamedAndRemoveUntil(context, "/rooms", (route) => false);
                                   FlutterToastr.show(translator.translate('DataHasBeenUpdated'), context, duration: FlutterToastr.lengthLong, position:  FlutterToastr.center);
                                   setState((){
                                     loading=false;
                                   });
                                 }
                                 else{
                                   FlutterToastr.show(roomProvider.responceInfo["errors"], context, duration: FlutterToastr.lengthLong, position:  FlutterToastr.center);
                                 }
                               }
                               else{
                                 FlutterToastr.show(roomProvider.responceInfo["errors"], context, duration: FlutterToastr.lengthLong, position:  FlutterToastr.center);
                               }

                             }
                             else{
                               FlutterToastr.show(translator.translate('PleaseEnterTheNameAndSelectImageOfRoom'), context, duration: FlutterToastr.lengthLong, position:  FlutterToastr.center);
                             }
                           },
                           child: Container(
                             width: MediaQuery.of(context).size.width*.75,
                             height: MediaQuery.of(context).size.height*.06,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.all(Radius.circular(20)),
                                 border: Border.all(color: Color(AppTheme.yellowColor),width: 1),
                                 color: loading?Colors.black12:Colors.white
                             ),
                             alignment: Alignment.center,
                             child: Text(translator.translate('Edit'),style: TextStyle(color: Color(AppTheme.yellowColor),fontSize: 16,fontWeight: FontWeight.bold),),
                           ),
                         ),
                       ],
                     ):SizedBox(),
                    SizedBox(height: MediaQuery.of(context).size.height*.03,),
                    Container(
                      width: MediaQuery.of(context).size.width*.9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(translator.translate('devices'),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                          SizedBox(height: MediaQuery.of(context).size.height*.015,),
                          ListView.builder(shrinkWrap: true,primary: false,itemCount: deviceProvider.roomDevices.length,itemBuilder: (context,index){
                            return Container(
                              width:MediaQuery.of(context).size.width*.9,
                              margin: EdgeInsets.only(bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.network(deviceProvider.roomDevices[index].device.logo,width: 40,fit: BoxFit.contain,),
                                      SizedBox(width: 10,),
                                      Text(deviceProvider.roomDevices[index].device.name,)
                                    ],
                                  ),
                                  GestureDetector(
                                      onTap: (){
                                        setState((){
                                          confirmDelete(context, deviceProvider.roomDevices[index].id);

                                        });
                                      },
                                      child: Icon(Icons.delete,color: Colors.red,size: 25,))
                                ],
                              ),
                            );
                          })
                        ],
                      ),
                    )
                  ],
                ),
              )
            ),
          )
        ),
      ),
    );
  }
  late File selectedImage;
  int image=0;
  pickImage(BuildContext context ) async {
    setState(() {
    });
    var imagePicker = new  ImagePicker();
    var profileImage=await imagePicker.pickImage(source:  ImageSource.gallery);
    setState(() {
      selectedImage = File(profileImage!.path);
      image=1;
    });
  }
  confirmDelete(BuildContext context,var id) {
    var deviceProvider= Provider.of<DeviceProvider>(context, listen: false);
    showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
          child:  Container(
            padding: EdgeInsets.only(
                left: 10,
                right: 10
            ),
            height: 130.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(0)),
                border: Border.all(color: Colors.black12,width: 2.0),
                color: Colors.white
            ),
            child: Stack(children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center
                ,crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(alignment: Alignment.center,child: Column(
                    children: [
                      SizedBox(height: 3,),
                      Text(translator.translate("ConfirmDeleteThisItem"),style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                      // Text("${title}",textAlign: TextAlign.center,)
                    ],
                  )),
                  SizedBox(height: 20,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          child: Container(

                            decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black38,width: 1.0),
                                color:Colors.white
                            ),
                            height: MediaQuery.of(context).size.height*.04,
                            width: MediaQuery.of(context).size.width*.32,
                            alignment: Alignment.center,
                            child:   Text(translator.translate("Cancel"),style: TextStyle(color:Colors.black,fontSize: 13),),
                          ),
                          onTap: (){
                            Navigator.pop(context);
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color:Color(AppTheme.primaryColor)
                            ),
                            height: MediaQuery.of(context).size.height*.04,
                            width: MediaQuery.of(context).size.width*.32,
                            alignment: Alignment.center,
                            child:   Text(translator.translate("Confirm"),style: TextStyle(color:Colors.white,fontSize: 13),),
                          ),
                          onTap: () async {
                            await deviceProvider.deleteDevice(id).then((value) {
                              Navigator.pop(context);

                            });


                          },
                        ),

                      ],
                    ),
                  )
                ],
              ),


            ],),
          ),
        ));
  }
}
