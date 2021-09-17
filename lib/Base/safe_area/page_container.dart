import 'dart:io';
import 'package:flutter/material.dart';


class PageContainer extends StatelessWidget {
  final Widget child;
  const PageContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Platform.isIOS ? Colors.white : Colors.green,
        child: SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus( FocusNode());
            },
            child: child,
          ),
        ));
  }
}
