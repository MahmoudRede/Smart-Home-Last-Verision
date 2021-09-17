import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/AllRooms.dart';
import 'package:fssmarthome/Views/MainPage.dart';
import 'package:fssmarthome/Views/More.dart';
import 'package:fssmarthome/Views/RemoteControl.dart';
import 'package:fssmarthome/Views/VoiceControl.dart';
class Home extends StatefulWidget {
  int index;
  Home({required this.index});
  @override
  _State createState() => _State(index: this.index);
}
class _State extends State<Home> {
  static GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int index;
  _State({required this.index});
  int _currentIndex=0;
  List<Widget>itemsUi=[
  MainPage(),
  VoiceControl(),
  RemoteControl(),
  AllRooms(),
  More()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _currentIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body:itemsUi[_currentIndex] ,
        bottomNavigationBar: BottomNavigationBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color(AppTheme.yellowColor),
            selectedFontSize: 12,
            unselectedItemColor: Color(AppTheme.primaryColor),
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
                // print('${index}index');
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon:ImageIcon(AssetImage("assets/images/barIcons/home.png"),size: 20,),
                  title:  Text('Home',style: TextStyle(height: 1.8,fontSize: 11),)),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/barIcons/voice-control 1.png"),size: 20,),
                  title: Text('Voive',style: TextStyle(height: 1.8,fontSize: 11),)),
              BottomNavigationBarItem(
                  icon:  ImageIcon(AssetImage("assets/images/barIcons/remote-control 1.png"),size: 20,),
                  title: Text('Romote',style: TextStyle(height: 1.8,fontSize: 11),)),
              BottomNavigationBarItem(
                  icon:  ImageIcon(AssetImage("assets/images/rooms/livingroom.png"),size: 20,),
                  title: Text('Rooms',style: TextStyle(height: 1.8,fontSize: 11),)),
              BottomNavigationBarItem(
                  icon:  Container(
                    height: 22,
                    padding: EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 4,
                          height: 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:_currentIndex==4?Color(AppTheme.yellowColor): Color(AppTheme.primaryColor)
                          ),
                        ),
                        SizedBox(width: 4,),
                        Container(
                          width: 4,
                          height: 4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: _currentIndex==4?Color(AppTheme.yellowColor): Color(AppTheme.primaryColor)
                          ),
                        ),
                        SizedBox(width: 4,),
                        Container(
                          width: 4,
                          height: 4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: _currentIndex==4?Color(AppTheme.yellowColor): Color(AppTheme.primaryColor)
                          ),
                        )
                      ],
                    ),
                  ),
                  title: Text('More',style: TextStyle(height: 1.8,fontSize: 11),)),

            ]),),
    );
  }
}