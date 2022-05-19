// import 'package:flutter/material.dart';
// import 'package:localize_and_translate/localize_and_translate.dart';
// import 'package:provider/provider.dart';
//
// import '../Provider/RoomProvider.dart';
// import '../Theme/AppTheme.dart';
// import '../main.dart';
// class UserAuthRooms extends StatefulWidget {
//   const UserAuthRooms({Key? key}) : super(key: key);
//
//   @override
//   State<UserAuthRooms> createState() => _UserAuthRoomsState();
// }
//
// class _UserAuthRoomsState extends State<UserAuthRooms> {
//   int select=-1;
//   @override
//   Widget build(BuildContext context) {
//     var roomProvider= Provider.of<RoomProvider>(context, listen: false);
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Color(AppTheme.backGround),
//       body:Container(
//         width: MediaQuery.of(context).size.width,
//         margin: EdgeInsets.only(
//             left: MediaQuery.of(context).size.width*.05,
//             right: MediaQuery.of(context).size.width*.05,
//             top: MediaQuery.of(context).size.height*.1,
//             bottom: MediaQuery.of(context).size.height*.1
//         ),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: Colors.white
//         ),
//         padding: EdgeInsets.only(
//             left: MediaQuery.of(context).size.width*.05,
//             right: MediaQuery.of(context).size.width*.05,
//             top: MediaQuery.of(context).size.height*.025,
//             bottom: MediaQuery.of(context).size.height*.025
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(translator.translate('ChooseNewRoom'),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Color(AppTheme.yellowColor)),),
//             SizedBox(height:  MediaQuery.of(context).size.height*.025),
//             Expanded(
//               child: ListView.builder(
//                   itemCount: roomProvider.allRooms.length,
//                   itemBuilder: (context,index){
//                     return GestureDetector(
//                       onTap: () {
//                         setState((){
//                           select=roomProvider.allRooms[index].id;
//                         });
//                       },
//                       child: Column(
//                         children: [
//                           Container(
//                             margin: EdgeInsets.only(
//                                 bottom: MediaQuery.of(context).size.height*.03
//                             ),
//                             child: Row(
//                               children: [
//                                 select==roomProvider.allRooms[index].id? Icon(Icons.check_circle_outline,color: Color(AppTheme.yellowColor),):Icon(Icons.circle_outlined,color: Color(AppTheme.primaryColor),)
//                                 , SizedBox(width: 15,),
//                                 Container(
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10),
//                                       border: Border.all(color: Colors.black26,width: 1)
//                                   ),
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(10),
//                                     child: Image.network(roomProvider.allRooms[index].logo,
//                                       width: MediaQuery.of(context).size.width*.15,
//                                       height: MediaQuery.of(context).size.height*.05,
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(width: 15,),
//                                 Text(roomProvider.allRooms[index].name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
//
//                               ],
//                             ),
//                           ),
//                           index==roomProvider.allRooms.length-1?GestureDetector(
//                             onTap: (){
//                               // AddOther();
//                             },
//                             child: Container(
//                               padding: EdgeInsets.only(
//                                   bottom: MediaQuery.of(context).size.height*.02
//                               ),
//                               child: Row(
//                                 children: [
//                                   Icon(Icons.add,size: 30,),
//                                   SizedBox(width: 10,),
//                                   Text(translator.translate('AddAnother'),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
//                                 ],
//                               ),
//                             ),
//                           ):SizedBox()
//                         ],
//                       ),
//                     );
//                   }),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 GestureDetector(
//                   onTap: ()async{
//                     // if(select==-1){
//                     //   //FlutterToastr.show(translator.translate('pleaseSelectRoom'), context, duration: FlutterToastr.lengthLong, position:  FlutterToastr.center);
//                     // }
//                     // else{
//                     //   await roomProvider.addRoomToUser(MyApp.user_id, select);
//                     //   if(roomProvider.connection==200){
//                     //     FlutterToastr.show(translator.translate('RoomAddedSuccessfully'), context, duration: FlutterToastr.lengthLong, position:  FlutterToastr.center);
//                     //     Navigator.pop(context);
//                     //   }
//                     //   else{
//                     //     FlutterToastr.show(roomProvider.responceInfo["errors"], context, duration: FlutterToastr.lengthLong, position:  FlutterToastr.center);
//                     //   }
//                     // }
//                   },
//                   child: Container(
//                     width: MediaQuery.of(context).size.width*.35,
//                     height: MediaQuery.of(context).size.height*.06,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(20)),
//                         border: Border.all(color: Color(AppTheme.yellowColor),width: 1),
//                         color: Colors.white
//                     ),
//                     alignment: Alignment.center,
//                     child: Text(translator.translate('Add'),style: TextStyle(color: Color(AppTheme.yellowColor),fontSize: 16,fontWeight: FontWeight.bold),),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: (){
//                     Navigator.pop(context);
//                   },
//                   child: Container(
//                     width: MediaQuery.of(context).size.width*.35,
//                     height: MediaQuery.of(context).size.height*.06,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(20)),
//                         border: Border.all(color: Colors.black,width: 1),
//                         color: Colors.white
//                     ),
//                     alignment: Alignment.center,
//                     child: Text(translator.translate('Back'),style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
// }




import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fssmarthome/Assign/cubit/assign_bloc.dart';
import 'package:fssmarthome/Assign/cubit/assign_states.dart';
import 'package:fssmarthome/Provider/AuthProvider.dart';
import 'package:fssmarthome/Provider/RoomProvider.dart';
import 'package:fssmarthome/Provider/ServicesConfig.dart';
import 'package:fssmarthome/Views/Custom/GlobalFunction.dart';
import 'package:fssmarthome/main.dart';
import 'package:http/http.dart'as http;
import 'package:provider/provider.dart';

//import '../cubit/assign_states.dart';
class AssignedRoomScreen extends StatelessWidget {
  //const AssignedRoomScreen({Key? key}) : super(key: key);
  var body=GlobalFunction.getBody(27, 0, "id", "ASC", "all", "false", "true", ["user_id"], ["="], ["${MyApp.user_id}"]);

  @override
  Widget build(BuildContext context) {
    var roomProvider= Provider.of<RoomProvider>(context, listen: false);
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text('press'),
          onPressed: (){
            roomProvider.getUserRooms(body);
          },
        ),
      ),
    );
  }


}

