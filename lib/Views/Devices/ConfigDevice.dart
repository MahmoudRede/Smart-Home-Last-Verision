import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:fssmarthome/Provider/DeviceProvider.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:fssmarthome/Views/Custom/GlobalFunction.dart';
import 'package:fssmarthome/Views/RoomDevices.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ConfigDevice extends StatefulWidget{
  int room_id;
  var room_name;
  int route;
  String key_;
  ConfigDevice({required this.room_id,required this.room_name,required this.route,required this.key_});
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<ConfigDevice>{
  var _dateTime;
  late WebViewController _webViewController;
  bool loading=false;

  @override
  Widget build(BuildContext context) {
    var deviceProvider= Provider.of<DeviceProvider>(context, listen: true);
    return WillPopScope(
      onWillPop: ()async{
          Navigator.push(
              context, GlobalFunction.route(RoomDivices(room_id:widget.room_id,name:widget.room_name ,route: widget.route,)));
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.black12,
        body: Container(
          child: Directionality(
            textDirection:translator.currentLanguage == 'ar' ?  TextDirection.rtl : TextDirection.ltr,
            child: Container(
              height: MediaQuery.of(context).size.height*.9,
              width: MediaQuery.of(context).size.width*.95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height*.4,
                  bottom: MediaQuery.of(context).size.height*.25,
                  left: MediaQuery.of(context).size.width*.025,
                  right: MediaQuery.of(context).size.width*.025
              ),
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height*.0,
                  bottom: MediaQuery.of(context).size.height*.07,
                  left: MediaQuery.of(context).size.width*.01,
                  right: MediaQuery.of(context).size.width*.01
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context, GlobalFunction.route(RoomDivices(room_id:widget.room_id,name:widget.room_name,route: widget.route,)));
                          },
                          child: Container(
                            width: 40,height: 40,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                color: Color(AppTheme.primaryColor)
                            ),
                            alignment: Alignment.center,
                            child: Icon(Icons.clear,color: Colors.white,),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                  /*      GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context, GlobalFunction.route(RoomDivices(room_id:widget.room_id,name:widget.room_name,route: widget.route,)));
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1000),
                              color: Color(AppTheme.primaryColor)
                            ),
                            alignment: Alignment.center,
                            child: Icon(Icons.clear,color: Colors.white,),
                          ),
                        ),*/
                        GestureDetector(
                          onTap: (){
                            Clipboard.setData(ClipboardData(text: widget.key_));
                            FlutterToastr.show(translator.translate('copy'), context, duration: FlutterToastr.lengthShort, position:  FlutterToastr.center);
                          },
                          child: Row(
                            children: [
                              Text(widget.key_,style: TextStyle(fontSize: 13.5,fontWeight: FontWeight.bold,color: Colors.black),),
                              SizedBox(width: 20,),
                              Icon(Icons.copy,color: Colors.red,)
                            ],
                          ),
                        )
                        /*GestureDetector(
                          onTap: (){
                            _webViewController.reload();
                          },
                          child: Icon(Icons.refresh,size: 30,),
                        )*/
                      ],
                    ),
                  ),
                  SizedBox(height:  MediaQuery.of(context).size.height*.05,),
                  GestureDetector(
                    onTap: (){
                      launchUrl("http://192.168.4.1/wifi");
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width*.5,
                      height:  MediaQuery.of(context).size.height*.065,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(AppTheme.primaryColor)
                      ),
                      alignment: Alignment.center,
                      child: Text(translator.translate('open_setting'),style: TextStyle(fontSize: 15,color: Colors.white),),
                    ),
                  ),
                /*  Expanded(child: WebView(
                    allowsInlineMediaPlayback: true,
                    navigationDelegate: (NavigationRequest request) {
                      print('allowing navigation to $request');
                      return NavigationDecision.navigate;
                    },
                    onPageStarted: (String url) {
                      print('Page started loading: $url');
                    },
                    onPageFinished: (String url) {
                      print('Page finished loading: $url');
                    },
                    onWebViewCreated: (controller) {
                      _webViewController = controller;
                    },
                    gestureNavigationEnabled: true,
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl:"http://192.168.4.1/wifi",
                  )),*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  static launchUrl(String url_) async {
    //https://api.whatsapp.com/send?phone=
    //https://wa.me/$number/?text=
    var url = url_;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}