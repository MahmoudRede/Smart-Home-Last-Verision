
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fssmarthome/Local/AppLanguage.dart';
import 'package:fssmarthome/Provider/DeviceProvider.dart';
import 'package:fssmarthome/Provider/RoomProvider.dart';

import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/Home.dart';
import 'package:fssmarthome/Views/Language.dart';
import 'package:fssmarthome/Views/Login.dart';
import 'package:fssmarthome/Views/TimePicker.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Local/AppLocalization.dart';
import 'Provider/AuthProvider.dart';
import 'Views/Splash.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await translator.init(
    assetsDirectory: 'assets/Langs/', valuesAsMap: {},
    localeType: LocalizationDefaultType.device,
    languagesList: <String>['ar', 'en'],
  );
  runApp(MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}
class MyApp extends StatefulWidget{
   static var user_id=0;
   static var user_name="";
  @override
  _MyAppState createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType();
    print(newLocale.languageCode);
    // ignore: invalid_use_of_protected_member
    //
    state!.setState(() => state.local = newLocale);
  }

}
class _MyAppState extends State<MyApp>{
  late Locale local;
  var lang;
  final GlobalKey<NavigatorState> navKey = GlobalKey();
//  AppPushNotifications appPushNotifications = AppPushNotifications();
  loadLang()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    setState(() {
      lang=pref.getString("lang");
    });
    if(lang!=null){
      MyApp.setLocale(context, lang);

    }
  }



  @override
  void initState() {
    setState(() {
      //  appPushNotifications.notificationSetup(navKey);
    });
    loadLang();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AuthProvider(),),
        ChangeNotifierProvider.value(value: RoomProvider(),),
        ChangeNotifierProvider.value(value: DeviceProvider(),),
      ],
      child: MaterialApp(
          /* localizationsDelegates: translator.delegates,
          locale: local,
          supportedLocales: translator.locals(),*/
        navigatorKey: navKey,
        debugShowCheckedModeBanner: false,
        theme:ThemeData(
            fontFamily: 'Poppins',
            accentColor: Color(0xff64B904)
        ),
        routes:  <String,WidgetBuilder>{
          '/mainPage':(BuildContext context)=>new Home(index: 0),
          '/profile':(BuildContext context)=>new Home(index: 4),
          '/rooms':(BuildContext context)=>new Home(index: 3),
          '/login':(BuildContext context)=>new Login(),

        },
          home: Splash(),
          localeResolutionCallback: (locale,supportedLocales){
            for( var supportedLocale in supportedLocales){
              if(supportedLocale.languageCode==locale!.languageCode && supportedLocale.countryCode == locale.countryCode){
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
        ),
    );
  }

}


