import 'package:flutter/material.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/Home.dart';
import 'package:fssmarthome/Views/Login.dart';

import 'Views/Splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme:ThemeData(
          fontFamily: 'Poppins',
          accentColor: Color(AppTheme.primaryColor)
      ),
      debugShowCheckedModeBanner: false,
      routes: <String,WidgetBuilder>{
        '/mainPage':(BuildContext context)=>new Home(index: 0),
      },
      home:Splash(),

    );
  }
}

