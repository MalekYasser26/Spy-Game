import 'dart:math';

import 'package:dice_icons/dice_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spy_game/Providers/sharedlogic.dart';
import 'package:spy_game/view/Home/Widgets/button_widget.dart';
import 'package:spy_game/view/Preparation/Widget/Add%20widget.dart';
import 'package:spy_game/view/Preparation/Widget/Container_widget.dart';
import 'package:spy_game/view/Preparation/Widget/SubtractAdd.dart';
import 'package:spy_game/view/Roles/SelectionScreen.dart';
import 'package:spy_game/view/Timer/TimerScreen.dart';

class PreparationScreen extends StatefulWidget {
   PreparationScreen({Key? key}) : super(key: key);
  @override
  State<PreparationScreen> createState() => _PreparationScreenState();
}

class _PreparationScreenState extends State<PreparationScreen> {
  int playerCount =0 ;
  var spyrnd = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Color(0xff161616),
    appBar: AppBar(
      backgroundColor: Color(0xff161616),
      leading: IconButton(
        onPressed: () =>Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false),
        icon: Icon(Icons.home,size: 30) ,
         ),
      elevation: 0,
    ),
      body:Row(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8),
            child: Column(
                children: [
                  SizedBox(height:MediaQuery.of(context).size.height*0.24 ,),
                  Icon(Icons.people,size: 40,color: Color(0xff818181),),
                  SizedBox(height:MediaQuery.of(context).size.height*0.1 ,),
                  Image.asset('assets/images/Spy_logo.png',
                    height:MediaQuery.of(context).size.height*0.2,
                    width: MediaQuery.of(context).size.width*0.15,
                    color: Color(0xff818181),
                  ),
                  SizedBox(height:MediaQuery.of(context).size.height*0.1 ,),

                  Icon(Icons.watch_later_outlined,size: 40,color: Color(0xff818181),)

                ],

            ),
          ),
                SizedBox(width:MediaQuery.of(context).size.width*0.1 ,),

          Column(
            children: [
              Image.asset('assets/images/Spy_logo.png',
                width: MediaQuery.of(context).size.height*0.2,
                color: Color(0xff818181),
              ),  // LOGO
              SizedBox(height:MediaQuery.of(context).size.height*0.02,),
              Container_Widget(prep_text: "عددنا كام"),
              SizedBox(height:MediaQuery.of(context).size.height*0.02,),
              Row(
                children: [

                GestureDetector(
                  onTap: () {
                    if(playerCount>0)
                      playerCount--;
                    setState(() {
                    });
                  },
                    child: SubtractAdd_Widget(sign: "-",)),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text("$playerCount",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30)),
                  ),
                GestureDetector(
                    onTap: () {
                      playerCount++;
                      setState(() {
                      });
                    },

                    child: SubtractAdd_Widget(sign: "+"))
                ],
              ),      // FIRST CHOICE


              SizedBox(height:MediaQuery.of(context).size.height*0.08,),
              Container_Widget(prep_text: "كام جاسوس"),
              SizedBox(height:MediaQuery.of(context).size.height*0.03,),
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        if(Provider.of<SharedLogic>(context,listen: false).spyCount >0)
                          Provider.of<SharedLogic>(context,listen: false).spyCount--;
                        setState(() {
                        });
                      },
                      child: SubtractAdd_Widget(sign: "-",)),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text("${Provider.of<SharedLogic>(context,listen: false).spyCount
                    }",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30)),
                  ),
                  GestureDetector(
                      onTap: () {
                        if(Provider.of<SharedLogic>(context,listen: false).spyCount <playerCount-1)
                          Provider.of<SharedLogic>(context,listen: false).spyCount++;
                        setState(() {
                        });
                      },

                      child: SubtractAdd_Widget(sign: "+"))
                ],
              ), // SECOND CHOICE



              SizedBox(height:MediaQuery.of(context).size.height*0.08,),
              Container_Widget(prep_text: "كام دقيقه"),
              SizedBox(height:MediaQuery.of(context).size.height*0.03,),
              Row(
                children: [

                  GestureDetector(
                      onTap: () {
                        if(Provider.of<SharedLogic>(context,listen: false).min >0)
                          Provider.of<SharedLogic>(context,listen: false).min--;
                        setState(() {
                        });
                      },
                      child: SubtractAdd_Widget(sign: "-",)),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text("${Provider.of<SharedLogic>(context,listen: false).min}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30)),
                  ),
                  GestureDetector(
                      onTap: () {
                        Provider.of<SharedLogic>(context,listen: false).min++;
                        setState(() {
                        });
                      },

                      child: SubtractAdd_Widget(sign: "+"))
                ],
              ), // THIRD CHOICE

              CircleAvatar(
                backgroundColor: Color(0xff818181),
                child: IconButton(
                  onPressed: () {
                    Provider.of<SharedLogic>(context,listen: false).pc = playerCount;
                    Provider.of<SharedLogic>(context,listen: false).sc = Provider.of<SharedLogic>(context,listen: false).spyCount
                    ;
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>
                        SelectionScreen(changedsc:Provider.of<SharedLogic>(context,listen: false).spyCount)));
                    ;
                    setState(() {});
                  },
                  icon: Icon( Icons.play_arrow,color: Colors.black,),
                  ),
              ), // game start
            ],

          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.45 ,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: IconButton(onPressed: () {
                   print('random');
                   Provider.of<SharedLogic>(context,listen: false).spyCount = (Random().nextInt(playerCount)+1);
                   if(Provider.of<SharedLogic>(context,listen: false).spyCount ==playerCount){
                     Provider.of<SharedLogic>(context,listen: false).spyCount =Provider.of<SharedLogic>(context,listen: false).spyCount -1;
                     setState(() {});
                     print('equals');
                   }
                   setState(() {
                   });
                   print(Provider.of<SharedLogic>(context,listen: false).spyCount
                   );


                }, icon:Icon(DiceIcons.dice3,size: 40,color: Colors.white,) ),
              )


            ],
          )

        ],



      )
      ,

    );


  }
}
