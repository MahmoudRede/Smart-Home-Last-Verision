import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Theme/StaticList.dart';
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
    return WillPopScope(
      onWillPop: ()async{
        Navigator.pushNamedAndRemoveUntil(context,"/mainPage", (route) => false);
        return true;
      },
      child: Scaffold(
        backgroundColor: Color(AppTheme.backGround),
        body: Container(
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
                    onTap: (){
                      Navigator.pushNamedAndRemoveUntil(context,"/mainPage", (route) => false);
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
                      left: MediaQuery.of(context).size.width*.02,
                      right: MediaQuery.of(context).size.width*.02,
                    ),
                    child: Text("All Rooms",textAlign: TextAlign.center,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Color(AppTheme.yellowColor)),),
                  ),
                  Icon(Icons.arrow_back_ios,color: Color(AppTheme.backGround),)
                ],
              ),
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
                      index==2?GestureDetector(
                        onTap: ()=>ChooseRoom(),
                        child: Container(
                          child: Row(
                            children: [
                              Icon(Icons.add,color: Color(AppTheme.yellowColor),size: 30,),
                              Text("Add New Room",style: TextStyle(color: Color(AppTheme.yellowColor),fontSize: 16),)
                            ],
                          ),
                        ),
                      ):SizedBox(),

                    ],
                  ),
                );
              }),)
            ],
          ),
        ),
      ),
    );
  }
 ChooseRoom(){
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
                  Text("Choose New Room",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Color(AppTheme.yellowColor)),),
                    SizedBox(height:  MediaQuery.of(context).size.height*.025),
                  Expanded(
                    child: ListView.builder(
                        itemCount: StaticList.RoomImages.length,
                        itemBuilder: (context,index){
                      return GestureDetector(
                        onTap: () {
                          setState((){
                            select=index;
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
                                  select==index? Icon(Icons.check_circle_outline,color: Color(AppTheme.yellowColor),):Icon(Icons.circle_outlined,color: Color(AppTheme.primaryColor),)
                                  , SizedBox(width: 15,),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.black26,width: 1)
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(StaticList.RoomImages[index],
                                        width: MediaQuery.of(context).size.width*.15,
                                        height: MediaQuery.of(context).size.height*.05,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15,),
                                  Text(StaticList.RoomNames[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)

                                ],
                              ),
                            ),
                            index==StaticList.RoomImages.length-1?GestureDetector(
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
                                    Text("Add Another ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
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
                        onTap: (){
                          Navigator.pop(context);
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
                          child: Text("Add",style: TextStyle(color: Color(AppTheme.yellowColor),fontSize: 16,fontWeight: FontWeight.bold),),
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
                          child: Text("Back",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
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
  AddOther(){
    TextEditingController name =new TextEditingController();
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
                  top: MediaQuery.of(context).size.height*.08,
                  bottom: MediaQuery.of(context).size.height*.08
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Add Other Room",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Color(AppTheme.yellowColor)),),
                  SizedBox(height:  MediaQuery.of(context).size.height*.025),
                  Expanded(
                    child: Padding(
                      padding:  EdgeInsets.only(
                        left: MediaQuery.of(context).size.width*.05,
                        right: MediaQuery.of(context).size.width*.05,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                         TextFormField(
                           controller: name,
                           decoration: InputDecoration(
                             contentPadding: EdgeInsets.only(left: 10,right: 10),
                             hintText: "Room Name"
                           ),
                         ),
                          SizedBox(height: MediaQuery.of(context).size.height*.05,),
                          Stack(
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
                          )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
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
                          child: Text("Add",style: TextStyle(color: Color(AppTheme.yellowColor),fontSize: 16,fontWeight: FontWeight.bold),),
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
                          child: Text("Back",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
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
}
