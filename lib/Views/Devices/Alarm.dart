import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fssmarthome/Provider/DeviceProvider.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/Custom/GlobalFunction.dart';
import 'package:fssmarthome/Views/Devices/AddAlarm.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

class Alarm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<Alarm>{
  bool loading=true;
  loadData()async{
    var deviceProvider= Provider.of<DeviceProvider>(context, listen: false);
    await deviceProvider.getAlarms(deviceProvider.roomDevices[deviceProvider.SelectedIndex].id);
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
    return loading?Container(
      height: MediaQuery.of(context).size.height*.65,
      child: Center(child: CircularProgressIndicator.adaptive(),),
    ):Directionality(
      textDirection:translator.currentLanguage == 'ar' ?  TextDirection.rtl : TextDirection.ltr,
      child: Container(
       width: MediaQuery.of(context).size.width*.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white
        ),
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width*.05,
          right: MediaQuery.of(context).size.width*.05
        ),
        child: Column(
          children: [
            SizedBox( height: MediaQuery.of(context).size.height*.01),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(translator.translate('AlermClock'),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                 Switch(value:deviceProvider.roomDevices[deviceProvider.SelectedIndex].relay==null?false:deviceProvider.roomDevices[deviceProvider.SelectedIndex].relay=="1"?true:false,
                     onChanged: (value) {
                       if(deviceProvider.roomDevices[deviceProvider.SelectedIndex].relay=="1"){
                         deviceProvider.roomDevices[deviceProvider.SelectedIndex].relay="0";
                         setState(() {
                         });
                       }
                       else{
                         deviceProvider.roomDevices[deviceProvider.SelectedIndex].relay="1";
                         setState(() {
                         });
                       }
                       deviceProvider.UpdateDeviceData(deviceProvider.roomDevices[deviceProvider.SelectedIndex]);
                     })
               ],
             ),
            SizedBox( height: MediaQuery.of(context).size.height*.01),
            Container(
              child: ListView.builder(
              itemCount: deviceProvider.alarms.length,
              shrinkWrap: true,
              primary: false
              ,itemBuilder: (context,index){
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xffededed)
                  ),
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width*.03,
                    right: MediaQuery.of(context).size.width*.03,
                    top: MediaQuery.of(context).size.height*.01,
                    bottom: MediaQuery.of(context).size.height*.01
                  ),
                  margin: EdgeInsets.only(
                    bottom: 10
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                     children: [
                       GestureDetector(
                         onTap: (){
                           if(deviceProvider.alarms[index].notify=="1"){
                             deviceProvider.alarms[index].notify="0";
                             setState(() {
                             });
                           }else{
                             deviceProvider.alarms[index].notify="1";
                             setState(() {
                             });
                           }
                           deviceProvider.UpdateAlarm(deviceProvider.alarms[index]);
                         },
                         child: Container(
                           height: 35,width: 35,
                           padding: EdgeInsets.all(7),
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(100),
                               color: Colors.white
                           ),
                           child:deviceProvider.alarms[index].notify=="1"? Image.asset("assets/images/alarm 1.png"):Image.asset("assets/images/disable-alarm 1.png"),
                         ),
                       ),
                       SizedBox(width: 7,),
                       Text(deviceProvider.alarms[index].time,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                     ],
                   ),
                      FlutterSwitch(
                        height: 15.0,
                        width: 35.0,
                        padding: 4.0,
                        toggleSize: 9.0,
                        borderRadius: 10.0,
                        inactiveColor: Colors.white,
                        inactiveToggleColor: Colors.black26,
                        activeColor: Color(AppTheme.yellowColor),
                        value: deviceProvider.alarms[index].active==1?true:false,
                        onToggle: (value) {
                        if(deviceProvider.alarms[index].active==1){
                          deviceProvider.alarms[index].active=0;
                          setState(() {
                          });
                        }else{
                          deviceProvider.alarms[index].active=1;
                          setState(() {
                          });
                        }
                        deviceProvider.UpdateAlarm(deviceProvider.alarms[index]);
                        },
                      )
                    ],
                  ),
                );

              }),
            ),
            SizedBox( height: MediaQuery.of(context).size.height*.03),
            GestureDetector(
              onTap: (){
                Navigator.push(
                    context, GlobalFunction.routeBottom(AddAlarm()));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(1000)),
                  color: Color(AppTheme.yellowColor)
                ),
                child: Icon(Icons.add,size: 30,color: Colors.white,),
              ),
            ),
            SizedBox( height: MediaQuery.of(context).size.height*.03),
          ],
        ),
      ),
    );
  }
}