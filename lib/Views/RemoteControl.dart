import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/CreateSignal.dart';
import 'package:fssmarthome/Views/Custom/CustomAppBar.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

import '../Models/RemoteModel.dart';
import '../Provider/DeviceProvider.dart';
import 'Custom/GlobalFunction.dart';

class RemoteControl extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<RemoteControl>{
  bool loading=true;
  late RemoteModel remoteModel;
  int select=0;
  bool plus=false;
  bool mins=false;
  bool top=false;
  bool down=false;
  bool shutdown=false;
  bool power =false;
  loadData()async{
    var deviceProvider= Provider.of<DeviceProvider>(context, listen: false);
    await deviceProvider.getRemotes();
    setState(() {
      loading=false;
    });
  }
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    loadData();
  }
  @override
  Widget build(BuildContext context) {
    var deviceProvider= Provider.of<DeviceProvider>(context, listen: true);
    return WillPopScope(
      onWillPop: ()async{
        Navigator.pushNamedAndRemoveUntil(context,"/mainPage", (route) => false);
        return true;
      },
      child: Scaffold(
         backgroundColor: Color(AppTheme.backGround),
        body:Directionality(
          textDirection:translator.currentLanguage == 'ar' ?  TextDirection.rtl : TextDirection.ltr,
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
                      child: Text(translator.translate('RemoteControl'),textAlign: TextAlign.center,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Color(AppTheme.yellowColor)),),
                    ),
                    Icon(Icons.arrow_back_ios,color: Color(AppTheme.backGround),)
                  ],
                ),
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
                      Text(translator.translate('SelectDevice'),style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
                      GestureDetector(
                        onTap: (){
                          SelectRemote(context);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width*.7,
                          height: MediaQuery.of(context).size.height*.04,
                          decoration: BoxDecoration(
                            border: Border.all(color:select!=0?Colors.black38:Colors.red,width: 1)
                          ),
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width*.02,
                            right: MediaQuery.of(context).size.width*.02
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(select==0?translator.translate('SelectDevice'):remoteModel.name),
                              Icon(Icons.arrow_drop_down)
                            ],
                          ),
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
                                GestureDetector(
                                    onTap: ()async{
                                        if(select !=0){
                                          setState(() {
                                            plus=true;
                                          });
                                          await deviceProvider.updateRemote2(remoteModel.id, remoteModel.plusbtn, remoteModel.name, remoteModel.plusbtn, remoteModel.minusbtn, remoteModel.upbtn, remoteModel.downbtn, remoteModel.powerbtn, remoteModel.okbtn);
                                          setState(() {
                                            plus=false;
                                          });
                                        }
                                      },child: Icon(Icons.add,size: 27,color: plus?Colors.red:Colors.black)),
                                GestureDetector(
                                    onTap: ()async{
                                        if(select !=0){
                                          setState(() {
                                            mins=true;
                                          });
                                          await  deviceProvider.updateRemote2(remoteModel.id, remoteModel.minusbtn, remoteModel.name, remoteModel.plusbtn, remoteModel.minusbtn, remoteModel.upbtn, remoteModel.downbtn, remoteModel.powerbtn, remoteModel.okbtn);
                                          setState(() {
                                            mins=false;
                                          });
                                        }
                                      },child: Icon(Icons.remove,size: 27,color: mins?Colors.red:Colors.black,))
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: ()async{
                              if(select !=0){
                                setState(() {
                                  shutdown=true;
                                });
                                await deviceProvider.updateRemote2(remoteModel.id, remoteModel.okbtn, remoteModel.name, remoteModel.plusbtn, remoteModel.minusbtn, remoteModel.upbtn, remoteModel.downbtn, remoteModel.powerbtn, remoteModel.okbtn);
                                setState(() {
                                  shutdown=false;
                                });
                              }
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height*.06,
                              width: MediaQuery.of(context).size.height*.06,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black26,width: 1),
                                  borderRadius: BorderRadius.circular(20),
                                color: shutdown?Colors.black12:Color(AppTheme.yellowColor)
                              ),
                              alignment: Alignment.center,
                              child: Text(translator.translate('OK'),style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),
                            ),
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
                                GestureDetector(
                                    onTap: ()async{
                                      if(select !=0){
                                        setState(() {
                                          top=true;
                                        });
                                        await deviceProvider.updateRemote2(remoteModel.id, remoteModel.upbtn, remoteModel.name, remoteModel.plusbtn, remoteModel.minusbtn, remoteModel.upbtn, remoteModel.downbtn, remoteModel.powerbtn, remoteModel.okbtn);
                                        setState(() {
                                          top=false;
                                        });
                                      }
                                    },
                                    child: Icon(Icons.arrow_drop_up,size: 27,color: top?Colors.red:Colors.black,)),
                                GestureDetector(
                                    onTap: ()async{
                                       if(select !=0){
                                         setState(() {
                                           down=true;
                                         });
                                         await  deviceProvider.updateRemote2(remoteModel.id, remoteModel.downbtn, remoteModel.name, remoteModel.plusbtn, remoteModel.minusbtn, remoteModel.upbtn, remoteModel.downbtn, remoteModel.powerbtn, remoteModel.okbtn);
                                         setState(() {
                                           down=false;
                                         });
                                       }
                                    },child: Icon(Icons.arrow_drop_down,size: 27,color: down?Colors.red:Colors.black,))
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: ()async{
                              if(select !=0){
                                setState(() {
                                  power=true;
                                });
                                await deviceProvider.updateRemote2(remoteModel.id, remoteModel.powerbtn, remoteModel.name, remoteModel.plusbtn, remoteModel.minusbtn, remoteModel.upbtn, remoteModel.downbtn, remoteModel.powerbtn, remoteModel.okbtn);
                                setState((){
                                  power=false;
                                });
                              }
                            },
                             child: Container(
                              height: MediaQuery.of(context).size.height*.06,
                              width: MediaQuery.of(context).size.height*.06,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black26,width: 1)
                              ),
                              padding: EdgeInsets.all(6),
                              child: Image.asset("assets/images/shutdown.png",color: power?Colors.black12:Colors.red,),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*.02,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context, GlobalFunction.route(CreateSignal()));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width*.25,
                    height: MediaQuery.of(context).size.height*.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(AppTheme.primaryColor)
                    ),
                    alignment: Alignment.center,
                    child: Text(translator.translate('Edit'),style: TextStyle(fontSize: 15,color: Colors.white),),

                  ),
                )
              ],
            ),
          ),
        )
      ),
    );

  }
  SelectRemote(BuildContext context) {
    var deviceProvider= Provider.of<DeviceProvider>(context, listen: false);
    showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
          child:  Container(
            width: MediaQuery.of(context).size.width*.4,
            decoration: BoxDecoration(color: Colors.white,
              // borderRadius: BorderRadius.all(Radius.circular(20))
              // border: Border.all(color: Colors.black12,width: 2.0)
            )
            ,padding: EdgeInsets.only(
            top:  MediaQuery.of(context).size.height*0.01,
            bottom: MediaQuery.of(context).size.height*0.01,
            left: MediaQuery.of(context).size.width*0.05,
            right: MediaQuery.of(context).size.width*0.05,
          ),


            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: deviceProvider.remotes.length,
                    itemBuilder: (context,index){
                      return InkWell(
                          onTap: (){
                            setState(() {
                            remoteModel=deviceProvider.remotes[index];
                            select=deviceProvider.remotes[index].id;
                            });
                            Navigator.pop(context);
                          },
                          child:Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*.005,top: MediaQuery.of(context).size.height*.005),
                                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*.005,top: MediaQuery.of(context).size.height*.005),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    //color: Color(h.mainColor)
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(deviceProvider.remotes[index].name,style: TextStyle(color: Colors.black),)),
                              deviceProvider.remotes.length-1==index?SizedBox():Container(height: 1,width: MediaQuery.of(context).size.width,color:Color(AppTheme.primaryColor),)
                            ],
                          )
                      );
                    },
                  ),
                ],
              ),
            ),

          ),
        ));
  }
}
