import 'package:flutter/material.dart';
import 'package:fssmarthome/Views/user_screen.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection:translator.currentLanguage == 'ar' ?  TextDirection.rtl : TextDirection.ltr,
        child: UserScreenContainer(),
      ),
    );
  }
}
