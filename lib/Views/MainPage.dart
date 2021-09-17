import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      backgroundColor: Color(AppTheme.backGround),
      body: Container(
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
            SizedBox(height: MediaQuery.of(context).size.height*.005,),
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
            SizedBox(height: MediaQuery.of(context).size.height*.005,),
            Expanded(child: GridView.builder(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .03,
                  right: MediaQuery.of(context).size.width * .03),
              primary: false,
              shrinkWrap: true,
              itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1 / 1.4),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
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
                        child: Image.asset("assets/images/devices/alarm-clock 1.png"),

                      ),
                      Text("Alarm Colock",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,height: 1.4),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("On",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,height: 1.5),),
                          Container(
                              height: 15,
                              child: Switch(value: true, onChanged: (value){}))
                        ],
                      )
                    ],
                  ),
                );
              },
            ))

          ],
        ),
      ),
    );

  }
}
