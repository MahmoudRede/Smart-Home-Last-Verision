import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import 'Custom/CustomAppBar.dart';


class ShowUsers extends StatelessWidget {
  const ShowUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomAppBar(title: 'Users',),

              SizedBox(height: 10,),
              Expanded(
                child: GridView.count(
                  mainAxisSpacing: 7,
                  crossAxisSpacing: 7,
                  childAspectRatio: 1/.9,
                  crossAxisCount: 2,
                  padding:EdgeInsets.fromLTRB(10,0,10, 0),
                  children: List.generate(10, (index) => Material(
                    elevation: 10,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)

                    ),
                    child: Container(
                      margin:EdgeInsets.fromLTRB(10,10,10, 10) ,
                      padding: EdgeInsets.fromLTRB(10,10,10, 10),
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
                          SizedBox(height: 25,),
                          Text('User Name',style: TextStyle(
                            fontSize: 18,
                          ),)
                        ],
                      ),
                    ),
                  )
                  ),
                )
              ),


        ],
    ),
    ),
      ),
    );
  }
}
