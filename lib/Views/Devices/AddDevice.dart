import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Theme/StaticList.dart';

class AddDevice extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<AddDevice>{
  int select =-1;
  @override
  Widget build(BuildContext context) {
   return Container(
     padding: EdgeInsets.only(
         left: MediaQuery.of(context).size.width*.05,
         right: MediaQuery.of(context).size.width*.05,
         top: MediaQuery.of(context).size.height*.025,
         bottom: MediaQuery.of(context).size.height*.025
     ),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text("Choose Device",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Color(AppTheme.yellowColor)),),
         SizedBox(height:  MediaQuery.of(context).size.height*.025),
         ListView.builder(
             primary: false,shrinkWrap: true,
               itemCount: StaticList.DevicesImages.length,
               itemBuilder: (context,index){
                 return GestureDetector(
                   onTap: () {
                     setState((){
                       select=index;
                     });
                   },
                   child: Column(
                     children: [
                       Container(
                         margin: EdgeInsets.only(
                             bottom: MediaQuery.of(context).size.height*.03
                         ),
                         child: Row(
                           children: [
                             select==index? Icon(Icons.check_circle_outline,color: Color(AppTheme.yellowColor),):Icon(Icons.circle_outlined,color: Color(AppTheme.primaryColor),)
                             , SizedBox(width: 15,),
                             Container(
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(10),
                                   border: Border.all(color: Colors.black26,width: 1)
                               ),
                               padding: EdgeInsets.all(4),
                               child: ClipRRect(
                                 borderRadius: BorderRadius.circular(10),
                                 child: Image.asset(StaticList.DevicesImages[index],
                                   width: MediaQuery.of(context).size.width*.15-8,
                                   height: MediaQuery.of(context).size.height*.05-8,
                                 ),
                               ),
                             ),
                             SizedBox(width: 15,),
                             Text(StaticList.DevicesNames[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)

                           ],
                         ),
                       ),
                     ],
                   ),
                 );
               }),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             GestureDetector(
               onTap: (){
                // Navigator.pop(context);
               },
               child: Container(
                 width: MediaQuery.of(context).size.width*.4,
                 height: MediaQuery.of(context).size.height*.06,
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.all(Radius.circular(20)),
                     color: Color(AppTheme.yellowColor)
                 ),
                 alignment: Alignment.center,
                 child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
               ),
             ),
           ],
         )
       ],
     ),
   );
  }
}