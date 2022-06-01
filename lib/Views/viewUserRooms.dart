import 'package:flutter/material.dart';
import 'package:fssmarthome/Provider/RoomProvider.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

import '../Base/Cash_Helper/cash_helper.dart';
import 'Custom/CustomAppBar.dart';

class ViewUserRomms extends StatelessWidget {
  const ViewUserRomms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var roomProvider= Provider.of<RoomProvider>(context, listen: true);

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(title: translator.translate("users Rooms")),
              SizedBox(height: MediaQuery.of(context).size.height*.02,),
              Expanded(child: ListView.builder(itemCount: roomProvider.userRooms.length,itemBuilder: (context,index){
                return Container(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          // print(roomProvider.rooms[index].room.id);
                          // print('dddddddddddddddddddddddddddddddddddddddddddddd');
                          // print(roomProvider.rooms[index].room.logo);
                          // print('dddddddddddddddddddddddddddddddddddddddddddddd');
                          // print(roomProvider.rooms[index].room.name);
                          //
                          // roomProvider.assignRoom(
                          //     userId:CashHelper.getData(key: 'userId'),
                          //     roomId:roomProvider.rooms[index].id,
                          //     roomName: roomProvider.rooms[index].room.name,
                          //     roomLogo:roomProvider.rooms[index].room.logo
                          // );
                          // FlutterToastr.show(translator.translate('Room Add to ${CashHelper.getData(key: 'userName')}'), context, duration: FlutterToastr.lengthLong, position:  FlutterToastr.center);
                          //
                          // CashHelper.saveData(key: 'roomId',value: roomProvider.rooms[index].id);
                          // CashHelper.saveData(key: 'roomName',value:  roomProvider.rooms[index].room.name);
                          // CashHelper.saveData(key: 'roomLogo',value: roomProvider.rooms[index].room.logo);
                          //
                          // // Navigator.push(
                          // //     context, GlobalFunction.route(RoomDivices(room_id:roomProvider.rooms[index].id,name:roomProvider.rooms[index].room.name ,route: 2,))
                          // // );

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
                                    child: Image.network( roomProvider.userRooms[index].roomLogo!,fit: BoxFit.contain,),

                                  ),
                                  SizedBox(width: 10,),
                                  Container(
                                    height: MediaQuery.of(context).size.height*.11,
                                    padding: EdgeInsets.only(
                                        top: MediaQuery.of(context).size.height*.01,
                                        bottom: MediaQuery.of(context).size.height*.01
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text( roomProvider.userRooms[index].roomName!,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                        // Text(" ${roomProvider.rooms[index].devices.toString()} ${translator.translate('devices')} ",style: TextStyle(fontSize: 11,))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height*.03
                                ),
                                child: Row(
                                  children: [
                                    // GestureDetector(
                                    //   onTap: (){
                                    //
                                    //     // Navigator.push(context, GlobalFunction.route(EditRoom(userRoomModel: roomProvider.rooms[index],)));
                                    //   },
                                    //   child: Padding(
                                    //     padding: const EdgeInsets.all(4.0),
                                    //     child: Icon(Icons.edit,size: 18,color: Colors.green,),
                                    //   ),
                                    // ),
                                    GestureDetector(
                                      onTap: (){
                                        print('Siiiiiiiiiiiiiiiiiii');
                                        print(roomProvider.userRooms[index].roomId!);
                                        roomProvider.UserRoomdelete(roomId: roomProvider.userRooms[index].roomId!);
                                        roomProvider.getUserRoom(CashHelper.getData(key: 'userId'));

                                        // confirmDelete(context,roomProvider.rooms[index].id,roomProvider.rooms[index].room.userId,roomProvider.rooms[index].room.id);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Icon(Icons.delete,size: 22,color: Colors.red,),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),

                    ],
                  ),
                );
              }),),
            ],
          ),
        ),
      ),
    );
  }
}
