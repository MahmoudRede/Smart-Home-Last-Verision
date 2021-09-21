import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/Custom/CustomAppBar.dart';

class ListOfVoice extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends  State<ListOfVoice>{
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
            CustomAppBar(title: "List Of Voice Control"),
            SizedBox(height: MediaQuery.of(context).size.height*.05,),
             Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Text("List Of Devices",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
               ],
             ),
            SizedBox(height: MediaQuery.of(context).size.height*.02,),
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
                  left: MediaQuery.of(context).size.width*.015,
                  right:  MediaQuery.of(context).size.width*.015
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height*.1,
                          width: MediaQuery.of(context).size.width*.16,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(AppTheme.yellowColor)
                          ),
                          alignment: Alignment.center,
                          child: Text((index+1).toString(),style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                        ),
                        SizedBox(width: 5,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("Phase : ",style: TextStyle(fontSize: 11,color: Color(AppTheme.yellowColor))),
                                Text("Hi",style: TextStyle(fontSize: 11),)
                              ],
                            ),
                            Row(
                              children: [
                                Text("Phase Open : ",style: TextStyle(fontSize: 11,color: Color(AppTheme.yellowColor))),
                                Text("Open The Door",style: TextStyle(fontSize: 11),)
                              ],
                            ),
                            Row(
                              children: [
                                Text("Phase Close : ",style: TextStyle(fontSize: 11,color: Color(AppTheme.yellowColor))),
                                Text("Close The Door",style: TextStyle(fontSize: 11),)
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.edit,size: 19,),
                        SizedBox(width: 2,),
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