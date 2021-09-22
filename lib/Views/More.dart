import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fssmarthome/Theme/AppTheme.dart';
import 'package:fssmarthome/Views/Custom/CustomAppBar.dart';

class More extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<More>{
  TextEditingController name =new TextEditingController();
  TextEditingController email =new TextEditingController();
  TextEditingController phone =new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  loadData(){
    setState(() {
      name.text="Sharaf Muhamad";
      phone.text="01117176682";
      email.text="sharaf@mail.com";
    });
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        Navigator.pushNamedAndRemoveUntil(context,"/mainPage", (route) => false);
        return true;
      },
      child: Scaffold(
        backgroundColor: Color(AppTheme.backGround),
        body:SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width*.05,
              right: MediaQuery.of(context).size.width*.05
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamedAndRemoveUntil(context,"/mainPage", (route) => false);
                      },
                      child: Padding(
                        padding:  EdgeInsets.only(top: 8),
                        child: Icon(Icons.arrow_back_ios),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*.13,
                      width: MediaQuery.of(context).size.width*.55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(1000),
                              bottomRight: Radius.circular(1000)
                          ),
                          color: Colors.white
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width*.02,
                        right: MediaQuery.of(context).size.width*.02,
                      ),
                      child: Text("Profile",textAlign: TextAlign.center,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Color(AppTheme.yellowColor)),),
                    ),
                    Icon(Icons.arrow_back_ios,color: Color(AppTheme.backGround),)
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height*.05,),
                Container(
                  width: MediaQuery.of(context).size.width,
                 // height: MediaQuery.of(context).size.height*.65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                  ),
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height*.02,
                    bottom: MediaQuery.of(context).size.height*.03,
                    left: MediaQuery.of(context).size.width*.05,
                    right:  MediaQuery.of(context).size.width*.05
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height*.04,),
                      Text("Name :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                      SizedBox(height: 3,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black12
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10,right: 10)
                          ),
                          controller: name,
                        ),
                      ),
                      //////////////////////
                      SizedBox(height: MediaQuery.of(context).size.height*.04,),
                      Text("Email :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                      SizedBox(height: 3,),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black12
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 10,right: 10)
                          ),
                          controller: email,
                        ),
                      ),
                      ////////////////////
                      SizedBox(height: MediaQuery.of(context).size.height*.04,),
                      Text("Phone :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                      SizedBox(height: 3,),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black12
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 10,right: 10)
                          ),
                          controller: phone,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.05,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height*.06,
                            width: MediaQuery.of(context).size.width*.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(AppTheme.primaryColor)
                            ),
                            alignment: Alignment.center,
                            child:Text("Edit",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),)
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
