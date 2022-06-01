import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fssmarthome/Models/DeviceRealModel.dart';
import 'package:fssmarthome/Provider/DeviceProvider.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

class Motion extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<Motion>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var deviceProvider= Provider.of<DeviceProvider>(context, listen: false);
    print(deviceProvider.roomDevices[deviceProvider.SelectedIndex].device.id);
    print(deviceProvider.roomDevices[deviceProvider.SelectedIndex].id);
    print(deviceProvider.roomDevices[deviceProvider.SelectedIndex].active);
    print(deviceProvider.roomDevices[deviceProvider.SelectedIndex].reading);
    print("ssssssssssssssssssssssssssssssssssssssssssssssss");
  }
  @override
  Widget build(BuildContext context) {
    var deviceProvider= Provider.of<DeviceProvider>(context, listen: true);
    return Directionality(
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
            SizedBox( height: MediaQuery.of(context).size.height*.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(translator.translate('Event Action'),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                SizedBox(width:MediaQuery.of(context).size.width*.05 ,),
                FlutterSwitch(
                  height: 15.0,
                  width: 30.0,
                  padding: 4.0,
                  toggleSize: 9.0,
                  borderRadius: 10.0,
                  inactiveColor: Colors.black12,
                  inactiveToggleColor: Colors.black26,
                  activeColor: Color(AppTheme.primaryColor),
                  value:deviceProvider.roomDevices[deviceProvider.SelectedIndex].eventAction==null?false:deviceProvider.roomDevices[deviceProvider.SelectedIndex].eventAction=="1"?true:false,
                  onToggle: (value) {
                    if(deviceProvider.roomDevices[deviceProvider.SelectedIndex].eventAction=="1"){
                      deviceProvider.roomDevices[deviceProvider.SelectedIndex].eventAction="0";
                      setState(() {
                      });
                    }
                    else{
                      deviceProvider.roomDevices[deviceProvider.SelectedIndex].eventAction="1";
                      setState(() {
                      });
                    }
                    deviceProvider.UpdateDeviceData(deviceProvider.roomDevices[deviceProvider.SelectedIndex]);
                  }
                ),

              ],
            ),
            SizedBox( height: MediaQuery.of(context).size.height*.035),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*.06,
                  height: MediaQuery.of(context).size.width*.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Color(AppTheme.primaryColor)
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*.045,
                  height: MediaQuery.of(context).size.width*.045,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: Color(AppTheme.primaryColor).withOpacity(.5)
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*.04,
                  height: MediaQuery.of(context).size.width*.04,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: Color(AppTheme.primaryColor).withOpacity(.2)
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*.42,
                  height: MediaQuery.of(context).size.width*.42,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: Color(AppTheme.primaryColor),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(3, 3), // changes position of shadow
                      ),
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(-3, -3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/devices/motion-yes.png",
                        width: MediaQuery.of(context).size.width*.12,
                        height: MediaQuery.of(context).size.width*.12,
                      ),
                      SizedBox(height:MediaQuery.of(context).size.width*.02,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(translator.translate('Moverment')+": ",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
                          Text(deviceProvider.roomDevices[deviceProvider.SelectedIndex].reading=="1"?"Yes":"No",style: TextStyle(color: Color(AppTheme.yellowColor),fontSize: 12,fontWeight: FontWeight.bold))
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*.04,
                  height: MediaQuery.of(context).size.width*.04,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: Color(AppTheme.primaryColor).withOpacity(.2)
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*.045,
                  height: MediaQuery.of(context).size.width*.045,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: Color(AppTheme.primaryColor).withOpacity(.5),

                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*.06,
                  height: MediaQuery.of(context).size.width*.06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: Color(AppTheme.primaryColor)
                  ),
                ),
              ],
            ),
            SizedBox( height: MediaQuery.of(context).size.height*.035),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(translator.translate('Device Action'),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                SizedBox(width:MediaQuery.of(context).size.width*.05 ,),

                FlutterSwitch(
                  height: 15.0,
                  width: 30.0,
                  padding: 4.0,
                  toggleSize: 9.0,
                  borderRadius: 10.0,
                  inactiveColor: Colors.black12,
                  inactiveToggleColor: Colors.black26,
                  activeColor: Color(AppTheme.primaryColor),
                  value:deviceProvider.roomDevices[deviceProvider.SelectedIndex].relay==null?false:deviceProvider.roomDevices[deviceProvider.SelectedIndex].relay=="1"?true:false,
                  onToggle: (value) {
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
                  },
                )
              ],
            ),
            SizedBox( height: MediaQuery.of(context).size.height*.02),

          ],
        ),
      ),
    );
  }
}