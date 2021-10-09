import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Theme/StaticList.dart';
import 'package:fssmarthome/Views/ConnectDevice.dart';
import 'package:fssmarthome/Views/Custom/GlobalFunction.dart';

class AddDevice extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<AddDevice>{
  int select =-1;
  int select2=-1;
  List <String>SwitchDeviceTypes=["1","2","3"];
  String SelectDevice="1";
  @override
  Widget build(BuildContext context) {
   return Container(
     padding: EdgeInsets.only(
         left: MediaQuery.of(context).size.width*.05,
         right: MediaQuery.of(context).size.width*.05,
       //  top: MediaQuery.of(context).size.height*.025,
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
                   child:index==0?
                   Container(
                     margin: EdgeInsets.only(
                         bottom: MediaQuery.of(context).size.height*.03
                     ),
                     child: Column(
                       children: [
                         Row(
                           children: [
                             select==index? Icon(Icons.check_circle_outline,size:20,color: Color(AppTheme.yellowColor),):Icon(Icons.circle_outlined,size: 20,color: Color(AppTheme.primaryColor),)
                             , SizedBox(width: 15,),
                             Text(StaticList.DevicesNames[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),)

                           ],
                         ),
                         SizedBox(height: 5,),
                         Row(
                           children: [
                             SizedBox(  width: MediaQuery.of(context).size.width*.1,),
                             Container(
                               width: MediaQuery.of(context).size.width*.8,
                               decoration: BoxDecoration(
                                   border: Border.all(color: Colors.black12,width: 1)
                               ),
                               padding: EdgeInsets.only(
                                 left: MediaQuery.of(context).size.width*.03,
                                 right: MediaQuery.of(context).size.width*.03,
                                 top: MediaQuery.of(context).size.height*.01,
                                 bottom: MediaQuery.of(context).size.height*.01,
                               ),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Row(
                                     children: [
                                       Text("Select The Type",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                                       SizedBox(width: 10,),
                                       GestureDetector(
                                         onTap: (){
                                           SelectTypes(context);
                                         },
                                         child: Container(
                                           width: MediaQuery.of(context).size.width*.15,
                                           height: MediaQuery.of(context).size.height*.037,
                                           decoration: BoxDecoration(
                                             borderRadius: BorderRadius.circular(20),
                                             color: Color(AppTheme.primaryColor)
                                           ),
                                           padding: EdgeInsets.only(
                                             left: MediaQuery.of(context).size.width*.025,
                                             right: MediaQuery.of(context).size.width*.025
                                           ),
                                           child: Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                             children: [
                                               Text(SelectDevice,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.white),),
                                               ImageIcon(AssetImage("assets/images/bottom.png"),color: Colors.white,)
                                             ],
                                           ),
                                         ),
                                       )
                                     ],
                                   ),
                                   SizedBox(height: MediaQuery.of(context).size.height*.005,),
                                   Text("Chose Divice",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Color(AppTheme.yellowColor)),),
                                   SizedBox(height: MediaQuery.of(context).size.height*.005,),
                                   GridView.builder(
                                     padding: EdgeInsets.only(
                                         left: MediaQuery.of(context).size.width * .03,
                                         right: MediaQuery.of(context).size.width * .03),
                                     primary: false,
                                     shrinkWrap: true,
                                     itemCount: 5,
                                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                         crossAxisCount: 2,
                                         mainAxisSpacing: 10,
                                         crossAxisSpacing: 10,
                                         childAspectRatio: 1 / .2),
                                     itemBuilder: (context, index) {
                                       return  GestureDetector(
                                         onTap: (){
                                           setState(() {
                                             select2=index;
                                           });
                                         },
                                         child: Row(
                                           children: [
                                             select2==index? Icon(Icons.check_circle_outline,color: Color(AppTheme.yellowColor),size: 20,):Icon(Icons.circle_outlined,color: Color(AppTheme.primaryColor),size: 20,)
                                             , SizedBox(width: 5,),
                                             Container(
                                               decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.circular(5),
                                                   border: Border.all(color: Colors.black26,width: 1),
                                                 color: Colors.black12.withOpacity(.05)
                                               ),
                                               padding: EdgeInsets.all(3),
                                               child: ClipRRect(
                                                 borderRadius: BorderRadius.circular(10),
                                                 child: Image.asset("assets/images/TV.png",
                                                   width: MediaQuery.of(context).size.width*.1-8,
                                                   height: MediaQuery.of(context).size.height*.04-8,
                                                 ),
                                               ),
                                             ),
                                             SizedBox(width: 15,),
                                             Text("TV",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),)

                                           ],
                                         ),
                                       );
                                     },
                                   ),
                                   SizedBox(height: MediaQuery.of(context).size.height*.005,),
                                 ],
                               ),
                             )
                           ],
                         )
                       ],
                     ),
                   ) :
                   Column(
                     children: [
                       Container(
                         margin: EdgeInsets.only(
                             bottom: MediaQuery.of(context).size.height*.03
                         ),
                         child: Row(
                           children: [
                             select==index? Icon(Icons.check_circle_outline,size: 20,color: Color(AppTheme.yellowColor),):Icon(Icons.circle_outlined,size: 20,color: Color(AppTheme.primaryColor),)
                             , SizedBox(width: 15,),
                             Container(
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(10),
                                   border: Border.all(color: Colors.black26,width: 1),
                                 color: Colors.black12
                               ),
                               padding: EdgeInsets.all(5),
                               child: ClipRRect(
                                 borderRadius: BorderRadius.circular(10),
                                 child: Image.asset(StaticList.DevicesImages[index],
                                   width: MediaQuery.of(context).size.width*.12-8,
                                   height: MediaQuery.of(context).size.height*.045-10,
                                 ),
                               ),
                             ),
                             SizedBox(width: 15,),
                             Text(StaticList.DevicesNames[index],style: TextStyle(fontWeight: FontWeight.bold,),)

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
                   Navigator.push(context, GlobalFunction.route(ConnectDevice()));
                 },
                 child: Container(
                 width: MediaQuery.of(context).size.width*.4,
                 height: MediaQuery.of(context).size.height*.06,
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.all(Radius.circular(20)),
                   border: Border.all(color: Color(AppTheme.yellowColor),width: 1)
                 ),
                 alignment: Alignment.center,
                 child: Text("Add",style: TextStyle(color: Color(AppTheme.yellowColor),fontSize: 16,fontWeight: FontWeight.bold),),
               ),
             ),
           ],
         )
       ],
     ),
   );
  }
  SelectTypes(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
          child:  Container(
            width: MediaQuery.of(context).size.width*.2,
            decoration: BoxDecoration(
              color: Colors.transparent,
              // borderRadius: BorderRadius.all(Radius.circular(20))
              // border: Border.all(color: Colors.black12,width: 2.0)
            )
            ,padding: EdgeInsets.only(
            top:  MediaQuery.of(context).size.height*0.01,
            bottom: MediaQuery.of(context).size.height*0.01,
            left: MediaQuery.of(context).size.width*0.05,
            right: MediaQuery.of(context).size.width*0.05,
          ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: SwitchDeviceTypes.length,
                    itemBuilder: (context,index){
                      return GestureDetector(
                          onTap: (){
                              setState(() {
                                SelectDevice=SwitchDeviceTypes[index];;
                              });
                            Navigator.pop(context);
                          },
                          child:Column(
                            children: [
                              SizedBox(height: 5,),
                              Container(
                                  margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*.005,top: MediaQuery.of(context).size.height*.005),
                                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*.005,top: MediaQuery.of(context).size.height*.005),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    //color: Color(h.mainColor)
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(SwitchDeviceTypes[index]+"  Device",style: TextStyle(color: Colors.black),)),
                              SizedBox(height: 5,),
                              SwitchDeviceTypes.length-1==index?SizedBox():Container(height: 1,width: MediaQuery.of(context).size.width,color:Color(AppTheme.primaryColor),)
                            ],
                          )
                      );
                    },
                  ),
                ],
              ),
            ),

          ),
        ));
  }
}