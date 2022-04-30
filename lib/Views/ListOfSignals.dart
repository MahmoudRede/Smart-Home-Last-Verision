import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/Custom/CustomAppBar.dart';
import 'package:fssmarthome/Views/EditRemote.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

import '../Provider/DeviceProvider.dart';
import 'Custom/GlobalFunction.dart';

class ListOfSignals extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends  State<ListOfSignals>{
  bool loading=true;
  loadData()async{
    var deviceProvider= Provider.of<DeviceProvider>(context, listen: false);
    await deviceProvider.getRemotes();
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
    var deviceProvider= Provider.of<DeviceProvider>(context, listen: true);
    return SafeArea(child: Scaffold(
      backgroundColor: Color(AppTheme.backGround),
      body: loading?Center(child: CircularProgressIndicator.adaptive(),):Directionality(
        textDirection:translator.currentLanguage == 'ar'?  TextDirection.rtl : TextDirection.ltr,
        child: Container(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width*.05,
            right: MediaQuery.of(context).size.width*.05,
          ),
          child: Column(
            children: [
              CustomAppBar(title: translator.translate('ListOfSignals')),
              SizedBox(height: MediaQuery.of(context).size.height*.035,),
              Expanded(child: ListView.builder(itemCount: deviceProvider.remotes.length,itemBuilder: (context,index){
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
                            padding: EdgeInsets.only(left: 3,right: 3),
                            child: Text(deviceProvider.remotes[index].name??"",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*.03,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.add,size: 22,color: Color(AppTheme.yellowColor),),
                                  SizedBox(width: 3,),
                                  Text(deviceProvider.remotes[index].plusbtn??"",style: TextStyle(fontSize: 11),)
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.remove,size: 22,color: Color(AppTheme.yellowColor),),
                                  SizedBox(width: 3,),
                                  Text(deviceProvider.remotes[index].minusbtn??"",style: TextStyle(fontSize: 11),)
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 2,),
                                  ImageIcon(AssetImage("assets/images/shutdown.png"),size: 17,color: Color(AppTheme.yellowColor),),
                                  SizedBox(width: 6,),
                                  Text(deviceProvider.remotes[index].powerbtn??"",style: TextStyle(fontSize: 11),)
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
                                  Text(deviceProvider.remotes[index].upbtn??"",style: TextStyle(fontSize: 11),)
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.arrow_drop_down,size: 25,color: Color(AppTheme.yellowColor),),
                                  SizedBox(width: 3,),
                                  Text(deviceProvider.remotes[index].downbtn??"",style: TextStyle(fontSize: 11),)
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 4,),
                                  Text("Ok",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Color(AppTheme.yellowColor)),),
                                  SizedBox(width: 6,),
                                  Text(deviceProvider.remotes[index].okbtn??"",style: TextStyle(fontSize: 11),)
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                  context, GlobalFunction.route(EditRemote(remoteModel: deviceProvider.remotes[index])));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Icon(Icons.edit,size: 19,),
                            ),
                          ),

                          GestureDetector(
                            onTap: (){
                              confirmDelete(context, deviceProvider.remotes[index].id);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Icon(Icons.delete,size: 19,),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }))
            ],
          ),
        ),
      ),
    ));
  }
  confirmDelete(BuildContext context,var id) {
    var deviceProvider= Provider.of<DeviceProvider>(context, listen: false);
    showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
          child:  Container(
            padding: EdgeInsets.only(
                left: 10,
                right: 10
            ),
            height: 130.0,
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
                      SizedBox(height: 3,),
                      Text(translator.translate("ConfirmDeleteThisItem"),style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                      // Text("${title}",textAlign: TextAlign.center,)
                    ],
                  )),
                  SizedBox(height: 20,),
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
                            child:   Text(translator.translate("Cancel"),style: TextStyle(color:Colors.black,fontSize: 13),),
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
                            child:   Text(translator.translate("Confirm"),style: TextStyle(color:Colors.white,fontSize: 13),),
                          ),
                          onTap: () async {
                            await deviceProvider.deleteRemote(id);
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