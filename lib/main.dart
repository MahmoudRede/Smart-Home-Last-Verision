
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/Home.dart';
import 'package:fssmarthome/Views/Language.dart';
import 'package:fssmarthome/Views/Login.dart';
import 'package:fssmarthome/Views/TimePicker.dart';
import 'Views/Splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      Phoenix(child: MyApp())
  );
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
          fontFamily: 'Poppins',
          accentColor: Color(0xff64B904)
      ),
      routes:  <String,WidgetBuilder>{
        '/mainPage':(BuildContext context)=>new Home(index: 0),
        '/profile':(BuildContext context)=>new Home(index: 4),
        '/login':(BuildContext context)=>new Login(),

      },
      home:Splash(),
    );
  }
}


