import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Provider/DeviceProvider.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/Custom/CustomAppBar.dart';
import 'package:fssmarthome/Views/EditVoice.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'package:fssmarthome/Views/Custom/GlobalFunction.dart';
class ListOfVoice extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends  State<ListOfVoice>{
  bool loading =true;
  loadData()async{
    var deviceProvider= Provider.of<DeviceProvider>(context, listen: false);
    await  deviceProvider.getVoices();
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
      body: loading?Center(child: CircularProgressIndicator.adaptive(),):
      Directionality(
        textDirection:translator.currentLanguage == 'ar' ?  TextDirection.rtl : TextDirection.ltr,
        child: Container(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width*.05,
            right: MediaQuery.of(context).size.width*.05,
          ),
          child: Column(
            children: [
              CustomAppBar(title:translator.translate("ListOfVoiceControl")),
              SizedBox(height: MediaQuery.of(context).size.height*.05,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Text(translator.translate("ListOfVoices"),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                 ],
               ),
              SizedBox(height: MediaQuery.of(context).size.height*.02,),
              Expanded(child:deviceProvider.voices.length==0? Center(
                child: Text(translator.translate("NoVoicesAddedBefore"),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.red),),
              ):ListView.builder(itemCount: deviceProvider.voices.length,itemBuilder: (context,index){
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
                                  Text("${translator.translate("Phrase")} : ",style: TextStyle(fontSize: 11,color: Color(AppTheme.yellowColor))),
                                  Text(deviceProvider.voices[index].phrase,style: TextStyle(fontSize: 11),)
                                ],
                              ),
                              Row(
                                children: [
                                  Text("${translator.translate("Phrase_Open")} : ",style: TextStyle(fontSize: 11,color: Color(AppTheme.yellowColor))),
                                  Text(deviceProvider.voices[index].phraseOpen,style: TextStyle(fontSize: 11),)
                                ],
                              ),
                              Row(
                                children: [
                                  Text("${translator.translate("Phrase_Close")}: ",style: TextStyle(fontSize: 11,color: Color(AppTheme.yellowColor))),
                                  Text(deviceProvider.voices[index].phraseClose,style: TextStyle(fontSize: 11),)
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
                              Navigator.push(context, GlobalFunction.route(EditVoice(voiceModel: deviceProvider.voices[index])));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Icon(Icons.edit,size: 18,),
                            ),
                          ),
                          GestureDetector(
                            onTap: ()=>confirmDelete(context, deviceProvider.voices[index].id),
                            child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Icon(Icons.delete,size: 18,)),
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
                            await deviceProvider.deleteVoice(id);
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