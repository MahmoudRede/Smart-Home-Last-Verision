import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

import '../../Base/Cash_Helper/cash_helper.dart';
import '../../Base/shared_preference_manger.dart';
import '../../Provider/AuthProvider.dart';
import '../../Theme/AppTheme.dart';
import '../Custom/CustomAppBar.dart';

class EditUser extends StatefulWidget {
  EditUser({Key? key}) : super(key: key);

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {

  @override
  void initState() {

    super.initState();
  }





  @override
  Widget build(BuildContext context) {

    var authProvider= Provider.of<AuthProvider>(context, listen: false);
    // authProvider.name.text='${SharedPreferenceManager.getData('userName')}';
    // authProvider.phone.text='${SharedPreferenceManager.getData('userPhone')}';
    // authProvider.email.text='${SharedPreferenceManager.getData('userEmail')}';
    return Scaffold(

      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 35,),
              CustomAppBar(title: translator.translate("Edit User")),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                child: Material(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                    margin: EdgeInsets.fromLTRB(5, 5, 0, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        Text('Name:',style: GoogleFonts.aBeeZee(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(AppTheme.primaryColor)
                        ),),
                        SizedBox(height: 10,),
                        TextFormField(
                          controller: authProvider.name,
                          decoration: InputDecoration(
                            hintText: 'User Name',
                            hintStyle: GoogleFonts.aBeeZee(
                                fontSize: 15,
                                color: Colors.black
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text('Email:',style: GoogleFonts.aBeeZee(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color:Color(AppTheme.primaryColor)
                        ),),
                        SizedBox(height: 10,),
                        TextFormField(
                          controller: authProvider.email,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: GoogleFonts.aBeeZee(
                                fontSize: 15,
                                color: Colors.black
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text('Phone:',style: GoogleFonts.aBeeZee(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(AppTheme.primaryColor)
                        ),),
                        SizedBox(height: 10,),
                        TextFormField(
                          controller: authProvider.phone,
                          decoration: InputDecoration(
                            hintText: 'Phone',
                            hintStyle: GoogleFonts.aBeeZee(
                                fontSize: 15,
                                color: Colors.black
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 45,),
                        Align(
                          alignment: Alignment.center,
                          child: MaterialButton(

                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)
                            ),
                            padding: EdgeInsets.fromLTRB(120, 15, 120, 15),
                            color: Color(AppTheme.primaryColor),
                            onPressed: (){

                              CashHelper.saveData(key: 'nameKey',value:   authProvider.name.text);
                              CashHelper.saveData(key: 'emailKey',value:  authProvider.email.text);
                              CashHelper.saveData(key: 'phoneKey',value:  authProvider.phone.text);

                            },
                            child: Text('Edit',style: GoogleFonts.aBeeZee(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white
                            ),),
                          ),
                        ),
                        SizedBox(height: 20,),

                      ],
                    ),
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}