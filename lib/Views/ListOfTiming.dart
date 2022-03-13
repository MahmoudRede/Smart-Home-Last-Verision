import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Provider/DeviceProvider.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/Custom/CustomAppBar.dart';
import 'package:fssmarthome/Views/EditTiming.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'Custom/GlobalFunction.dart';
class ListOfTiming extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends  State<ListOfTiming>{
  bool loading =true;
  loadData()async{
    var deviceProvider= Provider.of<DeviceProvider>(context, listen: false);
   await  deviceProvider.getTiming();
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
            left: MediaQuery.of(context).size.width*.03,
            right: MediaQuery.of(context).size.width*.03,
          ),
          child: Column(
            children: [
              CustomAppBar(title:translator.translate("ListOfSignals")),
              SizedBox(height: MediaQuery.of(context).size.height*.035,),
              Expanded(child:deviceProvider.times.length==0? Center(
                child: Text(translator.translate("NoTimingAddedBefore"),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.red),),
              ):ListView.builder(itemCount: deviceProvider.times.length,itemBuilder: (context,index){
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
                      left: MediaQuery.of(context).size.width*.01,
                      right:  MediaQuery.of(context).size.width*.01
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height*.1,
                            width: MediaQuery.of(context).size.width*.1,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(AppTheme.yellowColor)
                            ),
                            alignment: Alignment.center,
                            child: Text("${index+1}",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*.02,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(translator.translate("StartTime"),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 9,color: Color(AppTheme.yellowColor)),),
                                  SizedBox(width: 3,),
                                  Text(deviceProvider.times[index].startTime,style: TextStyle(fontSize: 10),)
                                ],
                              ),
                              SizedBox(height: 13,),
                              Row(
                                children: [
                                  Text(translator.translate("EndTime"),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 9,color: Color(AppTheme.yellowColor)),),
                                  SizedBox(width: 3,),
                                  Text(deviceProvider.times[index].endTime,style: TextStyle(fontSize: 10),)
                                ],
                              ),
                            ],
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*.025,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(translator.translate("Sat"),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10,color: Color(AppTheme.yellowColor)),),
                                  SizedBox(width: 3,),
                                  deviceProvider.times[index].days.contains("sat")? Icon(Icons.check,size: 15,color: Color(AppTheme.primaryColor),):Icon(Icons.circle,size: 7,color: Color(AppTheme.primaryColor),)
                                ],
                              ),
                              Row(
                                children: [
                                  Text(translator.translate("Sun"),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10,color: Color(AppTheme.yellowColor)),),
                                  SizedBox(width: 3,),
                                  deviceProvider.times[index].days.contains("sun")? Icon(Icons.check,size: 15,color: Color(AppTheme.primaryColor),):Icon(Icons.circle,size: 7,color: Color(AppTheme.primaryColor),)
                                ],
                              ),
                              Row(
                                children: [
                                  Text(translator.translate("Mon"),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10,color: Color(AppTheme.yellowColor)),),
                                  SizedBox(width: 3,),
                                  deviceProvider.times[index].days.contains("mon")? Icon(Icons.check,size: 15,color: Color(AppTheme.primaryColor),):Icon(Icons.circle,size: 7,color: Color(AppTheme.primaryColor),)
                                ],
                              ),
                            ],
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*.015,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(translator.translate("Tus"),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10,color: Color(AppTheme.yellowColor)),),
                                  SizedBox(width: 3,),
                                  deviceProvider.times[index].days.contains("tue")? Icon(Icons.check,size: 15,color: Color(AppTheme.primaryColor),):Icon(Icons.circle,size: 7,color: Color(AppTheme.primaryColor),)
                                ],
                              ),
                              Row(
                                children: [
                                  Text(translator.translate("Wed"),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10,color: Color(AppTheme.yellowColor)),),
                                  SizedBox(width: 3,),
                                  deviceProvider.times[index].days.contains("wed")? Icon(Icons.check,size: 15,color: Color(AppTheme.primaryColor),):Icon(Icons.circle,size: 7,color: Color(AppTheme.primaryColor),)
                                ],
                              ),
                              Row(
                                children: [
                                  Text(translator.translate("Thr"),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10,color: Color(AppTheme.yellowColor)),),
                                  SizedBox(width: 3,),
                                  deviceProvider.times[index].days.contains("thr")? Icon(Icons.check,size: 15,color: Color(AppTheme.primaryColor),):Icon(Icons.circle,size: 7,color: Color(AppTheme.primaryColor),)
                                ],
                              ),
                            ],
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*.015,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(translator.translate("Fri"),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10,color: Color(AppTheme.yellowColor)),),
                                  SizedBox(width: 3,),
                                  deviceProvider.times[index].days.contains("fri")? Icon(Icons.check,size: 15,color: Color(AppTheme.primaryColor),):Icon(Icons.circle,size: 7,color: Color(AppTheme.primaryColor),)
                                ],
                              ),
                              SizedBox(height: 32,)
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, GlobalFunction.route(EditTiming(timingModel: deviceProvider.times[index])));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Icon(Icons.edit,size: 19,),
                            ),
                          ),
                          GestureDetector(
                             onTap: ()=>confirmDelete(context, deviceProvider.times[index].id),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
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
                            await deviceProvider.deleteTiming(id);
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