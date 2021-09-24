import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';

class TimePicker1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return _state();
  }
}
class _state extends State<TimePicker1>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
           time(context)
          ],
        ),
      ),
    );
  }
  Widget time(BuildContext context){
    return CupertinoRoundedDatePicker.show(
      context,
      textColor: Colors.white,
      era: EraMode.BUDDHIST_YEAR,
      background: Colors.red,
      borderRadius: 16,
      initialDatePickerMode: CupertinoDatePickerMode.date,
      onDateTimeChanged: (newDateTime) {
        //
      },
    );
  }
}
