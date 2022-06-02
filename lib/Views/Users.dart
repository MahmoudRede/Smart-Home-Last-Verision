import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Views/AddUser.dart';
import 'package:fssmarthome/Views/Custom/CustomAppBar.dart';
import 'package:fssmarthome/Views/user_authorizedRoom.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import '../Assign/modules/user_Assigned_Rooms.dart';
import '../Base/Cash_Helper/cash_helper.dart';
import '../Provider/AuthProvider.dart';
import '../Provider/RoomProvider.dart';
import '../Theme/AppTheme.dart';
import 'Custom/GlobalFunction.dart';
import 'Edit_User/edit_user.dart';
import 'choose_user_rooms.dart';

class Users extends StatefulWidget {
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  bool loading =false;
  loadData()async{
    var authProvider= Provider.of<AuthProvider>(context, listen: false);
    await authProvider.getUsers();
    setState(() {
      loading=false;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  @override
  Widget build(BuildContext context) {
    final authProvider= Provider.of<AuthProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(AppTheme.backGround),
        body:loading?Center(child: CircularProgressIndicator.adaptive(),):Directionality(
          textDirection:translator.currentLanguage == 'ar' ?  TextDirection.rtl : TextDirection.ltr,
          child:  Container(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width*.03,
                  right: MediaQuery.of(context).size.width*.03
              ),
              child: Column(
                children: [
                  CustomAppBar(title: translator.translate("users")),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  // Expanded(
                  //   child: ListView.builder(
                  //       itemCount: authProvider.users.length,
                  //       itemBuilder: (context,index){
                  //     return Container(
                  //       margin: EdgeInsets.only(bottom: 20),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Text(authProvider.users[index].name),
                  //           Container(
                  //             padding: EdgeInsets.all(5),
                  //             decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(10),
                  //               color: Color(AppTheme.primaryColor)
                  //             ),
                  //             alignment: Alignment.center,
                  //             child: Text("اضافة جهاز",style: TextStyle(fontSize: 12,color: Colors.white),),
                  //           )
                  //         ],
                  //       ),
                  //     );
                  //   }),
                  // ),
                  SizedBox(height: 10,),
                  Expanded(
                      child: GridView.count(
                        mainAxisSpacing: 7,
                        crossAxisSpacing: 7,
                        childAspectRatio: 1/1.25,
                        crossAxisCount: 2,
                        padding:EdgeInsets.fromLTRB(10,0,10, 0),
                        children: List.generate(authProvider.users.length, (index) =>builsUserItem(index)
                        ),
                      )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 5,),
                      GestureDetector(
                        onTap: ()async{
                          Navigator.push(context, GlobalFunction.route(AddUser()));
                        },
                        child: Container(
                            height: MediaQuery.of(context).size.height*.065,
                            width: MediaQuery.of(context).size.width*.8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color:Color(AppTheme.primaryColor)
                            ),
                            alignment: Alignment.center,
                            child:Text(translator.translate("add new user"),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),)
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                ],
              ),
            ),
        ),
      ),
    );
  }
  AddDevice(){
    TextEditingController device_number=new TextEditingController();
    TextEditingController room_id=new TextEditingController();
    final formKey=GlobalKey<FormState>();
    bool loading =false;
    showDialog(
        context: context,
        builder: (BuildContext context) =>StatefulBuilder(
          builder: (BuildContext context, StateSetter setState)=> Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.black87.withOpacity(.75),
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width*.05,
                  right: MediaQuery.of(context).size.width*.05,
                  top: MediaQuery.of(context).size.height*.1,
                  bottom: MediaQuery.of(context).size.height*.1
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white
              ),
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width*.05,
                  right: MediaQuery.of(context).size.width*.05,
                  top: MediaQuery.of(context).size.height*.08,
                  bottom: MediaQuery.of(context).size.height*.08
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: ()async{
                            if(formKey.currentState!.validate()) {
                              setState(() {
                                loading = true;
                              });
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width*.35,
                            height: MediaQuery.of(context).size.height*.06,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                border: Border.all(color: Color(AppTheme.yellowColor),width: 1),
                                color: loading?Colors.black12:Colors.white
                            ),
                            alignment: Alignment.center,
                            child: Text(translator.translate('Add'),style: TextStyle(color: Color(AppTheme.yellowColor),fontSize: 16,fontWeight: FontWeight.bold),),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width*.35,
                            height: MediaQuery.of(context).size.height*.06,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                border: Border.all(color: Colors.black,width: 1),
                                color: Colors.white
                            ),
                            alignment: Alignment.center,
                            child: Text(translator.translate('Back'),style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }


  Widget builsUserItem(int index){
    var authProvider= Provider.of<AuthProvider>(context, listen: false);
    var roomProvider= Provider.of<RoomProvider>(context, listen: false);

   return InkWell(
      onTap: (){
        CashHelper.saveData(key: 'userId',value: authProvider.users[index].id);
        CashHelper.saveData(key: 'userName',value: authProvider.users[index].name);
        print('////////////////////////////////////////////');
        print(authProvider.users[index].id);
        print('${ CashHelper.getData(key: 'userId')}');
        print('////////////////////////////////////////////');
        roomProvider.getUserRoom( authProvider.users[index].id);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>UserAuthRooms()));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Material(
              elevation: 7,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7)

              ),
              child: Container(
                padding: EdgeInsets.fromLTRB(10,20,10, 10),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7)
                ),
                child: Column(
                  children: [
                    Image(image: AssetImage(
                      'assets/images/man.png',

                    ),
                      height: 50,
                      width: 50,
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(onPressed: (){
                          print('${authProvider.users[index].id}');
                          // authProvider.isClick=true;
                          CashHelper.saveData(key: 'userF',value: authProvider.users[index].id);
                          authProvider.getUser(authProvider.users[index].id);
                          //  await SharedPreferenceManager.addData('userName','${authProvider.users[index].name}' );
                          // await  SharedPreferenceManager.addData('userEmail','${authProvider.users[index].email}' );
                          // await  SharedPreferenceManager.addData('userPhone','${authProvider.users[index].phone}');
                          // await SharedPreferenceManager.addData('userId','${authProvider.users[index].id}' );
                          //  print('${authProvider.users[index].name} \n ${authProvider.users[index].email} \n ${authProvider.users[index].phone}');
                          //  // authProvider.getUser(SharedPreferenceManager.getData('userId'));
                          //  // loadData()async{
                          //  //   var authProvider=Provider.of<AuthProvider>(context, listen: false);
                          //  //   setState(() {
                          //  //     authProvider.name.text=authProvider.user!.name;
                          //  //     authProvider.phone.text=authProvider.user!.phone;
                          //  //     authProvider.email.text=authProvider.user!.email;
                          //  //   });
                          //  // }
                          //
                          Navigator.push(context, MaterialPageRoute(builder: (_){
                            return EditUser();
                          }));
                        }, icon: Icon(Icons.edit,color: Color(AppTheme.primaryColor),)),
                        Spacer(),
                        IconButton(onPressed: (){
                          authProvider.removeUsers(authProvider.users[index].id);
                        }, icon: Icon(Icons.delete,color: Colors.red,))

                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: Material(
              elevation: 7,
              color: Color(AppTheme.primaryColor),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                child: Text(translator.translate('${authProvider.users[index].name}'),style: TextStyle(
                  fontSize: 15,
                  color: Colors.white
                ),),
              ),
            ),
          ),

        ],
      )
    );
  }
}
