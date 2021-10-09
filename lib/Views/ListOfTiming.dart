import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/Custom/CustomAppBar.dart';

class ListOfTiming extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends  State<ListOfTiming>{
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
            CustomAppBar(title: "List Of Signals"),
            SizedBox(height: MediaQuery.of(context).size.height*.035,),
            Expanded(child: ListView.builder(itemCount: 3,itemBuilder: (context,index){
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black12.withOpacity(.08),width: 1),
                    color: Colors.white
                ),
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height*.02
                ),
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height*.02,
                    bottom: MediaQuery.of(context).size.height*.02,
                    left: MediaQuery.of(context).size.width*.02,
                    right:  MediaQuery.of(context).size.width*.02
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height*.1,
                          width: MediaQuery.of(context).size.width*.18,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(AppTheme.yellowColor)
                          ),
                          alignment: Alignment.center,
                          child: Text("TV",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width*.03,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.add,size: 22,color: Color(AppTheme.yellowColor),),
                                SizedBox(width: 3,),
                                Text("2Hs4",style: TextStyle(fontSize: 11),)
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.remove,size: 22,color: Color(AppTheme.yellowColor),),
                                SizedBox(width: 3,),
                                Text("2Hs4",style: TextStyle(fontSize: 11),)
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: 2,),
                                ImageIcon(AssetImage("assets/images/shutdown.png"),size: 17,color: Color(AppTheme.yellowColor),),
                                SizedBox(width: 6,),
                                Text("2Hs4",style: TextStyle(fontSize: 11),)
                              ],
                            )
                          ],
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width*.1,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.arrow_drop_up,size: 25,color: Color(AppTheme.yellowColor),),
                                SizedBox(width: 3,),
                                Text("2Hs4",style: TextStyle(fontSize: 11),)
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.arrow_drop_down,size: 25,color: Color(AppTheme.yellowColor),),
                                SizedBox(width: 3,),
                                Text("2Hs4",style: TextStyle(fontSize: 11),)
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: 4,),
                                Text("Ok",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Color(AppTheme.yellowColor)),),
                                SizedBox(width: 6,),
                                Text("2Hs4",style: TextStyle(fontSize: 11),)
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.edit,size: 19,),
                        SizedBox(width: 5,),
                        Icon(Icons.delete,size: 19,),
                      ],
                    )
                  ],
                ),
              );
            }))
          ],
        ),
      ),
    ));
  }
}