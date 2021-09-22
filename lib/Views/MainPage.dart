import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Theme/StaticList.dart';

class MainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<MainPage>{
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        confirmCloseApp(context);
        return true;
      },
      child: Scaffold(
        backgroundColor: Color(AppTheme.backGround),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height*.02
            ),
            child:Column(

              children: [
                Container(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width*.05,
                      right: MediaQuery.of(context).size.width*.05
                  ),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height*.05,),
                      Text("Welcome Home",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black87),),
                      Text("Sharaf",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      SizedBox(height: MediaQuery.of(context).size.height*.005,),
                      Container(
                        height: MediaQuery.of(context).size.height*.15,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("assets/images/weather.png",
                              width: MediaQuery.of(context).size.width*.25,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*.3,
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height*.015,
                                bottom: MediaQuery.of(context).size.height*.015,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text("Good Morning ",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
                                  Text("Sunday",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Color(AppTheme.yellowColor)),),
                                  Text("12-09-2020",style: TextStyle(fontSize: 10),)
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("31",style: TextStyle(color: Color(AppTheme.yellowColor),fontSize: 30,fontWeight: FontWeight.bold),),
                                  SizedBox(width: 5,),
                                  Padding(
                                    padding:  EdgeInsets.only(
                                        top: MediaQuery.of(context).size.height*.02
                                    ),
                                    child: Container(
                                      width: 5,height: 5,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                          border: Border.all(color: Color(AppTheme.yellowColor),width: 1),
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                  Text("c",style: TextStyle(color: Color(AppTheme.yellowColor),fontSize: 30,fontWeight: FontWeight.bold),),
                                  SizedBox(width: 15,),
                                ],
                              ),
                            )
                          ],),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.005,),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Rooms",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                            Row(
                              children: [
                                Text("Edit",style: TextStyle(fontSize: 10),),
                                SizedBox(width: 5,),
                                Icon(Icons.edit,size: 15,)
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.005,),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*.15,
                  child: ListView.builder(
                    itemCount: StaticList.RoomImages.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                    return Row(
                      children: [
                        SizedBox(width: MediaQuery.of(context).size.width*.05,),
                        Container(
                          width: MediaQuery.of(context).size.width*.25,
                          height: MediaQuery.of(context).size.height*.15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.white
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: MediaQuery.of(context).size.height*.01,),
                              Image.asset(StaticList.RoomImages[index],
                                width: MediaQuery.of(context).size.width*.25,
                                height: MediaQuery.of(context).size.height*.07,
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height*.01,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(StaticList.RoomNames[index],style: TextStyle(height: 1.4,fontSize: 12),),
                                  Text("2 device",style: TextStyle(fontSize: 9),),
                                ],
                              )
                            ],
                          ),
                        ),

                      ],
                    );
                  }),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*.01,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width*.05,
                    right: MediaQuery.of(context).size.width*.05
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Lasted Worked Devices",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*.01,),
                GridView.builder(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .03,
                      right: MediaQuery.of(context).size.width * .03),
                  primary: false,
                  shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1 / 1.4),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.black12.withOpacity(.1),width: 1),
                        color: Color(AppTheme.backGround2).withOpacity(.18),
                      ),
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width*.02,
                        right: MediaQuery.of(context).size.width*.02,
                        bottom: MediaQuery.of(context).size.height*.01
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width*.15,
                            height: MediaQuery.of(context).size.height*.08,
                            margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height*.01,
                              bottom: MediaQuery.of(context).size.height*.01
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                border: Border.all(color: Colors.black12,width: 1),
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
                            padding: EdgeInsets.all(8),
                            child: Image.asset(StaticList.DevicesImages[index]),

                          ),
                          Text(StaticList.DevicesNames[index],style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,height: 1.4),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("On",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,height: 1.5),),
                              FlutterSwitch(
                                height: 15.0,
                                width: 35.0,
                                padding: 4.0,
                                toggleSize: 9.0,
                                borderRadius: 10.0,
                                inactiveColor: Colors.white,
                                inactiveToggleColor: Colors.black26,
                                activeColor: Color(AppTheme.primaryColor),
                                value:true,
                                onToggle: (value) {
                                  setState(() {

                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                )

              ],
            ),
          ),
        ),
      ),
    );

  }
  confirmCloseApp(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
          child:  Container(
            padding: EdgeInsets.only(
                left: 10,
                right: 10
            ),
            height: 150.0,
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
                      Icon(Icons.warning_amber_sharp,size: 50,),
                      SizedBox(height: 3,),
                      Text("Are You Sure Close App",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
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
                            child:   Text( "Cancel",style: TextStyle(color:Colors.black,fontSize: 13),),
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
                            child:   Text("Confirm",style: TextStyle(color:Colors.white,fontSize: 13),),
                          ),
                          onTap: () async {
                            SystemNavigator.pop();
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
