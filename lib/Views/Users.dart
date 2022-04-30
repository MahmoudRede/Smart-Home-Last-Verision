import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Views/AddUser.dart';
import 'package:fssmarthome/Views/Custom/CustomAppBar.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

import '../Provider/AuthProvider.dart';
import '../Theme/AppTheme.dart';
import 'Custom/GlobalFunction.dart';

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
                  left: MediaQuery.of(context).size.width*.05,
                  right: MediaQuery.of(context).size.width*.05
              ),
              child: Column(
                children: [
                  CustomAppBar(title: translator.translate("users")),
                  SizedBox(height: MediaQuery.of(context).size.height*.02,),
                  Expanded(
                    child: ListView.builder(
                        itemCount: authProvider.users.length,
                        itemBuilder: (context,index){
                      return Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(authProvider.users[index].name),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(AppTheme.primaryColor)
                              ),
                              alignment: Alignment.center,
                              child: Text("اضافة جهاز",style: TextStyle(fontSize: 12,color: Colors.white),),
                            )
                          ],
                        ),
                      );
                    }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                            child:Text(translator.translate("adduser"),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),)
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
}
