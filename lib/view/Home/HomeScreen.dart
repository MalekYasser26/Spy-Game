import 'package:flutter/material.dart';
import 'package:spy_game/view/Home/Widgets/button_widget.dart';
import 'package:spy_game/view/Instructions/Instructions%20Screen.dart';

import '../Preparation/PreparationScreen.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

backgroundColor: Color(0xff161616),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Text("الجواسيس",style: TextStyle(color: Color(0xff818181),fontSize: 50,fontWeight: FontWeight.bold),),
           Image.asset('assets/images/Spy_logo.png',color: Color(0xff818181)),
           Padding(
             padding:  EdgeInsets.symmetric(horizontal: 40,vertical: 10),
             child: homeButton(home_text: "مش فاهم",button_icon: Icons.question_mark,
             ScreenRoute: InstructionsScreen(),),
           ),
           Padding(
             padding:  EdgeInsets.symmetric(horizontal: 40,vertical: 10),
             child: homeButton(home_text: "    ابدأ " , button_icon: Icons.play_arrow,
                 ScreenRoute: PreparationScreen()),
           ),


         ],



      )),
      floatingActionButton: FloatingActionButton(onPressed: () {
        print('fl');
      },
      backgroundColor: Color(0xffe7e7e7).withOpacity(.7),
        child: Icon(Icons.place,color: Colors.black,size: 30),
      ) ,

    );
  }
}
