import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/Custom/CustomAppBar.dart';
import 'package:fssmarthome/Views/Custom/GlobalFunction.dart';
import 'package:fssmarthome/Views/RoomDevices.dart';

class AllRooms extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<AllRooms>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppTheme.backGround),
      body: Container(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width*.05,
          right: MediaQuery.of(context).size.width*.05
        ),
        child:Column(
          children: [
            CustomAppBar(title: "All Rooms"),
            SizedBox(height: MediaQuery.of(context).size.height*.03,),
            Expanded(child: ListView.builder(itemCount: 3,itemBuilder: (context,index){
              return Container(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context, GlobalFunction.route(RoomDivices()));
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
                                  border: Border.all(color: Colors.black12,width: 1),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(3, 3), // changes position of shadow
                                    ),
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(-3, -3), // changes position of shadow
                                    ),
                                  ],
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.all(8),
                                child: Image.asset("assets/images/rooms/livingroom.png"),

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
                                    Text("Living Room",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                    Text("2 devices",style: TextStyle(fontSize: 12,))
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
                                Icon(Icons.edit,size: 18,color: Colors.green,),
                                SizedBox(width: 7,),
                                Icon(Icons.delete,size: 18,color: Colors.red,)
                              ],
                            ),
                          )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    index==2?Container(
                      child: Row(
                        children: [
                          Icon(Icons.add,color: Color(AppTheme.yellowColor),size: 30,),
                          Text("Add New Room",style: TextStyle(color: Color(AppTheme.yellowColor),fontSize: 16),)
                        ],
                      ),
                    ):SizedBox(),

                  ],
                ),
              );
            }),)
          ],
        ),
      ),
    );

  }
}
