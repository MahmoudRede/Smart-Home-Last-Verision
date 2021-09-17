import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/Custom/CustomAppBar.dart';

class RemoteControl extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<RemoteControl>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(AppTheme.backGround),
      body:Container(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width*.05,
          right: MediaQuery.of(context).size.width*.05,
        ),
        child: Column(
          children: [
            CustomAppBar(title: "Remote Control"),
            SizedBox(height: MediaQuery.of(context).size.height*.15,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*.4,
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width*.025,
                right: MediaQuery.of(context).size.width*.025,
              ),
              decoration: BoxDecoration(
                borderRadius:BorderRadius.all(Radius.circular(10)),
                color: Colors.white
              ),
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width*.14,
                right:  MediaQuery.of(context).size.width*.14,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Select Device",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
                  Container(
                    width: MediaQuery.of(context).size.width*.7,
                    height: MediaQuery.of(context).size.height*.04,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38,width: 1)
                    ),
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width*.02,
                      right: MediaQuery.of(context).size.width*.02
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Tv"),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*.15,
                        width: MediaQuery.of(context).size.width*.09,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26,width: 1),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height*.01,
                          bottom: MediaQuery.of(context).size.height*.01
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.add,size: 27,),
                            Icon(Icons.remove,size: 27,)
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height*.06,
                        width: MediaQuery.of(context).size.height*.06,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black26,width: 1),
                            borderRadius: BorderRadius.circular(20),
                          color: Color(AppTheme.yellowColor)
                        ),
                        alignment: Alignment.center,
                        child: Text("OK",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height*.15,
                        width: MediaQuery.of(context).size.width*.09,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black26,width: 1),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height*.01,
                            bottom: MediaQuery.of(context).size.height*.01
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.arrow_drop_up,size: 27,),
                            Icon(Icons.arrow_drop_down,size: 27,)
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*.06,
                        width: MediaQuery.of(context).size.height*.06,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black26,width: 1)
                        ),
                        padding: EdgeInsets.all(6),
                        child: Image.asset("assets/images/shutdown.png"),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.02,),
            Container(
              width: MediaQuery.of(context).size.width*.25,
              height: MediaQuery.of(context).size.height*.05,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(AppTheme.primaryColor)
              ),
              alignment: Alignment.center,
              child: Text("Edit",style: TextStyle(fontSize: 15,color: Colors.white),),

            )
          ],
        ),
      )
    );

  }
}
