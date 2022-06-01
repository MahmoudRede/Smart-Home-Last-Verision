import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:fssmarthome/Provider/DeviceProvider.dart';
import 'package:fssmarthome/Provider/RoomProvider.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Theme/StaticList.dart';
import 'package:fssmarthome/Views/Custom/CustomAppBar.dart';
import 'package:fssmarthome/Views/Custom/GlobalFunction.dart';
import 'package:fssmarthome/Views/EditRoom.dart';
import 'package:fssmarthome/Views/RoomDevices.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class AllRooms extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<AllRooms>{
  bool loading =true;

  loadData()async{
    var roomProvider= Provider.of<RoomProvider>(context, listen: false);
    var deviceProvider= Provider.of<DeviceProvider>(context, listen: false);
    var body=GlobalFunction.getBody(27, 0, "id", "ASC", "all", "false", "true", ["user_id"], ["="], ["${MyApp.user_id}"]);
    var body1=GlobalFunction.getBody(30, 0, "id", "ASC", "all", "false", "true", [], [], []);
    await roomProvider.getUserRooms(body);
     roomProvider.getRooms(body1);

    setState(() {
      loading=false;
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
    return WillPopScope(
      onWillPop: ()async{
        Navigator.pushNamedAndRemoveUntil(context,"/mainPage", (route) => false);
        return true;
      },
      child: Scaffold(
        backgroundColor: Color(AppTheme.backGround),
        body:loading? Center(child: CircularProgressIndicator.adaptive(),): Directionality(
          textDirection:translator.currentLanguage == 'ar' ?  TextDirection.rtl : TextDirection.ltr,
          child: Container(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width*.05,
              right: MediaQuery.of(context).size.width*.05
            ),
            child:Column(
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
                      child: Text(translator.translate('All_Rooms'),textAlign: TextAlign.center,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Color(AppTheme.yellowColor)),),
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
                SizedBox(height: MediaQuery.of(context).size.height*.03,),
                roomProvider.rooms.length==0?
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        ChooseRoom();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width*.66,
                        height: MediaQuery.of(context).size.height*.12,

                        child: Row(
                          children: [

                            SizedBox(width: MediaQuery.of(context).size.height*.04,),

                                Text(translator.translate("AddNewRoom"),style: TextStyle(height: 1.4,color: Colors.amber,fontSize: 16),),

                          ],
                        ),
                      ),
                    ),

                  ],
                )
                :Expanded(child: ListView.builder(itemCount: roomProvider.rooms.length,itemBuilder: (context,index){
                  return Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context, GlobalFunction.route(RoomDivices(room_id:roomProvider.rooms[index].id,name:roomProvider.rooms[index].room.name ,route: 2,)));
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height*.13,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                            ),
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width*.05,
                              right: MediaQuery.of(context).size.width*.05,
                              top: MediaQuery.of(context).size.height*.01,
                              bottom: MediaQuery.of(context).size.height*.01
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Row(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width*.22,
                                    height: MediaQuery.of(context).size.height*.11,
                                    margin: EdgeInsets.only(
                                        top: MediaQuery.of(context).size.height*.01,
                                        bottom: MediaQuery.of(context).size.height*.01
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      border: Border.all(color: Colors.black12.withOpacity(.1),width: 1),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.05),
                                          spreadRadius: 2,
                                          blurRadius: 2,
                                          offset: Offset(3, 3), // changes position of shadow
                                        ),
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.05),
                                          spreadRadius: 2,
                                          blurRadius: 2,
                                          offset: Offset(-3, -3), // changes position of shadow
                                        ),
                                      ],
                                      color: Colors.white,
                                    ),
                                    padding: EdgeInsets.all(12),
                                    child: Image.network( roomProvider.rooms[index].room.logo,fit: BoxFit.contain,),

                                  ),
                                  SizedBox(width: 7,),
                                  Container(
                                    height: MediaQuery.of(context).size.height*.11,
                                    padding: EdgeInsets.only(
                                        top: MediaQuery.of(context).size.height*.01,
                                        bottom: MediaQuery.of(context).size.height*.01
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text( roomProvider.rooms[index].room.name,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                        Text(" ${roomProvider.rooms[index].devices.toString()} ${translator.translate('devices')} ",style: TextStyle(fontSize: 11,))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height*.01
                                ),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.push(context, GlobalFunction.route(EditRoom(userRoomModel: roomProvider.rooms[index],)));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Icon(Icons.edit,size: 18,color: Colors.green,),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        confirmDelete(context,roomProvider.rooms[index].id,roomProvider.rooms[index].room.userId,roomProvider.rooms[index].room.id);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Icon(Icons.delete,size: 18,color: Colors.red,),
                                      ),
                                    )
                                  ],
                                ),
                              )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        index==roomProvider.rooms.length-1?
                        Column(
                          children: [
                            GestureDetector(
                              onTap: (){
                                ChooseRoom();
                              },
                              child: Container(
                                child:  Row(
                                  children: [

                                    SizedBox(width: MediaQuery.of(context).size.height*.04,),

                                    Text(translator.translate("AddNewRoom"),style: TextStyle(height: 1.4,color: Colors.amber,fontSize: 16),),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ):SizedBox(),
                        SizedBox(height: 10,),


                      ],
                    ),
                  );
                }),)
              ],
            ),
          ),
        ),
      ),
    );
  }

  ChooseRoom(){
    var roomProvider= Provider.of<RoomProvider>(context, listen: false);
    int select=-1;
    showDialog(
        context: context,
        builder: (BuildContext context) =>StatefulBuilder(
          builder: (BuildContext context, StateSetter setState)=> Scaffold(
            backgroundColor: Colors.black87.withOpacity(.75),
            body: Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width*.05,
                  right: MediaQuery.of(context).size.width*.05,
                  top: MediaQuery.of(context).size.height*.1,
                  bottom: MediaQuery.of(context).size.height*.1
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white
              ),
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width*.05,
                  right: MediaQuery.of(context).size.width*.05,
                  top: MediaQuery.of(context).size.height*.025,
                  bottom: MediaQuery.of(context).size.height*.025
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(translator.translate('ChooseNewRoom'),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Color(AppTheme.yellowColor)),),
                  SizedBox(height:  MediaQuery.of(context).size.height*.025),
                  Expanded(
                    child: ListView.builder(
                        itemCount: roomProvider.allRooms.length,
                        itemBuilder: (context,index){
                          return GestureDetector(
                            onTap: () {
                              setState((){
                                select=roomProvider.allRooms[index].id;
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      bottom: MediaQuery.of(context).size.height*.03
                                  ),
                                  child: Row(
                                    children: [
                                      select==roomProvider.allRooms[index].id? Icon(Icons.check_circle_outline,color: Color(AppTheme.yellowColor),):Icon(Icons.circle_outlined,color: Color(AppTheme.primaryColor),)
                                      , SizedBox(width: 15,),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(color: Colors.black26,width: 1)
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.network(roomProvider.allRooms[index].logo,
                                            width: MediaQuery.of(context).size.width*.15,
                                            height: MediaQuery.of(context).size.height*.05,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15,),
                                      Text(roomProvider.allRooms[index].name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)

                                    ],
                                  ),
                                ),
                                index==roomProvider.allRooms.length-1?GestureDetector(
                                  onTap: (){
                                    AddOther();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context).size.height*.02
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Icons.add,size: 30,),
                                        SizedBox(width: 10,),
                                        Text(translator.translate('AddAnother'),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                  ),
                                ):SizedBox()
                              ],
                            ),
                          );
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: ()async{
                          if(select==-1){
                            FlutterToastr.show(translator.translate('pleaseSelectRoom'), context, duration: FlutterToastr.lengthLong, position:  FlutterToastr.center);
                          }
                          else{
                            await roomProvider.addRoomToUser(MyApp.user_id, select);
                            if(roomProvider.connection==200){
                              FlutterToastr.show(translator.translate('RoomAddedSuccessfully'), context, duration: FlutterToastr.lengthLong, position:  FlutterToastr.center);
                              loadData();
                              Navigator.pop(context);
                            }
                            else{
                              FlutterToastr.show(roomProvider.responceInfo["errors"], context, duration: FlutterToastr.lengthLong, position:  FlutterToastr.center);
                            }
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width*.35,
                          height: MediaQuery.of(context).size.height*.06,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              border: Border.all(color: Color(AppTheme.yellowColor),width: 1),
                              color: Colors.white
                          ),
                          alignment: Alignment.center,
                          child: Text(translator.translate('Add'),style: TextStyle(color: Color(AppTheme.yellowColor),fontSize: 16,fontWeight: FontWeight.bold),),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width*.35,
                          height: MediaQuery.of(context).size.height*.06,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              border: Border.all(color: Colors.black,width: 1),
                              color: Colors.white
                          ),
                          alignment: Alignment.center,
                          child: Text(translator.translate('Back'),style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
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
  AddOther(){
    var roomProvider= Provider.of<RoomProvider>(context, listen: false);
    TextEditingController name_en =new TextEditingController();
    TextEditingController name_ar =new TextEditingController();
    final formKey=GlobalKey<FormState>();
    FocusNode name_arNode =new FocusNode();
    bool loading =false;
    showDialog(
        context: context,
        builder: (BuildContext context) =>StatefulBuilder(
          builder: (BuildContext context, StateSetter setState)=> Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.black87.withOpacity(.75),
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width*.05,
                  right: MediaQuery.of(context).size.width*.05,
                  top: MediaQuery.of(context).size.height*.1,
                  bottom: MediaQuery.of(context).size.height*.1
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white
              ),
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width*.05,
                  right: MediaQuery.of(context).size.width*.05,
                  top: MediaQuery.of(context).size.height*.08,
                  bottom: MediaQuery.of(context).size.height*.08
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(translator.translate('AddOtherRoom'),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Color(AppTheme.yellowColor)),),
                    SizedBox(height:  MediaQuery.of(context).size.height*.025),
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
                                      child: Image.asset("assets/images/upload icon.png"),
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

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: ()async{
                            if(formKey.currentState!.validate()&&image!=0){
                              setState((){
                                loading=true;
                              });
                              await roomProvider.AddRoom(selectedImage, context, name_en.text, name_ar.text);

                              loadData();
                              if(roomProvider.connection==200){
                                await roomProvider.addRoomToUser(MyApp.user_id, roomProvider.responceInfo["data"]["id"]);
                                if(roomProvider.connection==200){
                                  Navigator.pushNamedAndRemoveUntil(context, "/rooms", (route) => false);
                                  FlutterToastr.show(translator.translate('RoomAddedSucceffuly'), context, duration: FlutterToastr.lengthLong, position:  FlutterToastr.center);
                                  setState((){
                                    loading=false;
                                  });
                                  loadData();
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
                              print("fffffffffffffffffffffffffffff");
                              FlutterToastr.show(translator.translate('PleaseEnterTheNameAndSelectImageOfRoom'), context, duration: FlutterToastr.lengthLong, position:  FlutterToastr.center);
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width*.35,
                            height: MediaQuery.of(context).size.height*.06,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                border: Border.all(color: Color(AppTheme.yellowColor),width: 1),
                                color: loading?Colors.black12:Colors.white
                            ),
                            alignment: Alignment.center,
                            child: Text(translator.translate('Add'),style: TextStyle(color: Color(AppTheme.yellowColor),fontSize: 16,fontWeight: FontWeight.bold),),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width*.35,
                            height: MediaQuery.of(context).size.height*.06,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                border: Border.all(color: Colors.black,width: 1),
                                color: Colors.white
                            ),
                            alignment: Alignment.center,
                            child: Text(translator.translate('Back'),style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
  confirmDelete(BuildContext context,var  id,var user_id,var room_id) {
    var roomProvider= Provider.of<RoomProvider>(context, listen: false);
    showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
          child:  Container(
            padding: EdgeInsets.only(
                left: 10,
                right: 10
            ),
            height: 140.0,
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
                      Icon(Icons.delete,color: Colors.red,size: 40,),
                      SizedBox(height: 3,),
                      Text(translator.translate('ConfirmDeleteThisRoom'),style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                      // Text("${title}",textAlign: TextAlign.center,)
                    ],
                  )),
                  SizedBox(height: 10,),
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
                            child:   Text(translator.translate('Cancel'),style: TextStyle(color:Colors.black,fontSize: 13),),
                          ),
                          onTap: (){
                            Navigator.pop(context);
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color:Colors.red
                            ),
                            height: MediaQuery.of(context).size.height*.04,
                            width: MediaQuery.of(context).size.width*.32,
                            alignment: Alignment.center,
                            child:   Text(translator.translate('Confirm'),style: TextStyle(color:Colors.white,fontSize: 13),),
                          ),
                          onTap: () async {
                            await roomProvider.deleteUserRoom(id);
                            if(MyApp.user_id==user_id){
                               roomProvider.deleteRoom(room_id);
                            }
                            loadData();
                            Navigator.pop(context);
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
