import 'dart:math';
import 'package:flutter_restart/flutter_restart.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spy_game/view/Home/HomeScreen.dart';
import 'package:spy_game/view/Home/Widgets/button_widget.dart';
import 'package:spy_game/view/Roles/NormalPlayerScreen.dart';
import 'package:spy_game/view/Roles/SpyScreen.dart';
import 'package:spy_game/view/Timer/TimerScreen.dart';

import '../../Providers/sharedlogic.dart';

class SelectionScreen extends StatelessWidget {
   SelectionScreen({Key? key, required this.changedsc}) : super(key: key);
  int rndCode =0 ;
  int count = 0 ;
   int changedsc ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff161616),
      appBar: AppBar(
        backgroundColor: Color(0xff161616),
        leading: IconButton(
          onPressed: () =>    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false),
          icon: Icon(Icons.home,size: 30) ,
        ),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("ابصم هنا", style: TextStyle(color: Color(0xff818181),fontSize: 30,fontWeight: FontWeight.bold),),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 8),
              child: GestureDetector(
                onTap: () {
              rndCode = (Random().nextInt(2)+1);
              print("                  ");
              if(Provider.of<SharedLogic>(context,listen: false).spyCount==0&& !(Provider.of<SharedLogic>(context,listen: false).pc==0)){
                print("person first");
                Provider.of<SharedLogic>(context,listen: false).pc--;
                Navigator.push(context, MaterialPageRoute(builder: (context) => NormalPlayerScreen(),));}
                else if (Provider.of<SharedLogic>(context,listen: false).pc==1){
    if (count==Provider.of<SharedLogic>(context,listen: false).sc){
    print("perssoon");
    Provider.of<SharedLogic>(context,listen: false).pc--;
    Navigator.push(context, MaterialPageRoute(builder: (context) => NormalPlayerScreen(),));
    }
    else if (count <Provider.of<SharedLogic>(context,listen: false).sc){
    print("spyyy");
    Provider.of<SharedLogic>(context,listen: false).pc--;
    Provider.of<SharedLogic>(context,listen: false).spyCount--;
    Navigator.push(context, MaterialPageRoute(builder: (context) => SpyScreen(),));
    }

    }
    else if(Provider.of<SharedLogic>(context,listen: false).spyCount<
    Provider.of<SharedLogic>(context,listen: false).pc){
    if(rndCode==1){
    if (count==Provider.of<SharedLogic>(context,listen: false).sc) {
    print("person sure");
    Provider.of<SharedLogic>(context, listen: false).pc--;
    Navigator.push(context, MaterialPageRoute(builder: (context) => NormalPlayerScreen(),));

    } else {
    print('SPY');
    count++;
    Provider.of<SharedLogic>(context,listen: false).spyCount--;
    Provider.of<SharedLogic>(context,listen: false).pc--;
    Navigator.push(context, MaterialPageRoute(builder: (context) => SpyScreen(),));
    }}
    if (rndCode ==2){
    print("PLAYER");
    Provider.of<SharedLogic>(context,listen: false).pc--;
    Navigator.push(context, MaterialPageRoute(builder: (context) => NormalPlayerScreen(),));

    }
    }
    else if (Provider.of<SharedLogic>(context,listen: false).spyCount==Provider.of<SharedLogic>(context,listen: false).pc
     &&Provider.of<SharedLogic>(context,listen: false).pc>0){
    print("spy sure");
    Provider.of<SharedLogic>(context,listen: false).pc--;
    Provider.of<SharedLogic>(context,listen: false).spyCount--;
    Navigator.push(context, MaterialPageRoute(builder: (context) => SpyScreen(),));
    }
    else if(Provider.of<SharedLogic>(context,listen: false).pc==0){
                Navigator.push(context, MaterialPageRoute(builder: (context) => TimerScreen(),)) ;
              }

    print("player count is ${Provider.of<SharedLogic>(context,listen: false).pc}");
    print("count is $count");
    print("changedsc count is ${Provider.of<SharedLogic>(context,listen: false).spyCount}");
    } ,

                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    color: Color(0xff818181)

                  ),
                  child: Icon(Icons.fingerprint,size:MediaQuery.of(context).size.height*0.09 ,
                    color: Colors.black,)),
              ),
            ),


          ],


        ),
      ),



    );
  }
}
